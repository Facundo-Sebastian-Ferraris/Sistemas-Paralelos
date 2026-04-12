# Soluciones - Práctica de Optimización de Alto Rendimiento

## Ejercicio 1: Niveles de Optimización de GCC

### Descripción de los niveles `-O0`, `-O2` y `-O3`

#### `-O0` (por defecto)

- Reduce el tiempo de compilación
- Depuración produce resultados esperados
- Ninguna optimización activada

---

#### `-O2` (recomendado para producción)

- Casi todas las optimizaciones que no implican trade-off tamaño/velocidad
- Mayor tiempo de compilación y mejor rendimiento
- Incluye todo `-O1` + flags como:
  - `-falign-functions`
  - `-fcse-follow-jumps`
  - `-fgcse`
  - `-finline-functions`
  - `-fstrict-aliasing`
  - `-ftree-loop-vectorize`
  - `-ftree-pre`
  - `-ftree-vrp`
  - Entre otros (~50 flags adicionales)

---

#### `-O3` (máxima optimización)

- Incluye todo `-O2` +:

| Flag | Descripción |
|------|-------------|
| `-fgcse-after-reload` | Optimización GCSE después del reload |
| `-fipa-cp-clone` | Clonado de propagación de constantes IPA |
| `-floop-interchange` | Intercambio de bucles |
| `-floop-unroll-and-jam` | Desenrollado y fusión de bucles |
| `-fpeel-loops` | Pelado de bucles |
| `-fpredictive-commoning` | Commoning predictivo |
| `-fsplit-loops` | División de bucles |
| `-fsplit-paths` | División de caminos |
| `-ftree-loop-distribution` | Distribución de bucles |
| `-ftree-partial-pre` | PRE parcial en árboles |
| `-funswitch-loops` | Descondicionalización de bucles |
| `-fvect-cost-model=dynamic` | Modelo de costo de vectorización dinámico |
| `-fversion-loops-for-strides` | Versionado de bucles para strides |

---

## Ejercicio 2: Técnica "Hacer menos trabajo y más liviano"

### 2.1) Reducción de trabajo

**Archivo:** `2Aex.c`

**Solución:** Se optimiza el bucle para que termine temprano cuando encuentra un elemento que cumple la condición, en lugar de recorrer todo el array innecesariamente.

```c
int solucionOptima(){
    int flag = 0;
    int aMax = n;
    while(!flag && i < aMax){
        flag = complex_func(a[i]) < 55;
        i++;
    }
    printf("¿Elemento encontrado? %d\n", flag);
    return 0;
}
```

**Optimización aplicada:** Early exit (salida temprana) - una vez que se encuentra un elemento que satisface la condición (`complex_func(a[i]) < 55`), el bucle termina, evitando iteraciones innecesarias.

---

### 2.2) Operaciones más livianas

**Archivo:** `2Bex.c`

**Solución:** Se cambia el tipo de dato de `float` a `int` para las variables de iteración y resultado, ya que las operaciones con enteros son más livianas que con punto flotante.

**Solución Inicial:** `5,524s`  
**Solución Nueva:** `3,476s`

```c
int solucionNueva(){
    int i, j, a;

    for(i = 0; i < 1000; i++){
        for(j = 0; j < 1000000; j++){
            a = i + j;
        }
    }
    return a;
}
```

**Optimización aplicada:** Reemplazo de operaciones de punto flotante por operaciones con enteros, que son computacionalmente menos costosas.

---

## Ejercicio 3: Técnica "Reducción del almacenamiento para datos"

### 3.1) Diagrama de la estructura de datos

A continuación se muestra el diagrama que representa punteros y bloques de memoria de la estructura de datos utilizada para la grilla:

![Diagrama de la estructura de datos](3P/p3Adiagrama.png)

**Ventajas de usar un solo bloque de memoria:**

- **Datos alineados:**
  - La CPU accede de forma rápida y eficiente, mejorando el rendimiento.
  - Menos saltos de memoria, aprovechando de mejor forma la caché y reduciendo el tiempo de ejecución.
