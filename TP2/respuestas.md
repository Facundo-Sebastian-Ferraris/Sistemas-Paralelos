# 📝 Respuestas - Trabajo Práctico Nº 2: Uso de un Cluster

---

## 📊 Punto 3: Recursos del Cluster

### 3.1) Comando: `sinfo -o '%9P %5D %7X %5Y %4c %7Z %10N %11e'`

**Salida obtenida:**
```
PARTITION NODES SOCKETS CORES CPUS THREADS NODELIST   FREE_MEM
Blade*    16    2       4     8    1       nodo[1-16] 1989-6013
XeonPHI   1     1       64    64   1       XeonPHI    N/A
GPUS      2     1       1     1    1       GPU[1-2]   N/A
```

**🔍 Interpretación:**

Este comando muestra una descripción detallada de las **particiones y nodos** del cluster. Cada formato `%#@` funciona de la siguiente manera:
- `%` → indica especificación de formato
- `#` → indica el ancho del campo en caracteres
- `@` → indica el dato a mostrar

**Significado de cada campo:**

| Formato | Significado | Descripción |
|---------|-------------|-------------|
| `%P` | PARTITION | Nombre de la partición (el `*` indica la partición por defecto) |
| `%D` | NODES | Cantidad de nodos en la partición |
| `%X` | SOCKETS | Cantidad de sockets por nodo |
| `%Y` | CORES | Cantidad de núcleos por socket |
| `%c` | CPUS | Cantidad total de CPUs (hilos) por nodo |
| `%Z` | THREADS | Cantidad de hilos por core |
| `%N` | NODELIST | Lista de nodos (notación compacta desde-hasta) |
| `%e` | FREE_MEM | Memoria libre disponible en MB (rango entre menor y mayor disponibilidad) |

**📌 Observaciones:**
- **Blade\***: Es la partición por defecto (indicada por el `*`), cuenta con **16 nodos**, cada uno con **2 sockets**, **4 cores por socket**, **8 CPUs totales** y **1 thread por core**. La memoria libre varía entre **1989 MB y 6013 MB**.
- **XeonPHI**: Partición con un solo nodo especializado, con **64 cores** y **64 CPUs**.
- **GPUS**: Partición con **2 nodos** con GPU, configuración mínima de **1 core y 1 CPU**.

---

### 3.2) Comando: `sinfo -o '%9P %10N %t'`

**Salida obtenida:**
```
PARTITION NODELIST   STATE
Blade*    nodo[1-16] idle
XeonPHI   XeonPHI    down*
GPUS      GPU[1-2]   down*
```

**🔍 Interpretación:**

Este comando muestra el **estado de los nodos** en cada partición:

| Nodo | Estado | Significado |
|------|--------|-------------|
| `nodo[1-16]` | **idle** | ✅ Disponibles y listos para ejecutar trabajos |
| `XeonPHI` | **down\*** | ❌ Fuera de servicio (el `*` indica que el estado fue establecido por un administrador) |
| `GPU[1-2]` | **down\*** | ❌ Fuera de servicio (marcado por administrador) |

**📌 Conclusión:** Solo los **16 nodos de la partición Blade** están operativos y disponibles para ejecutar trabajos.

---

## 🚀 Punto 4: Lanzar Trabajos a Ejecución

### 4.d) Explicación del script `launch_serie`

```bash
#!/bin/bash
#SBATCH -N 1                    # 📦 Indica que se requiere 1 nodo para el trabajo
#SBATCH --exclusive             # 🔒 El nodo será de uso exclusivo, evita que otros procesos compartan el nodo
#SBATCH --partition=Blade       # 🎯 Especifica que el trabajo debe ejecutarse en la partición "Blade"
#SBATCH -o salida.txt           # 📄 Redirige la salida estándar al archivo "salida.txt"
#SBATCH -e errores.txt          # ⚠️ Redirige los mensajes de error al archivo "errores.txt"

echo Iniciando el programa      # 💬 Imprime mensaje de inicio
./serie                         # ⚙️ Ejecuta el programa compilado "serie"
echo Fin del programa           # 💬 Imprime mensaje de finalización
```

