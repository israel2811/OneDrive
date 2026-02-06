import os
import asyncio
from langchain_anthropic import ChatAnthropic
from langchain_google_genai import ChatGoogleGenerativeAI
from browser_use import Agent
from browser_use.browser.browser import Browser, BrowserConfig
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

async def main():
    print("🚀 INICIANDO FUSIÓN ANTIGRAVITY...")

    # Validate Keys
    if not os.getenv("ANTHROPIC_API_KEY") or not os.getenv("GEMINI_API_KEY"):
        print("❌ Error: Faltan API Keys. Por favor configúralas en el archivo .env")
        return

    # --- AGENTE 1: EL PILOTO (CLAUDE 3.5 SONNET) ---
    piloto = ChatAnthropic(
        model_name="claude-3-5-sonnet-20240620", 
        temperature=0,
        api_key=os.getenv("ANTHROPIC_API_KEY")
    )

    # --- AGENTE 2: EL CEREBRO (GEMINI 3 / 1.5 PRO) ---
    # Try using the latest pro model available
    cerebro = ChatGoogleGenerativeAI(
        model="gemini-1.5-pro-latest", # O gemini-2.0-flash-exp si está disponible
        google_api_key=os.getenv("GEMINI_API_KEY")
    )

    # --- CONFIGURACIÓN DEL NAVEGADOR ---
    # Usamos tu Chrome real 
    # IMPORTANTE: Chrome debe estar abierto con: chrome.exe --remote-debugging-port=9222
    browser = Browser(
        config=BrowserConfig(
            chrome_instance_path='C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe',
        )
    )

    # --- MISIÓN DE FASE 1 (NAVEGACIÓN - Claude) ---
    print("👨✈️ CLAUDE: Tomando el control del navegador para buscar información...")
    
    task_navegacion = """
    1. Ve a Wikipedia y busca 'Computación Cuántica'.
    2. Entra al artículo principal.
    3. Copia el primer párrafo del artículo.
    4. Devuélveme ese texto.
    """

    agente_navegador = Agent(
        task=task_navegacion,
        llm=piloto, 
        browser=browser,
    )

    # Ejecutamos la navegación
    try:
        historial = await agente_navegador.run()
        texto_encontrado = historial.final_result()
    except Exception as e:
        print(f"❌ Error durante la navegación: {e}")
        texto_encontrado = None

    if texto_encontrado:
        print("\n✅ CLAUDE: Misión cumplida. Datos extraídos.")
        print(f"📄 Texto: {texto_encontrado[:100]}...") # Show snippet
        print("🧠 GEMINI: Recibiendo datos. Iniciando análisis profundo...")

        # --- MISIÓN DE FASE 2 (ANÁLISIS - Gemini) ---
        prompt_analisis = f"""
        Tengo este texto que mi compañero Claude extrajo de la web.
        
        TEXTO:
        {texto_encontrado}
        
        TU TAREA:
        1. Explícame esto como si tuviera 5 años.
        2. Crea una lista de puntos clave.
        """
        
        # Gemini procesa la información
        try:
            respuesta_final = cerebro.invoke(prompt_analisis)
            print("\n✨ RESULTADO DE LA FUSIÓN:")
            print(respuesta_final.content)
        except Exception as e:
             print(f"❌ Error durante el análisis de Gemini: {e}")
    
    else:
        print("❌ Claude no pudo traer la información.")

    await browser.close()

if __name__ == '__main__':
    asyncio.run(main())