- **Memoria dinámica:** permite variar el tamaño de la memoria durante la ejecución.

---

### 3.2) Optimización mediante reducción del almacenamiento

**Descripción:** La reducción de datos consiste en achicar el size del tipo de dato ya que solo guardaremos estados booleanos. El tipo de dato mínimo es `char` que ocupa 1 byte, en vez de `int` que ocupa 4 bytes.

**Archivo original (`3-2ex.c`):** Utiliza `int` para almacenar valores booleanos (0 o 1).

**Archivo optimizado (`3-2Optex.c`):** Utiliza `char` para almacenar los mismos valores, reduendo el consumo de memoria.

---

### 3.3) Comparación de rendimiento y memoria

#### Tiempo de ejecución

| Versión | Real | User | Sys |
|---------|------|------|-----|
| Con `int` | `0m2,648s` | `0m2,034s` | `0m0,612s` |
| Con `char` | `0m2,144s` | `0m1,984s` | `0m0,156s` |

**Mejora:** `~0,5s` en tiempo real.

#### Uso de memoria

| Tipo de dato | Cálculo | Bytes | MiB |
|--------------|---------|-------|-----|
| `int` (4 bytes) | $(20000^2) \times 4$ | 1.600.000.000 | ~1526 MiB |
| `char` (1 byte) | $(20000^2) \times 1$ | 400.000.000 | ~381 MiB |

**Ahorro de memoria:** ~1145 MiB (75% menos memoria).

---

## Ejercicio 4: Técnica "Código en Línea"

### Descripción

Se optimiza el siguiente programa eliminando la función y escribiendo el código directamente donde se realiza la llamada:

```c
// Versión original con llamada a función
int pordos(int x){
   return x*2;
}

// Versión optimizada con código en línea
res += (i*2);  // en lugar de res += pordos(i);
```

### Resultados de ejecución (sin optimización del compilador)

| Versión | Tiempo real |
|---------|-------------|
| Con llamada a función | `0m1,765s` |
| Con código en línea | `0m0,255s` |

**Diferencia:** `1,51s` a favor del código en línea.

### Resultados con optimización `-O3`

| Versión | Tiempo real |
|---------|-------------|
| Con llamada a función | `0m0,006s` |
| Con código en línea | `0m0,004s` |

**Diferencia:** Mínima (`0,002s`).

### Conclusión

- **Llamada por funciones:** Tiene cierto overhead (peso) que demora la ejecución al realizar el llamado.
- **Código en línea:** Al no tener llamadas de función, elimina los tiempos de demora asociados al salto y retorno.
- **Recomendación:** Es preferible usar funciones cuando se trata de procedimientos más complejos, donde el overhead es despreciable frente al trabajo realizado. Para funciones pequeñas y frecuentemente llamadas, el código en línea ofrece mejor rendimiento.
- **Con optimización `-O3`:** El compilador realiza inline automático, por lo que la diferencia se vuelve mínima.

---

## Ejercicio 5: Técnica "Desenrollado de bucles"

### Programas analizados

#### Programa 1 (Original)
```c
register int i;
register double a = 0;
for (i = 0; i < 40000000; i++)
   a+= 0.0000001;
```

#### Programa 2 (Desenrollado de bucles)
```c
register int i;
register double a = 0;
for (i = 0; i < 40000000; i+=4) {
   a+= 0.0000001;
   a+= 0.0000001;
   a+= 0.0000001;
   a+= 0.0000001;
}
```

#### Programa 3 (Desenrollado + reducción de dependencias)
```c
register int i;
register double a = 0, a1 = 0, a2 = 0, a3 = 0;
for (i = 0; i < 40000000; i+=4) {
      a+= 0.0000001;
      a1+= 0.0000001;
      a2+= 0.0000001;
      a3+= 0.0000001;
}
a+=a1+a2+a3;
```

### Resultados de ejecución

