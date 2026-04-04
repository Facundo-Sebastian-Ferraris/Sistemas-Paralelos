Aquí tienes el texto completo del trabajo práctico en formato Markdown, respetando el contenido original de las fuentes e incorporando emojis significativos:

# 🎓 Trabajo Práctico Nº 1: Punteros y gestión de memoria en C 💻

**Facultad de Informática**

**Objetivos de la práctica:** Comprender la **asignación de memoria dinámica** y el direccionamiento mediante **punteros** para implementar programas que requieran utilizar grandes estructuras de datos.

---

## 📍 1. Punteros
Un puntero es una variable cuyo contenido es una **dirección de memoria**. En la declaración de un puntero se indica el tipo del objeto de datos que se encontrará a partir de la dirección dada. Por ejemplo, la sentencia: `int *p;` declara el puntero `p` que apunta a un objeto de datos de tipo `int`. Para obtener la dirección de memoria de un objeto de datos se agrega el operador `&` delante del identificador del objeto. Ejemplo: `int a = 33; p = &a;` se almacena en `p` la dirección de memoria de la variable `a`, siendo `p` la variable de tipo puntero declarada anteriormente.

Para acceder al objeto de datos apuntado por un puntero, se agrega el operador `*` antes del mismo. Por ejemplo: `int x; x = a + *p;` asigna a la variable `x` el resultado de `a + *p`, es decir, de `a + a`, siendo `a` y `p` las variables anteriormente declaradas.

⚠️ **Importante:** El acceso a datos a través de punteros debe hacerse en espacios de memoria pertenecientes a objetos de datos ya declarados por el programa. Ejemplo: `int *y; *y = 10;` en este caso, se declara `y` como un puntero a un entero, y se asigna el valor 10 al objeto de datos apuntado por `y`. La compilación no da errores, pero se encontrarán problemas en la ejecución ya que `y`, en vez de contener una dirección válida de algún objeto de datos ya declarado, contiene un valor indefinido.

### 📝 Ejercicios:
**1.1) Dado el siguiente código en C, resolver:**
a) Crear, utilizando el editor de texto nano (o vim), el código fuente con el nombre `archivo.c`.
b) Compile el programa: `$ gcc archivo.c -o prog`.
c) Ejecútelo: `$ ./prog`.
d) Razone el resultado.

```c
#include <stdio.h> 
int main() {    
    int x = 10;    
    int *p;    
    p = &x;
    printf("Dirección de x: %p \n", &x);    
    printf("Dirección almacenada en p: %p \n", p);    
    printf("Valor de *p: %d \n", *p);     
    return 0; 
}
```

**1.2) Dado el siguiente código en C, resolver:**
a) Analice el código del programa para determinar el valor final de `a` y `b`.
b) Compile el programa y ejecútelo para comprobar los resultados.

```c
#include <sys/types.h> 
#include <unistd.h> 
#include <stdio.h>  
int main() {    
    int a, b;    
    int *x, *y;     
    a = 10;    
    b = 20;    
    x = &a;    
    y = &b;    
    x = y;    
    *x = 5;     
    return 0; 
}
```

---

## 🔢 2. Punteros y arreglos
El nombre de un arreglo se evalúa a su dirección inicial (`arreglo` es equivalente a `&arreglo`), es decir, es un puntero al inicio del arreglo. De esta manera, es posible operar sobre arreglos utilizando la notación de arreglos o punteros indistintamente. Por ejemplo, dado el arreglo `int a`, el primer elemento puede ser accedido indistintamente como `a` o `*a`, el segundo elemento como `a` o `*(a+1)`,…, y el décimo como `a` o `*(a+9)`. Lo mismo ocurre a la inversa, es decir, es posible operar con un puntero utilizando la notación de punteros o arreglos indistintamente.

### 📝 Ejercicios:
**2.1)** Declare un arreglo `a` de 5 elementos de tipo `float`. Luego asigne cualquier valor al contenido del quinto elemento, accediéndolo a través de la notación de punteros. Finalmente muestre por pantalla el valor del elemento modificado utilizando la notación de arreglos.