---

### 4.e) Resultados de la ejecución

**📍 Nodo y Core utilizados:** Según la salida obtenida, el trabajo se ejecutó en:
- **Nodo:** `nodo1`
- **Core:** `7`

**📖 Explicación del código `serie.c`:**

```c
#define _GNU_SOURCE // sched_getcpu(3) is glibc-specific
#include <stdio.h>
#include <unistd.h>
#include <sched.h>

int main( int argc, char *argv[]) {
   char hostname[128];
   gethostname(hostname, sizeof(hostname));

   printf("Ejecutando en nodo %s, core %d\n", hostname, sched_getcpu());
   return 0;
}
```

Este programa realiza las siguientes acciones:
1. **`gethostname()`** 🏷️ → Obtiene el nombre del host (nodo) donde se está ejecutando el proceso
2. **`sched_getcpu()`** 🔢 → Obtiene el número de core asignado por el planificador (scheduler) al proceso actual
3. **`printf()`** 📢 → Imprime ambos valores en formato: `"Ejecutando en nodo [nombre], core [número]"`

**🎯 Propósito:** Identificar exactamente en qué recurso físico del cluster se ejecutó el trabajo.

---

### 4.f) Ejecución en nodo específico diferente

**🔎 Selección de nodo:** Al ejecutar `sinfo -N -o '%10N %10t'`, se observó que todos los nodos de la partición Blade están en estado `idle` (disponibles). Se seleccionó **`nodo16`**.

**📝 Modificación del script:** Se agregó la directiva:
```bash
#SBATCH --nodelist=nodo16
```

**✅ Resultado obtenido:**
```
Iniciando el programa cambiando nodo a 16
Ejecutando en nodo nodo16, core 2
Fin del programa
```

El trabajo se ejecutó exitosamente en **nodo16, core 2**, confirmando que la especificación del nodo funcionó correctamente.

---

### 4.g) Opciones fuera del script

**🧪 Experimento:** Se comentó la línea `#SBATCH --nodelist=...` dentro del script y se lanzó el trabajo especificando el nodo desde la línea de comandos:

```bash
$ sbatch --nodelist=nodo13 launch_serie
```

**✅ Resultado:**
```
Iniciando el programa cambiando nodo a 16
Ejecutando en nodo nodo13, core 2
Fin del programa
```

El trabajo se ejecutó en **nodo13**, confirmando que es posible especificar opciones desde fuera del script.

---

### 4.h) Prioridad de opciones: ¿Script vs. Línea de comandos?

**🧪 Experimento realizado:**
- Se dejó una configuración de `--nodelist=nodo16` **dentro del script**
- Se lanzó el trabajo con `sbatch --nodelist=nodo10 launch_serie` desde la línea de comandos

**✅ Resultado:**
```
Iniciando el programa cambiando nodo a 16
Ejecutando en nodo nodo10, core 3
Fin del programa
```

**🏆 Conclusión:** La opción especificada **desde la línea de comandos tiene prioridad** sobre la especificada dentro del script. El trabajo se ejecutó en `nodo10` (el indicado externamente) y no en `nodo16` (el indicado internamente).

---

## 🛑 Punto 5: Estados y Cancelación de Trabajos

### 5.a) Información con `scontrol show job`

**📋 Datos obtenidos del job 164024:**

| Campo | Valor | Línea correspondiente |
|-------|-------|----------------------|
| **Estado** | `COMPLETED` | `JobState=COMPLETED` |
| **Lista de nodos** | `nodo13` | `NodeList=nodo13` |
| **Comando** | `launch_serie` | `JobName=launch_serie` |
| **Archivo de salida** | `/nethome/uncoma20/TP2/salida.txt` | `StdOut=/nethome/uncoma20/TP2/salida.txt` |
| **Archivo de error** | `/nethome/uncoma20/TP2/errores.txt` | `StdErr=/nethome/uncoma20/TP2/errores.txt` |

---

### 5.b) Estado RUNNING

