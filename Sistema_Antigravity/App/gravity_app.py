import asyncio
import os
import tempfile

import streamlit as st
from gtts import gTTS

from fusion_antigravity import process_request


def hablar(texto: str) -> None:
    """Convierte texto a audio y lo reproduce."""
    try:
        tts = gTTS(text=texto, lang="es")
        with tempfile.NamedTemporaryFile(delete=False, suffix=".mp3") as fp:
            tts.save(fp.name)
            st.audio(fp.name, format="audio/mp3")
    except Exception as exc:
        st.error(f"Error de audio: {exc}")


def run_request_sync(prompt: str, modelo: str, velocidad: str) -> str:
    """Puente sincrono para llamar al pipeline asincrono."""
    if "Claude" in modelo:
        model_type = "Claude (Coding)"
    elif "Gemini" in modelo:
        model_type = "Gemini (Creative)"
    else:
        model_type = "Core (OpenAI - General)"

    try:
        return asyncio.run(process_request(prompt, model_type=model_type, speed=velocidad))
    except Exception as exc:
        return f"[Error] No se pudo procesar la solicitud: {exc}"


st.set_page_config(
    page_title="Gravity V2: Antigravity Hub",
    page_icon=":globe_with_meridians:",
    layout="wide",
)

# --------------------------------------------------------------------------- #
# Barra lateral
# --------------------------------------------------------------------------- #
with st.sidebar:
    st.header("Configuracion neural")

    modelo = st.radio(
        "Elige el cerebro activo:",
        [
            "Gravity (Claude - Coding)",
            "Antigravity (Gemini - Creativo)",
            "Core (OpenAI - General)",
        ],
    )

    velocidad = st.radio(
        "Velocidad / costo:",
        ["fast", "deep"],
        format_func=lambda x: "Rapido (flash/mini)" if x == "fast" else "Profundo (modelos premium)",
    )

    st.divider()

    st.header("Llaves de acceso")
    gemini_key = st.text_input("Gemini API Key (Google AI Studio)", type="password")
    claude_key = st.text_input("Claude API Key", type="password")
    openai_key = st.text_input("OpenAI API Key", type="password")

    if gemini_key:
        os.environ["GEMINI_API_KEY"] = gemini_key
    if claude_key:
        os.environ["ANTHROPIC_API_KEY"] = claude_key
    if openai_key:
        os.environ["OPENAI_API_KEY"] = openai_key

    st.divider()

    st.header("Funciones sensoriales")
    activar_voz = st.checkbox("Leer respuestas en voz alta", value=False)

# --------------------------------------------------------------------------- #
# Interfaz principal
# --------------------------------------------------------------------------- #
st.title(modelo)
st.caption("Sistema integrado de desarrollo y analisis")

if "messages" not in st.session_state:
    st.session_state.messages = []

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.markdown(message["content"])

if prompt := st.chat_input("Comando para Gravity..."):
    with st.chat_message("user"):
        st.markdown(prompt)
    st.session_state.messages.append({"role": "user", "content": prompt})

    with st.chat_message("assistant"):
        with st.spinner("Procesando..."):
            respuesta_ia = run_request_sync(prompt, modelo, velocidad)
        st.markdown(respuesta_ia)
        if activar_voz:
            hablar(respuesta_ia)

    st.session_state.messages.append({"role": "assistant", "content": respuesta_ia})