**2.2) Este ejercicio se basa en descubrir cómo se almacena una matriz en memoria. Resuelva:**
a) Escriba un programa en C que declare una matriz de 3x4 elementos enteros, y muestre la dirección para cada elemento de la matriz. La salida debe ser: “Elemento[i][j] - Dirección”.
b) A partir de los valores de direcciones obtenidos para cada elemento, deduzca la disposición de los elementos de la matriz en memoria: almacenamiento por filas o almacenamiento por columnas.

---

## 🔗 3. Punteros a punteros
Un puntero a puntero es una forma de **indirección múltiple**. Normalmente, un puntero contiene la dirección de una variable objetivo que es de un cierto tipo que no es justamente un puntero. Cuando definimos un puntero a puntero, el primer puntero contiene la dirección del segundo puntero, el cual contiene la dirección de la variable objetivo.

Cuando se desea declarar un puntero a puntero, se ubica un asterisco adicional en el frente de su nombre. Por ejemplo: `int **p2;`.

### 📝 Ejercicio:
**3.1) Dado el siguiente código en C. ¿Cuál cree que será el valor final de `num`? Compile el programa y ejecútelo para comprobar el resultado.**

```c
#include <stdio.h>  
int main() {    
    int num;    
    int *p1;    
    int **p2;     
    num = 123;    
    p1 = &num;    
    p2 = &p1;     
    *p1 = num - 23;    
    **p2 = *p1 * 2;     
    printf("Valor de num = %d\n", num);     
    return 0; 
}
```

---

## 🧠 4. Organización de la memoria
Los programas en ejecución (procesos), son organizados o desplegados en segmentos de memoria de diferentes tamaños y con distintas propiedades. Esta organización depende fuertemente del compilador, sistema operativo y hardware subyacente. Un proceso de un programa en C típicamente consiste de los siguientes segmentos:

*   **🥞 Stack:** Contiene la pila del programa, una estructura **LIFO** (último que entra primero que sale). Almacena direcciones de retorno, entorno de funciones y variables locales. Su espacio es fijo (normalmente 8MB).
*   **🏔️ Heap:** Utilizado para la **asignación de memoria dinámica** solicitada en tiempo de ejecución. El programador debe liberarlo explícitamente ya que C no tiene recolector de basura.
*   **🌑 Uninitialized Data o BSS:** Contiene variables globales y estáticas no inicializadas o inicializadas en cero.
*   **🌕 Initialized Data:** Almacena variables globales o estáticas inicializadas con valores distintos de cero.
*   **📜 Text:** Área que contiene las **instrucciones de máquina** que ejecuta la CPU.

---

## ⚙️ 5. Asignación dinámica de memoria
Para almacenar arreglos grandes que exceden el tamaño de los segmentos estáticos, es necesario utilizar el segmento **Heap**.

La gestión se lleva a cabo mediante:
*   **`malloc(n)`:** Reserva un bloque de `n` bytes y retorna un puntero al inicio. Si falla, retorna `NULL`.
*   **`free(p)`:** Libera el espacio apuntado por `p`. Nunca debe liberarse dos veces un mismo bloque.

### 📝 Ejercicios:
**5.1) Explique qué hace el siguiente fragmento de código:**
```c
int *p;  
p = (int *) malloc(sizeof(int)); 
*p = 50;
```

**5.2) Reemplazar la sentencia `int p` por una declaración con memoria dinámica.**
```c
int p; 
p = 1; p = 2; p = 3; p = 4; p = 5;
```

**5.3) Almacenamiento de matrices con memoria dinámica.** Es posible utilizar dos estrategias:
a) **Almacenamiento con filas separadas:** Un arreglo de punteros `x` donde cada elemento mantiene la dirección de una fila reservada con `malloc`.
b) **Almacenamiento con filas unidas:** Se reserva un único bloque contiguo para todas las filas y un arreglo de punteros `x` apunta al inicio de cada fila.

**Resolver:** Implementar un programa que, utilizando el almacenamiento con **filas unidas**, almacene e imprima la siguiente matriz de 3x4:
```
0 1 2 3
1 2 3 4
2 3 4 5
```

**c) Espacio máximo de memoria RAM disponible:**
i) Utilizando el comando `free`, determinar el tamaño máximo de memoria que podría solicitar un proceso evitando el uso del área de intercambio (swap).
ii) Suponga una estructura de datos que almacena una gran matriz de elementos de tipo `double`. Determinar el número máximo aproximado de elementos que podría tener la matriz para el espacio de memoria calculado anteriormente.
