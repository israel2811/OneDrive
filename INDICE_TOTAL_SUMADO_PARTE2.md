# 📚 ÍNDICE TOTAL SUMADO - TODOS LOS TEMAS SIN OMISIÓN
## PARTE 2: Secciones 7-13

---

# SECCIÓN 7: ELECTROACÚSTICA Y DISPOSITIVOS (HARDWARE Y RUTAS DE AUDIO)

## 7.1 Altavoces y micrófonos: partes, mecanismos y límites
- 7.1.1 Respuesta en frecuencia, distorsión, clipping
- 7.1.2 Direccionalidad y acoplamientos

## 7.2 Teléfono/celular como sistema acústico
- 7.2.1 Micrófonos múltiples, beamforming, modos de supresión
- 7.2.2 Cancelación activa de ruido (ANC) y modo transparencia

## 7.3 Silenciamiento (mute) y sus ambigüedades operacionales
- 7.3.1 Qué significa 'mute' por app, por OS y por hardware
- 7.3.2 Umbrales, VAD y estados (silencio ≠ cero)

## 7.4 Captura/reproducción en videollamadas y conferencias
- 7.4.1 Señales de fuga, mezclas y ruteo accidental
- 7.4.2 Dispositivos Bluetooth, latencias y doble ruta

---

# SECCIÓN 8: TELECOMUNICACIONES EN TIEMPO REAL (RTC) Y DSP DE VOZ

## 8.1 Arquitecturas y protocolos (telefonía, VoIP, WebRTC, IMS)
- 8.1.1 Captura → códec → red → jitter buffer → decodificación → render

## 8.2 Códecs y compresión con pérdida
- 8.2.1 Artefactos perceptuales y degradación
- 8.2.2 Opus, AMR, EVS, G.711, G.722, G.729

## 8.3 Calidad de servicio/experiencia (QoS/QoE)
- 8.3.1 Jitter, pérdida de paquetes, latencia
- 8.3.2 Packet Loss Concealment (PLC) como generador de estructura
- 8.3.3 Métricas: PESQ, POLQA, MOS

## 8.4 Mecanismos de "silencio" en RTC
- 8.4.1 VAD/DTX y Comfort Noise (CNG)
- 8.4.2 SID frames y ruido de confort
- 8.4.3 "Silencio" operacional vs silencio real

## 8.5 Procesamiento de señal en el extremo (endpoint DSP)
- 8.5.1 AEC (echo cancellation)
- 8.5.2 NS (noise suppression) - musical noise
- 8.5.3 AGC (automatic gain control) - pumping
- 8.5.4 Post-filters y reconstrucción

## 8.6 Fenómenos "ciber-acústicos" de interés (hipótesis)
- 8.6.1 Pseudo-fonética emergente bajo degradación + priors del oyente
- 8.6.2 Cambios técnicos verificables → cambios fenomenológicos (predicción)

## 8.7 Taxonomía de artefactos tipo habla

## 8.8 Rutas de audio y mezclas: fugas, permisos, estados del sistema

---

# SECCIÓN 9: IA, MODELOS DE AUDIO Y "PAREIDOLIA ALGORÍTMICA"

## 9.1 IA en pipelines de voz (realce/supresión/transcripción)
- 9.1.1 Sesgos de datasets y fonotáctica (idioma/acento)
- 9.1.2 Alucinaciones de ASR como analogía (detector ≠ juez)
- 9.1.3 LibriSpeech 100% inglés - sesgo confirmado

## 9.2 Separación de fuentes y análisis de audio (defensivo)
- 9.2.1 Fourier/STFT; espectrogramas y métricas
- 9.2.2 BSS (separación ciega), NMF/ICA: límites y falsos patrones
- 9.2.3 Detección de estructura sin atribuir contenido (paneles ciegos)

## 9.3 Diseño de herramientas analíticas reproducibles
- 9.3.1 Scripts, notebooks, dashboards
- 9.3.2 Versionado y trazabilidad

## 9.4 Transcripción automática: nunca como evidencia primaria sin controles

---

# SECCIÓN 10: CIBERSEGURIDAD Y FORENSE DIGITAL (ENFOQUE DEFENSIVO)

## 10.1 Taxonomía descriptiva (sin manuales ofensivos)
- 10.1.1 Spyware, stalkerware, RAT, backdoors (definiciones)
- 10.1.2 Superficie de riesgo: móvil, desktop, nube
- 10.1.3 Tasas base de stalkerware/spyware