| Programa | Tiempo real | Observaciones |
|----------|-------------|---------------|
| Programa 1 (Original) | `0m0,148s` | Operaciones dependientes, no permite paralelización a nivel de instrucciones |
| Programa 2 (Desenrollado) | `0m0,132s` | Reduce los saltos de bucle 4 veces |
| Programa 3 (Desenrollado + variables independientes) | `0m0,035s` | Permite paralelizar instrucciones al eliminar dependencias |

### Análisis

1. **Programa 1:** Es el más lento debido a que las operaciones son dependientes entre sí, lo que impide la paralelización a nivel de instrucciones (ILP).

2. **Programa 2:** Mejora ligeramente el tiempo al reducir la cantidad de saltos de bucle (se itera 4 veces menos). Sin embargo, mantiene la dependencia en la variable `a`.

3. **Programa 3:** Es el más rápido porque:
   - Logra el desenrollado de bucles (menos saltos).
   - Usa variables independientes (`a`, `a1`, `a2`, `a3`) para prevenir la dependencia de datos.
   - Permite al procesador paralelizar las instrucciones, aprovechando el ILP (Instruction Level Parallelism).

---

## Ejercicio 6: Técnica "Extracción de subexpresiones comunes"

### Descripción

Se optimiza el siguiente programa extrayendo la subexpresión común `i * i * i` que se recalcula en cada iteración del bucle interno.

#### Código original (`6ex.c`)
```c
for (i = 0; i < 1000; i++)
    for (j = 0; j < 1000000; j+=4) {
        a += i * i * i + j;
        a1 += i * i * i + j + 1;
        a2 += i * i * i + j + 2;
        a3 += i * i * i + j + 3;
    }
```

#### Código optimizado (`6exOptimized.c`)
```c
for (i = 0; i < 1000; i++){
    int c = i * i * i;          // extraído fuera del bucle interno
    for (j = 0; j < 1000000; j+=4) {
        int d = c + j;           // subexpresión común calculada una vez
        a   += d;
        a1  += d + 1;
        a2  += d + 2;
        a3  += d + 3;
    }
}
```

### Optimización aplicada

- **`i * i * i`** se calcula una sola vez por iteración externa y se almacena en `c`.
- **`c + j`** se calcula una sola vez por iteración interna y se almacena en `d`.
- Se evitan **4 multiplicaciones triples** y **4 sumas redundantes** por cada iteración del bucle interno.

### Resultados de ejecución

| Versión | Resultado | Tiempo real |
|---------|-----------|-------------|
| Original | `20242176` | `0m1,499s` |
| Optimizada | `20242176` | `0m1,049s` |

**Mejora:** `~0,45s` (~30% más rápido).

### Conclusión

La extracción de subexpresiones comunes, si bien genera cierta dependencia (las variables `a` esperan a `d`, y `d` espera a `c`), reduce el tiempo total en aproximadamente medio segundo, ya que evita que cada instrucción recalcule de nuevo el mismo valor.

---

## Ejercicio 7: Técnica "Evitar saltos condicionales"

### Programas analizados

#### Código original (`7ex.c`)
```c
for(i = 0; i < 900; i++)
    for(j = 0; j < X; j++)
        switch (i) {
            case 0 ... 299:    m[i][j] = 0; break;
            case 300 ... 599:  m[i][j] = 1; break;
            default:           m[i][j] = 2; break;
        }
```

#### Código optimizado (`7exOpt.c`)
```c
for(i = 0; i < 900; i++){
    cond = (i >= 300) + (i >= 600);
    for(j = 0; j < X; j++)
        m[i][j] = cond;
}
```

### Optimización aplicada

Se reemplaza el `switch` con rangos por una **expresión aritmética sin saltos condicionales**:
- `(i >= 300)` evalúa a 1 si `i >= 300`, sino 0
- `(i >= 600)` evalúa a 1 si `i >= 600`, sino 0
- La suma de ambas produce directamente el valor correcto: 0, 1 o 2

Esto elimina los **branch mispredictions** que genera el `switch`, permitiendo que el pipeline del procesador fluya sin interrupciones.

### Resultados de ejecución

| Versión | Real | User | Sys |
|---------|------|------|-----|
| Original | `0m7,291s` | `0m5,152s` | `0m2,136s` |
| Optimizada | `0m6,385s` | `0m4,396s` | `0m1,988s` |