**📊 Observación con `squeue`:**
```
JOBID    PARTITION  NAME      USER     ST  TIME   NODES NODELIST(REASON)
164028   Blade      sleepyJo  uncoma20 R   0:06   1     nodo1
```

**🔖 Códigos de estado:**

| Tipo | Valor |
|------|-------|
| **Nombre corto** | `R` |
| **Nombre largo** | `RUNNING` |
| **Significado** | El trabajo tiene actualmente una asignación de recursos y se está ejecutando |

**📈 Información adicional:**
1. **Tiempo ejecutando:** 6 segundos
2. **Nodos asignados:** `nodo1`

---

### 5.c) Estado PENDING

**🧪 Experimento:** Se lanzaron dos trabajos con `--exclusive` hacia el mismo nodo para forzar la contención de recursos.

**📊 Resultado con `squeue`:**
```
JOBID    PARTITION  NAME      USER     ST  TIME   NODES NODELIST(REASON)
164270   Blade      sleepyJo  uncoma20 PD  0:00   1     (Resources)
164269   Blade      sleepyJo  uncoma20 R   0:03   1     nodo1
```

**🔖 Códigos de estado:**

| Tipo | Valor |
|------|-------|
| **Nombre corto** | `PD` |
| **Nombre largo** | `PENDING` |
| **Significado** | El trabajo está esperando la asignación de recursos (está en cola hasta que el nodo esté disponible) |

**📌 Explicación:** El trabajo `164270` permanece en estado `PENDING` porque el nodo `nodo1` está siendo utilizado exclusivamente por el trabajo `164269`. El motivo `(Resources)` indica que está a la espera de que se liberen los recursos necesarios.

---

### 5.d) Cancelación de trabajos con `scancel`

**🧪 Experimento:** Se envió un trabajo y se canceló inmediatamente:

```bash
$ sbatch --parsable sleepyJob1 > JobID && sleep 2 && squeue && sleep 2 && scancel "$(cat JobID)" && sleep 2 && squeue
```

**📊 Resultados:**

**Antes de cancelar:**
```
JOBID    PARTITION  NAME      USER     ST  TIME   NODES NODELIST(REASON)
164275   Blade      sleepyJo  uncoma20 R   0:02   1     nodo1
```

**Después de cancelar:**
```
JOBID  PARTITION  NAME  USER  ST  TIME  NODES  NODELIST(REASON)
```

**✅ Comprobación:** El trabajo **ya no aparece en la lista** de `squeue`, confirmando que `scancel` eliminó exitosamente el trabajo de la cola.

**📝 Nota adicional:** Se observó que inmediatamente después de cancelar, el trabajo puede aparecer brevemente en estado `CG` (Completing) antes de desaparecer completamente.

---

### 5.e) Límite de tiempo de ejecución

**🔧 Opción utilizada:** `--time=HH:MM:SS` o `-t HH:MM:SS`

**🧪 Experimento realizado:**
```bash
$ sbatch --time=00:01:00 sleepyJob1
```

Se estableció un límite de **1 minuto** para un trabajo que ejecuta `sleep 20`.

**📊 Resultados:**

**Durante la ejecución:**
```
JOBID    PARTITION  NAME      USER     ST  TIME   NODES NODELIST(REASON)
164280   Blade      sleepyJo  uncoma20 R   0:02   1     nodo1
```

**Después de superar el límite:**
```
JOBID    PARTITION  NAME      USER     ST  TIME   NODES NODELIST(REASON)
164280   Blade      sleepyJo  uncoma20 CG  1:01   1     nodo1
```

**🔍 Verificación con `scontrol show job 164280`:**
- **JobState:** `TIMEOUT`
- **Reason:** `TimeLimit`
- **RunTime:** `00:01:01`
- **TimeLimit:** `00:01:00`

**✅ Conclusión:** Cuando un trabajo supera el tiempo límite especificado, SLURM lo termina automáticamente y cambia su estado a **`TIMEOUT`** con razón **`TimeLimit`**. El código de salida `0:15` indica que fue terminado por la señal `SIGTERM` (señal 15).