## 10.2 Dificultades de evidencia concluyente
- 10.2.1 Evidencia volátil, logs incompletos, opacidad de sistemas
- 10.2.2 Falsos negativos y sensibilidad no definida
- 10.2.3 'No se detecta' ≠ 'no existe'

## 10.3 Principios forenses mínimos
- 10.3.1 Preservación, cadena de custodia
- 10.3.2 Auditoría reproducible e independiente

## 10.4 Correlación temporal y triangulación
- 10.4.1 Episodio ↔ eventos del sistema/red ↔ cambios ambientales

## 10.5 Android (línea técnica del proyecto)
- 10.5.1 Análisis de APK (estructura, permisos, componentes)
- 10.5.2 Termux, Shizuku, herramientas de red/IDS (solo defensivo)
- 10.5.3 Monitoreo y alertas (sin intrusión a terceros)

## 10.6 Stop-rules y decisiones reversibles

## 10.7 Asimetría forense: pruebas indirectas

## 10.8 Stalkerware como fuente real (estadísticas de industria/coaliciones) - E3-E4

---

# SECCIÓN 11: PROBABILIDAD, ESTADÍSTICA Y CIENCIA DE DATOS

## 11.1 Tasas base y priorización
- 11.1.1 Base rates de psicosis, 'oír voces', y eventos de spyware
- 11.1.2 Problema del falso positivo en eventos raros

## 11.2 Diseño experimental y control de sesgos
- 11.2.1 ABAB / N-of-1 / controles ciegos
- 11.2.2 Múltiples comparaciones y preregistro

## 11.3 Inferencia causal (sin magia)
- 11.3.1 DAGs, confusores, mediadores
- 11.3.2 Series temporales, lags, autocorrelación

## 11.4 Métricas de acuerdo y confiabilidad
- 11.4.1 Cohen's kappa / ICC / consenso inter-observador

## 11.5 Análisis bayesiano

## 11.6 Decisión bajo incertidumbre

---

# SECCIÓN 12: LINGÜÍSTICA, SEMÁNTICA Y ESTRUCTURA DEL LENGUAJE

## 12.1 Señales de habla vs ruido: rasgos acústicos y fonéticos

## 12.2 Bilingüismo/multilingüismo como prueba discriminante

## 12.3 Prosodia, ritmo y segmentación

## 12.4 Modelos computacionales: n-gramas, entropía, límites del 'contenido'

## 12.5 Fonotáctica y expectativas lingüísticas por idioma

---

# SECCIÓN 13: MODELO INTEGRADOR: CCA + FPI + ESCENARIOS A-D + EVIDENCIA E0-E4

## 13.1 Definición formal de Convergencia Ciber-Acústica (CCA)
- Convergencia de: estímulos acústicos/tecnogénicos + transformaciones algorítmicas + mecanismos neurocognitivos

## 13.2 Modelo FPI operacional (Fuente→Percepción→Interpretación)
- 13.2.1 Variables observables por capa
- 13.2.2 Doble disociación: estructura física vs interpretación semántica
- 13.2.3 Tabla FPI operacional:
  - Fuente: rastro externo, WAV calibrado, condiciones A/B
  - Percepción: detección/atención/saliencia, tareas ciegas
  - Interpretación: contenido/atribución/agencia, paneles ciegos
  - Decisión: clasificación A-D, evidencia E0-E4

## 13.3 Escenarios A-D (mapa causal completo)
- 13.3.1 A: componente exógeno dominante
- 13.3.2 B: componente ambiental/acústico dominante
- 13.3.3 C: componente neuro-perceptivo dominante
- 13.3.4 D: mixto/indeterminado (coexistencia)

## 13.4 Escalera de evidencia E0-E4 (reglas de inferencia)
- E0: Sin evidencia
- E1: Evidencia anecdótica
- E2: Evidencia correlacional
- E3: Evidencia convergente
- E4: Evidencia causal verificable

## 13.5 Matriz de decisión y criterios de falsación

## 13.6 Conflictos y reconciliación metodológica

## 13.7 Temas contextuales (mención acotada)
- Ultrasonido (uXDT)
- EMI/IMD
- Efecto Frey (histórico, mecanismo improbable)

## 13.8 Temas excluidos (razón explícita)
- Armas/atribuciones no falsables
- LRAD/armas militares (sin evidencia robusta para civiles)
- Comunidades 'targeted individuals' (solo crítica metodológica)

---

**CONTINUACIÓN EN PARTE 3...**
