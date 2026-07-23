# Serio · prototipo

Abre `index.html` en un navegador moderno para probar la aplicación.

El prototipo es una aplicación web estática: no necesita instalación ni servidor. Los jugadores, las partidas, los torneos, el ranking y las reglas se guardan en el almacenamiento local del navegador.

## Datos de prueba

Puedes iniciar sesión con cualquiera de estos jugadores:

- Carlos
- Ana
- Beatriz
- Diego
- Lucía
- Marcos

En `Lista de jugadores` está disponible la opción `Restablecer demo` para volver al estado inicial.

## ELO y ranking

El ELO secreto comienza en 1000 y el visible es `secreto - 900`. Las partidas serias aplican K=20, cálculo por enfrentamientos entre jugadores y los multiplicadores de Tier 1 a Tier 5. En partidas de 3 o más jugadores se puede marcar precon sin modificar, primera sangre y no usar comandante ni habilidades; la participación (+1) se aplica automáticamente.

Cada partida guarda un bloque `elo` con `enabled`, `applied`, `changes`, `config` y `reversible`. Al borrar una partida seria, se resta únicamente el delta asociado a esa partida; no se recalculan las posteriores.

La pantalla que antes mostraba torneos ahora es `Ranking`. Su nombre se puede cambiar, por ejemplo a `Circuito de verano`, y queda guardado para todos los accesos del mismo dispositivo.

## Partidas, estadísticas y planos

Al cerrar una partida se asigna una posición del 1 al 6 a cada jugador. Se pueden repetir posiciones para registrar empates y el ELO compara cada pareja según su posición.

Los ajustes de vida se registran con jugador que realiza la acción y objetivo. Cambios inversos consecutivos del mismo jugador sobre el mismo objetivo se cancelan durante una ventana corta para no contar correcciones de missclick como daño y curación reales.

`Estadísticas` muestra partidas totales, amistosas y serias, daño, curación, mayor golpe, mayor ELO histórico y planos avanzados. `Personalizar` permite crear grupos, añadir imágenes 5:3.5, activar o desactivar planos y eliminarlos. Durante una partida se puede cambiar entre Vidas y Planos deslizando la pantalla.
