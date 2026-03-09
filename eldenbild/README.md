# Elden Bild

**Introducción**  
La complejidad de Elden Ring genera la necesidad de una solución tecnológica que facilite la gestión de builds, armas y personajes. Elden Bild responde a esta necesidad mediante una aplicación distribuida, con autenticación y almacenamiento en la nube.

**Descripción del problema**  
Los jugadores requieren una herramienta para organizar builds y acceder a ellos desde cualquier dispositivo, resolviendo la desorganización y pérdida de tiempo en la planificación.

**Justificación del sistema distribuido**  
El acceso concurrente, la seguridad y la escalabilidad justifican el uso de Firebase como backend distribuido, permitiendo disponibilidad y acceso desde cualquier lugar.

**Arquitectura seleccionada**  
Modelo cliente-servidor distribuido: aplicación móvil Flutter como cliente, Firebase como servidor y base de datos remota.

**Diagramas**
- General: Usuario → App Flutter → Firebase (Authentication y Firestore)
- Cliente–Servidor: App Flutter (cliente) ↔ Firebase (servidor)
- Capas: Presentación (Flutter), Lógica de negocio (servicios), Datos (Firestore)
- Microservicios: No aplica, Firebase gestiona servicios como autenticación y base de datos.

**Infraestructura propuesta (nube)**  
Firebase como backend en la nube, gestionando autenticación, base de datos y escalabilidad.

**Análisis de escalabilidad**  
Firebase permite escalabilidad horizontal, gestión de usuarios concurrentes y almacenamiento seguro en la nube.

**Conclusiones**  
Elden Bild cumple con los requisitos de un sistema distribuido, facilitando la gestión de builds y la orientación sobre objetos clave en Elden Ring. La arquitectura seleccionada garantiza escalabilidad, seguridad y disponibilidad.

## ¿Qué hace la app?

Elden Bild ofrece una interfaz intuitiva para:
- **Crear builds personalizados**: Define las estadísticas de tu personaje (Vigor, Mente, Resistencia, Fuerza, Destreza, Inteligencia, Fe y Arcanos) y guarda builds con títulos descriptivos.
- **Gestionar builds**: Visualiza tus builds en la página de inicio, accede a secciones dedicadas para personajes y armas.
- **Búsqueda y orientación de objetos clave**: Incluye funcionalidades de búsqueda para encontrar builds rápidamente, y proporciona orientación sobre armas, personajes y objetos clave en Elden Ring para ayudar en la toma de decisiones.
- **Autenticación de usuarios**: Regístrate e inicia sesión para guardar tus builds en la nube de forma segura.
- **Navegación fácil**: Usa la barra de navegación inferior para alternar entre Inicio, Personajes y Armas.

## ¿Qué resuelve?

Elden Ring es un juego complejo con muchas opciones de builds, lo que puede ser abrumador para los jugadores nuevos o experimentados. Elden Bild resuelve esto al proporcionar:
- Una herramienta centralizada para planificar y recordar builds sin necesidad de notas dispersas.
- Almacenamiento en la nube para acceder a tus builds desde cualquier dispositivo.
- Búsqueda rápida y orientación sobre objetos clave, facilitando la navegación en el vasto mundo de Elden Ring y la selección de estrategias óptimas.
- Una comunidad implícita al permitir compartir builds (futuras actualizaciones).
- Simplificación del proceso de creación de builds, enfocándose en las estadísticas clave.

## Requisitos

Para ejecutar esta aplicación, necesitas:
- **Flutter SDK**: Versión 3.0 o superior. Instálalo desde [flutter.dev](https://flutter.dev/docs/get-started/install).
- **Dart**: Incluido con Flutter.
- **Firebase**: Configura un proyecto en Firebase Console para autenticación y almacenamiento.
  - Habilita Authentication con email/password.
  - Configura Firestore para almacenar builds.
- **Dispositivo o emulador**: Android/iOS para probar la app.

## Instalación y ejecución

1. Clona el repositorio:
   ```
   git clone https://github.com/tu-usuario/eldenbild.git
   cd eldenbild
   ```

2. Instala las dependencias:
   ```
   flutter pub get
   ```

3. Configura Firebase:
   - Agrega tu archivo `google-services.json` (para Android) en `android/app/`.
   - Agrega tu archivo `GoogleService-Info.plist` (para iOS) en `ios/Runner/`.

4. Ejecuta la app:
   ```
   flutter run
   ```

## Contribución

Si deseas contribuir:
- Crea un issue para reportar bugs o sugerir features.
- Envía un pull request con tus cambios.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

## Tabla comparativa de modelos arquitectónicos

| Modelo         | Descripción                                      | Ventajas                                 | Desventajas                              | Aplicación en Elden Bild                |
|---------------|--------------------------------------------------|------------------------------------------|------------------------------------------|-----------------------------------------|
| Centralizado   | Todo el procesamiento y datos en un solo servidor| Fácil de gestionar, menor complejidad    | Escalabilidad limitada, punto único de fallo | No recomendado, requiere acceso desde varios dispositivos y escalabilidad |
| Distribuido    | Procesamiento y datos repartidos en varios nodos | Escalabilidad, alta disponibilidad       | Mayor complejidad, gestión de seguridad  | Usado: Firebase distribuye autenticación y datos en la nube |
| Híbrido        | Combina centralizado y distribuido               | Flexibilidad, puede optimizar recursos   | Complejidad de integración               | No aplicado en Elden Bild, pero útil en sistemas grandes |