**Mejora:** `~0,9s` (~12% más rápido).

### Conclusión

El `switch` con rangos genera saltos condicionales que el procesador debe predecir. Cuando la predicción falla (branch misprediction), el pipeline se descarga y se pierde rendimiento. Al reemplazarlo por una expresión aritmética pura, se elimina por completo esta fuente de overhead, logrando una ejecución más rápida y predecible.

---

## Ejercicio 8: Técnica "Uso eficiente de la caché: localidad espacial y temporal"

### 8.1) Optimización del programa para mejorar localidad

**Archivo:** [`8P/8ex.c`](8P/8ex.c)

#### Código original (`solucionInicial`)
```c
for(j = 0; j < Y; j++)
    for(i = 0; i < X; i++)
        m[i][j] = i + j;
```

#### Código optimizado (`solucionOptimizada`)
```c
for(j = 0; j < Y; j++)
    for(i = 0; i < X; i++)
        m[j][i] = i + j;
```

**Optimización aplicada:** Se corrigió el patrón de acceso a la matriz. En la versión original, los bucles recorren la matriz por columnas (`m[i][j]`), lo que genera saltos de memoria aleatorios ya que C almacena arrays en orden row-major. En la versión optimizada, se accede secuencialmente (`m[j][i]`), aprovechando la **localidad espacial** y temporal de la caché.

### Resultados de ejecución

| Versión | Real | User | Sys |
|---------|------|------|-----|
| Original (acceso por columnas) | `0m45,895s` | `0m44,004s` | `0m1,876s` |
| Optimizada (acceso por filas) | `0m3,251s` | `0m2,803s` | `0m0,444s` |

**Mejora:** `~42,6s` (~93% más rápido, factor de ~14x).

---

### 8.2) Características del procesador del cluster

| Parámetro | Valor | Comando |
|-----------|-------|---------|
| Memoria caché L3 | `256K` | `cat /sys/devices/system/cpu/cpu0/cache/index2/size` |
| Línea de caché L3 | `64` bytes | `cat /sys/devices/system/cpu/cpu0/cache/index2/coherency_line_size` |

---

### 8.3) Cálculo analítico de fallos de caché

**Datos:**
- Matriz de `X × Y = 50000 × 10000 = 5×10⁸` elementos
- Cada entero ocupa `4 bytes`
- Línea de caché = `64 bytes` → `64/4 = 16` enteros por línea

#### Versión original (acceso por columnas)

Al recorrer por columnas (`m[i][j]` con `i` como índice interno), cada acceso salta a una fila diferente, provocando un **cache miss** en cada acceso:

- **Fallos de caché:** `5×10⁸` (uno por cada elemento)

#### Versión optimizada (acceso por filas)

Al recorrer por filas (`m[j][i]` con `i` como índice interno), se accede secuencialmente:

- Elementos por fila: `10000`
- Fallos por fila: `10000 / 16 = 625`
- **Fallos totales:** `50000 × 625 = 3.125×10⁷`

#### Comparación

| Versión | Fallos de caché L3 |
|---------|-------------------|
| Original | `5×10⁸` |
| Optimizada | `3.125×10⁷` |

**Reducción de fallos:** `93.75%` menos cache misses.

### Conclusión

El acceso secuencial a memoria (row-major en C) aprovecha la localidad espacial: al cargar una línea de caché, se traen 16 elementos contiguos que se utilizan en las siguientes iteraciones. El acceso por columnas invalida constantemente la caché, mientras que el acceso por filas maximiza los hits, resultando en una mejora de rendimiento de ~14x.

---

## Ejercicio 9: Suma horizontal con instrucciones vectoriales

### 9.1) Solución escalar (`9ex.c`)

Se implementa la suma horizontal de un vector de `N = 100.000.000` floats utilizando instrucciones escalares. Se utilizan 4 acumuladores independientes (`r1`, `r2`, `r3`, `r4`) para reducir dependencias entre instrucciones y permitir ILP:

