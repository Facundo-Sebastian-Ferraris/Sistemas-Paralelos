# 📚 Respuestas - TP Nº 1: Punteros y gestión de memoria en C

---

## 1️⃣ Punteros

### Ejercicio 1.1
**Archivo:** [`archivo.c`](./archivo.c)

**Análisis:**
- `x = 10` → variable entera con valor 10
- `p = &x` → puntero `p` almacena la dirección de memoria de `x`
- `&x` y `p` tienen el **mismo valor** (ambos son la dirección de `x`)
- `*p` desreferencia el puntero, obteniendo el valor almacenado en esa dirección (10)

**Resultado esperado:**
```
Dirección de x: 0x7fff... (ejemplo)
Dirección almacenada en p: 0x7fff... (misma dirección)
Valor de *p: 10
```

---

### Ejercicio 1.2
**Archivo:** [`ej1-2.c`](./ej1-2.c)

**Análisis paso a paso:**
```c
a = 10;           // a = 10
b = 20;           // b = 20
x = &a;           // x apunta a a
y = &b;           // y apunta a b
x = y;            // x ahora apunta a b (mismo地址 que y)
*x = 5;           // modifica el valor apuntado por x → b = 5
```

**Resultado final:**
| Variable | Valor |
|----------|-------|
| `a` | 10 |
| `b` | 5 |

**Conclusión:** Al hacer `x = y`, ambos punteros apuntan a `b`. Por lo tanto, `*x = 5` modifica `b`, no `a`.

---

## 2️⃣ Punteros y arreglos

### Ejercicio 2.1
**Archivo:** [`ej2-1.c`](./ej2-1.c)

**Código:**
```c
float a[5];
*(a+4) = 10.0;           // notación de punteros para acceder al 5º elemento
printf("%f\n", a[4]);    // notación de arreglos para imprimir
```

**Explicación:**
- `a` es un puntero al primer elemento del arreglo
- `*(a+4)` accede al elemento en la posición 4 (quinto elemento, índice base 0)
- Equivale a `a[4]`
- El valor asignado es `10.0`

**Salida:**
```
El quinto elemento es 10.000000
```

---

### Ejercicio 2.2
**Archivo:** [`ej2-2.c`](./ej2-2.c)

**Código:**
```c
int a[3][4];
for(int i = 0; i<3; i++)
   for(int j = 0; j<4; j++)
      printf("a[%d][%d] = %p\n", i, j, &a[i][j]);
```

**Conclusión:**
Las matrices en C se almacenan en **orden row-major (por filas)**. Esto significa que los elementos de una fila se almacenan contiguos en memoria, y luego sigue la siguiente fila.

**Ejemplo de salida:**
```
a[0][0] = 0x7fff...00
a[0][1] = 0x7fff...04
a[0][2] = 0x7fff...08
a[0][3] = 0x7fff...0C
a[1][0] = 0x7fff...10    ← continúa después de la fila 0
a[1][1] = 0x7fff...14
...
```

Cada `int` ocupa 4 bytes, por eso las direcciones incrementan de 4 en 4.

---

## 3️⃣ Punteros a punteros

### Ejercicio 3.1
**Archivo:** [`ej3-1.c`](./ej3-1.c)

**Análisis paso a paso:**
```c
num = 123;          // num = 123
p1 = &num;          // p1 apunta a num
p2 = &p1;           // p2 apunta a p1 (puntero a puntero)

*p1 = num - 23;     // num = 123 - 23 = 100
**p2 = *p1 * 2;     // **p2 accede a num → num = 100 * 2 = 200
```

**Resultado final:**
```
Valor de num = 200
```

**Explicación:**
- `*p1` accede directamente a `num`
- `**p2` es equivalente a `*p1`, que es equivalente a `num`
- Ambas operaciones modifican la misma variable `num`

---

## 4️⃣ Organización de la memoria

*(Este ejercicio es teórico, no tiene código asociado)*

**Segmentos de memoria:**

| Segmento | Descripción |
|----------|-------------|
| **🥞 Stack** | Variables locales, parámetros de funciones, direcciones de retorno. LIFO. Tamaño fijo (~8MB). |
| **🏔️ Heap** | Memoria dinámica (malloc/free). El programador gestiona la liberación. |
| **🌑 BSS** | Variables globales/estáticas no inicializadas (inicializadas en 0 por defecto). |
| **🌕 Data** | Variables globales/estáticas inicializadas con valor ≠ 0. |
| **📜 Text** | Código del programa (instrucciones de máquina). Solo lectura. |

