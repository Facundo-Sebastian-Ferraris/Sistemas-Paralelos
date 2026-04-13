# 📊 Análisis de Rendimiento de Aplicaciones Paralelas - 2026

##  Trabajo Práctico Nº 4 - Evaluación de Rendimiento de Aplicaciones Paralelas
---

## 🎯 Objetivos de la práctica

- 🛠️ **Instrumentar aplicaciones** para realizar mediciones temporales
- 📈 **Evaluar el rendimiento** de aplicaciones paralelas: métricas, escalabilidad fuerte y débil

---

## 📝 Ejercicios

### 1️⃣ Análisis de Rendimiento con OpenMP

Este ejercicio consiste en analizar el rendimiento de una aplicación implementada con el modelo de programación paralela de **memoria compartida OpenMP**. 

> ⚠️ **Importante:** OpenMP solo funciona en máquinas de memoria compartida; por lo tanto, su uso se restringe a un **solo nodo del clúster**.

El modelo de ejecución de OpenMP consiste en lanzar un **único proceso** que a su vez lanzará **múltiples hilos de ejecución**.

#### 🧮 Programa a Evaluar: Conjuntos de Julia

El programa calcula **"conjuntos de Julia"**. Los conjuntos de Julia son una familia de conjuntos fractales que se obtienen al estudiar el comportamiento de los números complejos al ser iterados por una función holomorfa.

**Ejemplo de archivo generado:**

![Conjunto de Julia](img/image-000.png)

#### 📋 Observaciones Importantes
- 🔨 **Compilación:** Compilar el programa OpenMP [julia.c](julia.c) con el compilador GCC, utilizar la opción de OpenMP y la opción de optimización `-O3`:
  ```bash
  $ gcc -fopenmp -O3 julia.c -o julia
  ```

- 📐 **Parámetros:** El programa tiene dos parámetros, **alto** y **ancho** de la imagen. Por ejemplo, si ejecutamos `./julia 10000 2000` la imagen tendrá **10.000 filas por 2.000 columnas**.

- ⏱️ **Cómputo:** El cómputo requerido para procesar todas las celdas de la matriz es **proporcional al número de celdas**.

- 🕒 **Salida:** La salida del programa indica el **tiempo de ejecución**.

#### 🤖 Script de Referencia

El siguiente script puede servir de referencia para automatizar la ejecución de los experimentos con diferentes parámetros:

```bash
height=2000
width=1000

listOfCores="1 $(seq 2 2 8)"

for cores in $listOfCores; do
   echo Experimento con cores: $cores
   export OMP_NUM_THREADS=$cores
   ./julia $height $width
   echo -------------------------------
done
```

> 📌 La variable de entorno `OMP_NUM_THREADS` es utilizada para indicar, al entorno de ejecución de OpenMP, el **número de hilos a utilizar**.

---

### 📊 Ejercicio 1.i: Escalabilidad Fuerte

Se requiere evaluar el rendimiento de la aplicación mediante un **estudio de escalabilidad fuerte**.

#### 📌 Configuración:
- 🔢 Cantidad de cores: **2, 4, 6, 8, 10, ..., y hasta el número total de cores del nodo seleccionado**
- 📏 Problema: **alto 240.000 y ancho 2.000**

#### ✅ Se requiere:

- **a)** 📜 Escribir el script utilizado para la ejecución de los experimentos
- **b)** 📈 Graficar la curva del **Tiempo de ejecución**
- **c)** 🚀 Graficar la curva del **Speedup** (en el gráfico indicar también el speedup ideal/lineal)
- **d)** 📊 Graficar la curva de la **Eficiencia Paralela**
- **e)** 📝 Describir los resultados

---

### 📈 Ejercicio 1.ii: Escalabilidad Débil

Se requiere evaluar el rendimiento de la aplicación mediante un **estudio de escalabilidad débil**.

#### 📌 Configuración:
- 🔢 Cantidad de cores: **2, 4, 6, 8, 10, ..., y hasta el número total de cores del nodo seleccionado**
- 📏 Problema: **alto 8.000 y ancho 2.000 por core**

#### ✅ Se requiere:

- **a)** 📜 Escribir el script que incluya el **cálculo del tamaño del problema** (alto y ancho) dependiente del número de cores de cada experimento
  > 💡 **Ayuda:** para simplificar el cálculo, dejar fijo el ancho e ir variando la altura
- **b)** 📈 Graficar la curva del **Tiempo de ejecución**
- **c)** 📝 Describir los resultados

---

### 2️⃣ Instrumentación de un Programa Serie

**Instrumentación de un programa serie para la medición de tiempos**

Se provee el programa [programa1.c](programa1.c), que muestra un ejemplo en el que se mide el tiempo transcurrido entre dos puntos de un programa.

#### ✅ Tareas:

- 🛠️ Completar el programa [programa2.c](programa2.c) con **mediciones de tiempo**
- 🎯 Tener en cuenta que se desean realizar experimentos con **ejecuciones cortas** pero cuyos resultados sean **representativos de ejecuciones muy largas**
- 🔮 Indicar cómo se podría estimar el tiempo para una ejecución con: **n = 1.000.000**

---

### 3️⃣ Cálculo de Aceleración

Para los **ejercicios 8 y 10 del TP3**, calcular la **aceleración** de los programas optimizados frente a los programas sin optimizar.

#### ✅ Se requiere:

- ⚡ Calcular la **aceleración** (speedup) de los programas optimizados
- 📊 Comparar con los programas sin optimizar

---
