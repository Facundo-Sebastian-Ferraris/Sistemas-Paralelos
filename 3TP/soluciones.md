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

![Diagrama de la estructura de datos](p3Adiagrama.png)

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

> ⏳ Pendiente

---

## Ejercicio 7: Técnica "Evitar saltos condicionales"

> ⏳ Pendiente

---

## Ejercicio 8: Técnica "Uso eficiente de la caché: localidad espacial y temporal"

> ⏳ Pendiente

---

## Ejercicio 9: Suma horizontal con instrucciones vectoriales

> ⏳ Pendiente

---

## Ejercicio 10: Operaciones vectoriales con funciones intrínsecas

> ⏳ Pendiente

---

## Ejercicio Adicional: Operaciones vectoriales con condicionales

> ⏳ Pendiente