---

## 5️⃣ Asignación dinámica de memoria

### Ejercicio 5.1
**Archivo:** [`ej5-1.c`](./ej5-1.c)

**Código:**
```c
int *p;
p = (int *) malloc(sizeof(int));
*p = 50;
```

**Explicación:**
1. `int *p;` → declara un puntero a entero
2. `malloc(sizeof(int))` → reserva 4 bytes en el **Heap**
3. `(int *)` → castea el `void*` retornado por malloc a `int*`
4. `*p = 50;` → almacena el valor 50 en la memoria reservada

**Importante:** El cast es necesario porque `malloc` retorna `void*`. El tipo de casteo determina cómo se interpretará la memoria al recorrerla.

---

### Ejercicio 5.2
**Archivo:** [`ej5-2.c`](./ej5-2.c)

⚠️ **El código original tiene un error de compilación:**
```c
int p[5];           // ← p declarado como arreglo
int *p = malloc(...); // ← ERROR: redeclaración de p
```

**Corrección sugerida:**
```c
int *p = (int *) malloc(sizeof(int) * 5);  // reserva espacio para 5 enteros
p[0] = 1; p[1] = 2; p[2] = 3; p[3] = 4; p[4] = 5;
```

**Fórmula para acceso en matrices 1D simulando 2D:**
```
elemento[x][y] = p[x * M + y]
```
Donde `M` es la cantidad de columnas.

---

### Ejercicio 5.3
**Enunciado:** Implementar matriz 3x4 con **filas unidas** (un único bloque contiguo).

**Solución propuesta:**
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int **matriz;
    int *bloque;
    int filas = 3, columnas = 4;
    
    // Reservar arreglo de punteros (para las filas)
    matriz = (int **) malloc(filas * sizeof(int *));
    
    // Reservar un único bloque contiguo para todos los elementos
    bloque = (int *) malloc(filas * columnas * sizeof(int));
    
    // Hacer que cada fila apunte a la posición correspondiente del bloque
    for (int i = 0; i < filas; i++) {
        matriz[i] = bloque + (i * columnas);
    }
    
    // Inicializar y mostrar la matriz
    int valor = 0;
    for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
            matriz[i][j] = valor + i + j;
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }
    
    // Liberar memoria
    free(bloque);
    free(matriz);
    
    return 0;
}
```

**Salida:**
```
0 1 2 3
1 2 3 4
2 3 4 5
```

**Ventajas de filas unidas:**
- ✅ Mejor localidad espacial (acceso más rápido por caché)
- ✅ Una sola llamada a `free()` para los datos
- ✅ Memoria contigua (mejor para operaciones vectoriales)

---

### Ejercicio 5.3.c) Memoria máxima disponible

**i) Comando `free`:**
```bash
$ free -h
```
Busca la columna **available** en la fila **Mem**. Ese es el espacio máximo sin usar swap.

**ii) Cálculo para matriz de `double`:**
```
Tamaño de double = 8 bytes

Si available = 7.5 GB ≈ 8,053,063,680 bytes

Número máximo de elementos = 8,053,063,680 / 8 ≈ 1,006,632,960 elementos
```

Esto equivale aproximadamente a una matriz de **31,700 × 31,700** elementos.

---

## 🔗 Índice de archivos

| Archivo | Ejercicio | Descripción |
|---------|-----------|-------------|
| [`archivo.c`](./archivo.c) | 1.1 | Introducción a punteros |
| [`ej1-2.c`](./ej1-2.c) | 1.2 | Asignación entre punteros |
| [`ej2-1.c`](./ej2-1.c) | 2.1 | Arreglos y notación de punteros |
| [`ej2-2.c`](./ej2-2.c) | 2.2 | Matrices y almacenamiento en memoria |
| [`ej3-1.c`](./ej3-1.c) | 3.1 | Punteros a punteros |
| [`ej5-1.c`](./ej5-1.c) | 5.1 | malloc básico |
| [`ej5-2.c`](./ej5-2.c) | 5.2 | Arreglo dinámico (con error) |

---

*Trabajo práctico resuelto - Sistemas Paralelos*
