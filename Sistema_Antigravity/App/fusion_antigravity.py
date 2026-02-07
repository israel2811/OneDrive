"""
Pipeline de fusion multi-IA usado por gravity_app.

Diseñado para ser minimalista, tolerante a errores y 100 % ASCII.
"""

import asyncio
import logging
import os
import time
from functools import lru_cache
from typing import Iterable, List

from dotenv import load_dotenv
from langchain_anthropic import ChatAnthropic
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_openai import ChatOpenAI

try:
    from diskcache import Cache
except Exception:  # pragma: no cover - dependency optional
    Cache = None

# Opcional: solo se usa en main_demo; evita fallos cuando no esta instalado Brave
try:
    from browser_use import Agent
    from browser_use.browser.browser import Browser, BrowserConfig
except Exception:  # pragma: no cover - dependencia opcional
    Agent = None
    Browser = None
    BrowserConfig = None

load_dotenv()

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
)
logger = logging.getLogger("fusion_antigravity")

CACHE_TTL = 3600  # segundos
cache = Cache(".cache_antigravity") if Cache else None


# --------------------------------------------------------------------------- #
# Utilidades
# --------------------------------------------------------------------------- #
def _missing_keys(required: Iterable[str]) -> List[str]:
    return [key for key in required if not os.getenv(key)]


def _invoke_with_retry(client, prompt: str, attempts: int = 2) -> str:
    """Llama al cliente LangChain con reintentos simples."""
    last_exc: Exception | None = None
    for attempt in range(1, attempts + 1):
        try:
            msg = client.invoke(prompt)
            return getattr(msg, "content", str(msg))
        except Exception as exc:  # pragma: no cover - depende de red
            last_exc = exc
            logger.warning("Intento %s/%s fallo: %s", attempt, attempts, exc)
            time.sleep(0.25)
    raise RuntimeError(last_exc or "Fallo desconocido")


@lru_cache(maxsize=6)
def _get_client(tag: str, speed: str):
    """Clientes persistentes por modelo y modo (fast/deep)."""
    if tag == "Claude":
        model = "claude-3-haiku-20240307" if speed == "fast" else "claude-3-5-sonnet-20240620"
        return ChatAnthropic(model_name=model, temperature=0, api_key=os.getenv("ANTHROPIC_API_KEY"))
    if tag == "Gemini":
        model = "gemini-1.5-flash-latest" if speed == "fast" else "gemini-1.5-pro-latest"
        return ChatGoogleGenerativeAI(model=model, google_api_key=os.getenv("GEMINI_API_KEY"))
    # OpenAI / Core
    model = "gpt-4o-mini" if speed == "fast" else "gpt-4o"
    return ChatOpenAI(model=model, api_key=os.getenv("OPENAI_API_KEY"))


# --------------------------------------------------------------------------- #
# API principal
# --------------------------------------------------------------------------- #
async def process_request(prompt: str, model_type: str = "Core (OpenAI - General)", speed: str = "fast") -> str:
    """
    Procesa un prompt usando el modelo seleccionado y devuelve la respuesta.

    model_type: contiene 'Claude', 'Gemini' o 'OpenAI/Core'.
    speed: 'fast' usa modelos flash/mini, 'deep' usa modelos premium.
    """
    prompt = prompt or ""
    speed = speed.lower()
    tag = "OpenAI"
    required = ["OPENAI_API_KEY"]

    if "Claude" in model_type:
        tag = "Claude"
        required = ["ANTHROPIC_API_KEY"]
    elif "Gemini" in model_type:
        tag = "Gemini"
        required = ["GEMINI_API_KEY"]

    missing = _missing_keys(required)
    if missing:
        return f"[Error] Falta configurar: {', '.join(missing)}"

    client = _get_client(tag, speed)

    cache_key = None
    if cache:
        cache_key = f"{tag}:{speed}:{hash(prompt)}"
        cached = cache.get(cache_key)
        if cached:
            logger.info("Cache hit para %s", cache_key)
            return cached

    logger.info("Procesando con %s (%s)", tag, speed)

    try:
        result = _invoke_with_retry(client, prompt)
        if cache and cache_key:
            cache.set(cache_key, result, expire=CACHE_TTL)
        return result
    except Exception as exc:
        logger.error("Error al procesar con %s: %s", tag, exc)
        return f"[Error] No se pudo obtener respuesta de {tag}: {exc}"


# --------------------------------------------------------------------------- #
# Demo standalone opcional
# --------------------------------------------------------------------------- #
async def main_demo() -> None:
    print("Iniciando demo rapida...")
    print(await process_request("Hola, presentate brevemente.", "Core (OpenAI - General)", speed="fast"))

    if not (Agent and Browser and BrowserConfig):
        print("browser_use no esta disponible; omitiendo demo de navegador.")
        return

    if _missing_keys(["ANTHROPIC_API_KEY", "GEMINI_API_KEY"]):
        print("Faltan llaves para la demo avanzada; saliendo.")
        return

    piloto = ChatAnthropic(
        model_name="claude-3-5-sonnet-20240620",
        temperature=0,
        api_key=os.getenv("ANTHROPIC_API_KEY"),
    )
    cerebro = ChatGoogleGenerativeAI(
        model="gemini-1.5-pro-latest",
        google_api_key=os.getenv("GEMINI_API_KEY"),
    )

    browser = Browser(config=BrowserConfig(cdp_url="http://127.0.0.1:9222"))
    task_navegacion = (
        "Ve a Wikipedia, abre 'Computacion cuantica', copia el primer parrafo y devuelvelo."
    )
    agente_navegador = Agent(task=task_navegacion, llm=piloto, browser=browser)

    try:
        historial = await agente_navegador.run()
        texto_encontrado = historial.final_result()
        prompt_analisis = (
            "Resume en viñetas y explica para un niño de 8 años este texto:\n"
            f"{texto_encontrado}"
        )
        analisis = cerebro.invoke(prompt_analisis)
        print("Analisis Gemini:\n", analisis.content)
    finally:
        await browser.close()


if __name__ == "__main__":
    asyncio.run(main_demo())
