# Niveles de Optimización en GCC

## `-O0` (por defecto)

- Reduce el tiempo de compilación
- Depuración produce resultados esperados
- Ninguna optimización activada

---

## `-O1` (`-O`)

- Reduce tiempo de ejecución y tamaño de código
- Compilación algo más lenta
- Activa flags como:
  - `-fauto-inc-dec`
  - `-fbranch-count-reg`
  - `-fdce`
  - `-fomit-frame-pointer`
  - `-ftree-ccp`
  - `-ftree-fre`
  - `-fsplit-wide-types`
  - Entre otros (~40 flags)

---

## `-O2` (recomendado para producción)

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

## `-O3` (máxima optimización)

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