---

## 🖥️ Punto 6: Detalle de los Recursos de un Nodo

### 6.b) Nombre del nodo

El trabajo se ejecutó en **`nodo1`** (partición Blade).

---

### 6.c) Cantidad de sockets

**Respuesta:** El nodo tiene **2 sockets**.

```
«Socket(s)»: 2
```

---

### 6.d) Modelo de microprocesador y cantidad de cores

**📋 Información del procesador:**

| Característica | Valor |
|----------------|-------|
| **Fabricante** | Intel® |
| **Modelo** | Intel® Xeon® CPU E5405 @ 2.00GHz |
| **Cores por socket** | 4 |
| **Total de cores** | 8 (4 cores × 2 sockets) |
| **Frecuencia** | 2000.056 MHz (~2.0 GHz) |
| **BogoMIPS** | 4000.11 |

```
Nombre del modelo: Intel(R) Xeon(R) CPU E5405 @ 2.00GHz
Núcleo(s) por «socket»: 4
CPU(s): 8
```

---

### 6.e) ¿Es una máquina UMA o NUMA?

**Respuesta:** Es una máquina **NUMA** (Non-Uniform Memory Access).

**✅ Justificación:**

La salida de `lscpu` muestra claramente:
```
Modo(s) NUMA: 1
CPU(s) del nodo NUMA 0: 0-7
```

La presencia de **1 nodo NUMA** indica que el sistema utiliza arquitectura NUMA. Aunque en este caso particular todos los cores (0-7) pertenecen al mismo nodo NUMA 0, la arquitectura del sistema está configurada para soportar acceso no uniforme a memoria, lo cual es característico de sistemas multiprocesador con múltiples sockets.

**📌 Nota:** En sistemas con 2 sockets como este (E5405), es común tener configuraciones NUMA donde cada socket tiene su propio controlador de memoria.

---

### 6.f) Tamaño máximo aproximado de memoria RAM

**📊 Información de memoria:**

```
              total        used        free      shared  buff/cache   available
Mem:        8167492      145552     4014136       74288     4007804     7682276
```

**💾 Cálculos:**
- **Memoria total:** 8,167,492 KB ≈ **7.79 GB**
- **Memoria disponible:** 7,682,276 KB ≈ **7.33 GB**

**Respuesta:** El tamaño máximo aproximado de memoria RAM disponible para nuestro trabajo sería de aproximadamente **7.33 GB** (memoria disponible considerando buffers y caché que pueden ser liberados).

---

### 6.g) Tamaño máximo de memoria total (RAM + Swap)

**📊 Información de Swap:**
```
Swap:             0           0           0
```

**🔍 Análisis:**
- **RAM total:** ~7.79 GB
- **Swap:** 0 KB (no hay partición de swap configurada)

**Respuesta:** El tamaño máximo de memoria total disponible (RAM + área de intercambio) es de aproximadamente **7.79 GB**, ya que **no hay memoria swap configurada** en este nodo del cluster.

**📌 Observación:** Esto es común en entornos de cluster donde los trabajos se ejecutan con recursos asignados exclusivamente y no se requiere swap, ya que SLURM gestiona la asignación de memoria de forma controlada.

---

## 📚 Resumen General

| Punto | Tema | Estado |
|-------|------|--------|
| 3 | Recursos del cluster | ✅ Completado |
| 4 | Lanzar trabajos | ✅ Completado |
| 5 | Estados y cancelación | ✅ Completado |
| 6 | Detalle de recursos | ✅ Completado |

**🎯 Conclusiones finales:**
- Se logró acceder y gestionar archivos en el cluster III-LIDI ✅
- Se comprendió el uso de SLURM para lanzar y monitorear trabajos ✅
- Se identificaron los diferentes estados de los trabajos (RUNNING, PENDING, COMPLETED, TIMEOUT, CG) ✅
- Se verificó la prioridad de opciones externas sobre las internas del script ✅
- Se analizaron los recursos hardware de los nodos del cluster ✅
