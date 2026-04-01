# 🛠️ Trabajo Práctico Nº 2: Uso de un cluster

Este documento detalla las consignas completas para el **Trabajo Práctico Nº 2** de la asignatura Sistemas Paralelos 2026, enfocado en el uso y gestión de recursos en un entorno de cluster.

---

### 🎯 Objetivos de la práctica
*   Acceder al cluster.
*   Subir archivos al cluster y descargar archivos desde él.
*   Lanzar trabajos al cluster utilizando el gestor de colas SLURM.

### 📚 Bibliografía de referencia
*   Documentación de SLURM.
*   Documentación del cluster III-LIDI.

---

### 📝 Ejercicios

#### 1. Acceso inicial 🔑
Ingresar al cluster **III-LIDI** con sus credenciales personales de acceso recibidas en su cuenta de correo institucional. La IP del frontend del cluster es `163.10.34.49`. Recordar que la contraseña no debe ser modificada.

#### 2. Gestión de archivos 📂
En su home del cluster crear la carpeta **TP2**. Luego, en su máquina local, descargar el archivo `serie.c`. Finalmente, desde su máquina local, ejecutar el comando `scp` para subir el archivo `serie.c` a la carpeta TP2 creada previamente en el cluster.

#### 3. Recursos del cluster 📊
Explicar la salida generada por la ejecución de cada uno de los siguientes comandos, interpretando las opciones utilizadas según la descripción proporcionada en la página del manual (`man sinfo`):
*   `$ sinfo -o '%9P %5D %7X %5Y %4c %7Z %10N %11e'` («Descripción de particiones y nodos»).
*   `$ sinfo -o '%9P %10N %t'` («estados de los nodos»).

#### 4. Lanzar trabajos a ejecución 🚀
**a.** Prepararemos un programa para lanzarlo a ejecución en los siguientes incisos. A continuación compilar el código del programa `serie.c` para generar un archivo ejecutable:
`$ gcc serie.c -o serie`.

**b.** Crear el siguiente script bajo el nombre `launch_serie`:
```bash
#!/bin/bash
#SBATCH -N 1
#SBATCH --exclusive
#SBATCH --partition=Blade
#SBATCH -o salida.txt
#SBATCH -e errores.txt

echo Iniciando el programa
./serie
echo Fin del programa
```
.

**c.** Enviar el trabajo a ejecución: `$ sbatch launch_serie`.

**d.** Explicar qué se hace en cada línea del script `launch_serie` apoyándose en la documentación provista.

**e.** De acuerdo a la salida del trabajo ejecutado, indicar en qué nodo y en qué número de core ejecutó el proceso correspondiente. Finalmente, explicar el código del programa `serie.c`.

**f.** Es posible indicar al gestor de colas un nodo específico a utilizar mediante la opción nodelist (`--nodelist=nombre_nodo,nombre_otro_nodo,etc`). Encontrar un nodo libre diferente al anteriormente utilizado y modificar el script para ejecutar en él. Finalmente, lanzar el trabajo a ejecución y verificar que haya ejecutado en el nodo indicado.

**g.** Es posible definir opciones desde fuera del script de sbatch. Comentar la línea de `launch_serie` que especifica la lista de nodos (utilizar `##` al inicio de la línea para transformarla en un comentario) y lanzar el trabajo indicando la opción fuera del script:
`$ sbatch --nodelist=... launch_serie`.

**h.** ¿Si la opción está especificada tanto dentro como fuera del script, cuál tiene prioridad? Hallar la respuesta de manera experimental en función del nodo en el que se ejecuta un trabajo luego de haber indicado un nombre de nodo diferente para la opción del script y la opción de afuera.

#### 5. Estados y cancelación de trabajos 🛑
**a.** Enviar a ejecución cualquier trabajo y luego ejecutar el comando:
`scontrol show job identificador_del_trabajo`.
De acuerdo a la salida observada, indicar la siguiente información relacionada al trabajo:
*   Estado.
*   Lista de nodos.
*   Comando.
*   Archivo de salida.
*   Archivo de error.

**b.** Dejando libre la elección del nodo (no especificar un nombre de nodo), lanzar un trabajo que ejecute el comando `sleep 20` (se espera producir una espera de 20 segundos). Inmediatamente después, ejecutar el comando `$ squeue`. En el listado observado, identificar el trabajo enviado a ejecución. Luego, de acuerdo al estado indicado para el trabajo, mencionar el nombre corto del estado, nombre largo, y significado (Nota: ver JOB STATE CODES en la página del manual). Finalmente, si corresponde, completar la siguiente información:
1. Tiempo que lleva ejecutando.
2. Lista de nodos asignados.

**c.** Lanzar un trabajo que requiera ejecutar en un nodo ocupado (forzar su ocupación ejecutando un trabajo). Indicar el nombre corto observado del estado, nombre largo y significado.

**d.** Enviar un trabajo a ejecución y eliminarlo con el siguiente comando:
`$ scancel número_identificador_trabajo`.
Luego de ejecutar scancel, comprobar que el trabajo no aparezca listado al ejecutar el comando `squeue`.

**e.** Buscar la opción que permita definir un límite máximo de tiempo de ejecución de un trabajo al utilizar `sbatch`. Comprobar su uso de manera experimental y detallar la experimentación realizada.

#### 6. Detalle de los recursos de un nodo 🖥️
**a.** Ejecutar un trabajo, en cualquier nodo, que ejecute los siguientes dos comandos:
1. `lscpu`.
2. `free`.

**b.** Indicar el nombre del nodo en donde se ejecutó el trabajo.

**c.** ¿Cuántos sockets tiene el nodo?

**d.** ¿Qué modelo de microprocesador utiliza el nodo? ¿Cuántos cores tiene ese modelo de microprocesador?

**e.** ¿Es una máquina UMA o NUMA? Justifique su respuesta.

**f.** ¿Cuál es el tamaño máximo aproximado de memoria RAM que se podría disponer para nuestro trabajo?

**g.** ¿Cuál es el tamaño máximo de memoria (considerando RAM y área de intercambio) que se podría disponer para nuestro trabajo?