```c
#define N 100000000
#define Q 4

float *vector = malloc(N * sizeof(float));
// ... inicialización ...

float r1 = 0, r2 = 0, r3 = 0, r4 = 0;
int fin = N - (N % 4);

for (i = 0; i < fin; i += 4) {
    r1 += vector[i];
    r2 += vector[i + 1];
    r3 += vector[i + 2];
    r4 += vector[i + 3];
}

float r = r1 + r2 + r3 + r4;

// Elementos sobrantes
for (i = fin; i < N; i++) {
    r += vector[i];
}
```

**Optimizaciones aplicadas:**
- **4 acumuladores independientes** para reducir dependencias de datos (ILP).
- **Loop unrolling** de factor 4 para reducir overhead del bucle.
- **Manejo de elementos sobrantes** para vectores cuyo tamaño no es múltiplo de 4.

---

### 9.2) Solución vectorial con SSE (`9opt.c`)

Se implementa la misma suma utilizando **instrucciones intrínsecas SSE** (registros de 128 bits = 4 floats por operación). Se utiliza **alineación de memoria** (`aligned_alloc(16, ...)`) para optimizar el acceso a caché.

```c
#include <xmmintrin.h>  // SSE -msse4.2

#define N 100000000

// Alineación a 16 bytes para SSE
float *vector = (float *)aligned_alloc(16, N * sizeof(float));

__m128 sum_vec = _mm_setzero_ps();  // Registro SSE inicializado a 0

int q = 4;
int fin = N - (N % q);

for (i = 0; i < fin; i += q) {
    __m128 data = _mm_load_ps(&vector[i]);       // Cargar 4 floats alineados
    sum_vec = _mm_add_ps(sum_vec, data);         // Sumar en paralelo
}

// Reducir los 4 valores del registro a un escalar
float sum_arr[q];
_mm_store_ps(sum_arr, sum_vec);
float suma_total = sum_arr[0] + sum_arr[1] + sum_arr[2] + sum_arr[3];

// Elementos sobrantes
for (i = fin; i < N; i++) {
    suma_total += vector[i];
}
```

**Optimizaciones aplicadas:**
- **SSE 4.2** con registros de 128 bits → 4 floats procesados en paralelo.
- **`aligned_alloc(16, ...)`** para alineación a 16 bytes, requerida por `_mm_load_ps`.
- **Reducción horizontal** al final: se extraen los 4 acumuladores del registro SSE y se suman como escalar.
- **Manejo de elementos sobrantes** para tamaños no múltiplos de 4.

**Comando de compilación:**
```bash
gcc -Wall -g -msse4.2 9opt.c -o 9opt
```

---

### 9.3) Comparación de rendimiento

| Versión | Real | User | Sys |
|---------|------|------|-----|
| Escalar (`9ex.c`, `-O0`) | `0m0,790s` | `0m0,637s` | `0m0,148s` |
| Escalar (`9ex.c`, `-O3`) | _(ver nota)_ | | |
| Vectorial (`9opt.c`, `-O3 -msse4.2`) | `0m0,303s` | `0m0,141s` | `0m0,157s` |

**Mejora:** `~0,487s` (~62% más rápido, factor de ~2.6x).

**Resultado verificado:** ambas versiones producen `67108864.000000` (suma de 100.000.000 elementos con valor 1).

### Análisis

La versión vectorial aprovecha instrucciones SIMD (Single Instruction, Multiple Data) para procesar 4 floats simultáneamente en un registro de 128 bits. Esto reduce la cantidad de instrucciones de carga y suma en un factor de 4. La alineación de memoria garantiza que `_mm_load_ps` acceda eficientemente a la caché L3, minimizando fallos. Además, la versión escalar también utiliza 4 acumuladores independientes, lo que permite ILP; por eso la mejora no es exactamente 4x, sino ~2.6x.

---

## Ejercicio 10: Operaciones vectoriales con funciones intrínsecas

> ⏳ Pendiente

---

## Ejercicio Adicional: Operaciones vectoriales con condicionales

> ⏳ Pendiente
