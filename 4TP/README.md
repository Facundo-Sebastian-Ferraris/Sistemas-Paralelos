Aquí tienes el contenido del **Trabajo Práctico Nº 4** organizado en formato Markdown, con un diseño optimizado, emojis significativos y las referencias a las imágenes integradas.

---

# 🚀 Trabajo Práctico Nº 4: Evaluación de Rendimiento de Aplicaciones Paralelas

Este práctico se centra en la **instrumentación de aplicaciones** para realizar mediciones temporales y la **evaluación de rendimiento** mediante métricas de escalabilidad fuerte y débil.

---

## 🎯 Objetivos de la práctica
*   🛠️ **Instrumentar aplicaciones** para realizar mediciones temporales.
*   📊 **Evaluar el rendimiento**: métricas, escalabilidad fuerte y escalabilidad débil.

---

## 📑 Ejercicio 1: Análisis de Rendimiento con OpenMP
Este ejercicio consiste en analizar una aplicación implementada con el modelo de **memoria compartida OpenMP**. 

> [!NOTE]
> OpenMP funciona exclusivamente en máquinas de memoria compartida, por lo que su uso se restringe a un solo nodo del clúster. Su modelo consiste en lanzar un único proceso que genera múltiples hilos de ejecución.

### ❄️ El Programa: Conjuntos de Julia
El programa calcula "conjuntos de Julia", una familia de conjuntos fractales.

![Fractal Julia Set](https://raw.githubusercontent.com/uncoma-pueblo/assets/main/julia_fractal.jpg)
*Ejemplo de archivo generado por el programa `julia.c`*.

#### 🛠️ Instrucciones de Preparación
1.  **Compilación**: Utilizar GCC con soporte para OpenMP y optimización máxima.
    ```bash
    $ gcc -fopenmp -O3 julia.c -o julia
    ```
2.  **Parámetros**: El programa recibe el `alto` y `ancho` de la imagen. 
    *   *Ejemplo*: `./julia 10000 2000` (genera una imagen de 10.000 filas por 2.000 columnas).
3.  **Variable de Entorno**: Se utiliza `OMP_NUM_THREADS` para definir la cantidad de hilos.

---

### 📈 i. Estudio de Escalabilidad Fuerte
Se busca evaluar cómo varía el tiempo al aumentar los procesadores para un **tamaño de problema fijo**.

*   **Configuración**: Alto: 240.000 | Ancho: 2.000.
*   **Cores**: 2, 4, 6, 8, 10, ... hasta el total del nodo.

**Tareas a realizar:**
- [ ] 📝 Escribir el script de automatización.
- [ ] 📉 Graficar la curva de **Tiempo de ejecución**.
- [ ] 📈 Graficar la curva de **Speedup** (incluir el ideal/lineal).
- [ ] 📊 Graficar la curva de **Eficiencia Paralela**.
- [ ] ✍️ Describir los resultados obtenidos.

---

### 📉 ii. Estudio de Escalabilidad Débil
Se busca evaluar el rendimiento aumentando la carga de trabajo de forma proporcional al número de cores.

*   **Configuración**: 8.000 (alto) x 2.000 (ancho) **por cada core**.
*   **Cores**: 2, 4, 6, 8, 10, ... hasta el total del nodo.

**Tareas a realizar:**
- [ ] 📝 Escribir el script que calcule el tamaño del problema dinámicamente (se sugiere variar la altura y dejar fijo el ancho).
- [ ] 📉 Graficar la curva de **Tiempo de ejecución**.
- [ ] ✍️ Describir los resultados.

---

## ⏱️ Ejercicio 2: Instrumentación y Medición de Tiempos
Se trabaja sobre la medición de tiempo transcurrido entre dos puntos de un programa.

1.  **Analizar `programa1.c`**: Ejemplo provisto de medición de tiempos.
2.  **Completar `programa2.c`**: Agregar mediciones para que los resultados de ejecuciones cortas sean representativos de ejecuciones largas.
3.  **Estimación**: Indicar cómo estimar el tiempo para una ejecución con **n = 1.000.000**.

---

## 🏎️ Ejercicio 3: Cálculo de Aceleración (TP3)
Para los ejercicios **8 y 10 del TP3**, calcular la aceleración (Speedup) de los programas optimizados comparándolos contra las versiones sin optimizar.

---

## 🖼️ Galería de Imágenes (Assets)
A continuación, se listan los recursos visuales referenciados en el documento:

1.  **Logo Universidad**: [Logotipo UNCO](https://raw.githubusercontent.com/uncoma-pueblo/assets/main/logo_unco.png)
2.  **Logo Facultad/LIDI**: [Logotipo Facultad de Informática](https://raw.githubusercontent.com/uncoma-pueblo/assets/main/logo_lidi.png)
3.  **Fractal Julia**: [Imagen Fractal Roja](https://raw.githubusercontent.com/uncoma-pueblo/assets/main/julia_fractal.jpg)

---
> [!TIP]
> El cómputo requerido para procesar la matriz es proporcional al número de celdas. La salida del programa siempre indicará el tiempo de ejecución final.
