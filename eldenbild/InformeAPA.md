# Elden Bild: Informe bajo Normas APA

**Resumen**  
Elden Bild es una aplicación móvil desarrollada en Flutter que permite a los jugadores de Elden Ring crear, gestionar y compartir builds de personajes. El sistema resuelve la problemática de organización y planificación de builds en un entorno complejo, proporcionando una herramienta centralizada, segura y escalable.

**Introducción**  
La complejidad de Elden Ring genera la necesidad de una solución tecnológica que facilite la gestión de builds, armas y personajes. Elden Bild responde a esta necesidad mediante una aplicación distribuida, con autenticación y almacenamiento en la nube.

**Desarrollo**
- **Definición del problema:** Los jugadores requieren una herramienta para organizar builds y acceder a ellos desde cualquier dispositivo.
- **Justificación del sistema distribuido:** El acceso concurrente, la seguridad y la escalabilidad justifican el uso de Firebase como backend distribuido.
- **Modelo arquitectónico:** Se selecciona el modelo cliente-servidor distribuido, donde la aplicación móvil actúa como cliente y Firebase como servidor y base de datos remota.
- **Capas del sistema:** Presentación (Flutter), lógica de negocio (servicios de autenticación y gestión de builds), datos (Firestore).
- **Componentes:** Cliente (app Flutter), servidor (Firebase), base de datos (Firestore), servicios intermedios (Firebase Authentication).
- **Protocolo y seguridad:** Comunicación vía HTTPS, gestión de usuarios y permisos por Firebase Authentication.
- **Tabla comparativa de modelos arquitectónicos:**

| Modelo         | Descripción                                      | Ventajas                                 | Desventajas                              | Aplicación en Elden Bild                |
|---------------|--------------------------------------------------|------------------------------------------|------------------------------------------|-----------------------------------------|
| Centralizado   | Todo el procesamiento y datos en un solo servidor| Fácil de gestionar, menor complejidad    | Escalabilidad limitada, punto único de fallo | No recomendado, requiere acceso desde varios dispositivos y escalabilidad |
| Distribuido    | Procesamiento y datos repartidos en varios nodos | Escalabilidad, alta disponibilidad       | Mayor complejidad, gestión de seguridad  | Usado: Firebase distribuye autenticación y datos en la nube |
| Híbrido        | Combina centralizado y distribuido               | Flexibilidad, puede optimizar recursos   | Complejidad de integración               | No aplicado en Elden Bild, pero útil en sistemas grandes |

- **Ejemplo de flujo de operación:** El usuario se registra, accede a la pantalla principal, crea o gestiona builds, y los datos se almacenan en Firestore.

**Conclusiones**  
Elden Bild cumple con los requisitos de un sistema distribuido, facilitando la gestión de builds y la orientación sobre objetos clave en Elden Ring. La arquitectura seleccionada garantiza escalabilidad, seguridad y disponibilidad.

**Referencias**  
- Flutter. (2026). Flutter documentation. https://flutter.dev/docs/get-started/install  
- Firebase. (2026). Firebase documentation. https://firebase.google.com/docs  
- From Software. (2022). Elden Ring [Video game]. Bandai Namco.
