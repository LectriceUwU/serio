# Publicar Serio con datos compartidos

La aplicación ya está preparada para publicarse con GitHub Pages y sincronizar una única mesa compartida con Supabase.

## 1. Crear el proyecto en Supabase

1. Crea un proyecto en [Supabase](https://supabase.com/dashboard).
2. Abre `SQL Editor` y ejecuta el contenido completo de `supabase-schema.sql`.
3. En `Connect` o `Project Settings > API`, copia:
   - La URL del proyecto.
   - La `Publishable key` (si tu panel solo muestra `anon key`, usa esa).

Estas credenciales son públicas y se usan en el navegador. No copies nunca una clave `service_role`.

## 2. Activar la sala compartida

Edita `config.js`:

```js
window.SERIO_SYNC_CONFIG = {
  supabaseUrl: "https://tu-proyecto.supabase.co",
  supabasePublishableKey: "tu-clave-publica",
  roomCode: "serio-amigos"
};
```

Todos los amigos que abran la misma versión de la app con el mismo `roomCode` compartirán jugadores, ranking, partidas, estadísticas, planos y la partida activa. El primer dispositivo que entre crea la sala con los datos de ejemplo actuales.

El código de sala solo sirve para distinguir grupos; no es una contraseña. Este modo es deliberadamente abierto para un grupo de confianza.

## 3. Publicar en GitHub Pages

1. Crea un repositorio de GitHub y sube **todo** este proyecto, incluida la carpeta `.github`.
2. En el repositorio, abre `Settings > Pages`.
3. En `Build and deployment`, selecciona `GitHub Actions` como fuente.
4. Haz `git push` a la rama `main`.
5. Cuando termine la acción `Deploy Serio to GitHub Pages`, GitHub mostrará la URL de la aplicación.

El flujo de despliegue publica el contenido de la carpeta `outputs`, incluidas las imágenes de `assets` y el archivo `config.js`.

## Uso diario

- El indicador junto al usuario muestra `Sincronizado` cuando la mesa común está conectada.
- Un cambio hecho por un amigo se refleja automáticamente en los demás dispositivos.
- La partida activa, las vidas y los contadores también se comparten.
- Si Supabase no está configurado o no hay conexión, la aplicación sigue funcionando solo en el navegador actual.

## Límite conocido

Las fotos y planos se guardan de momento dentro del estado compartido. Para una mesa pequeña funciona bien; si se añaden muchas imágenes grandes, el siguiente paso sería moverlas a Supabase Storage.
