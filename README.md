# Ejemplos de Programación Asíncrona en Flutter

Este proyecto es una aplicación móvil desarrollada en Flutter que incluye varios ejemplos prácticos de programación asíncrona. Está diseñado para ser utilizado como recurso educativo por estudiantes que desean aprender y practicar conceptos como el manejo de `Future` y `Stream` en Flutter.

---

## 🚀 **Características**

- **Interfaz atractiva:** Diseño profesional inspirado en los colores institucionales de la UIDE.
- **Ejemplos prácticos:** Incluye cuatro ejemplos detallados que demuestran el uso de programación asíncrona en diferentes escenarios.
- **Código modular:** Los servicios asíncronos están separados para facilitar la escalabilidad y mantenimiento.
- **Fácil navegación:** Sistema de rutas implementado para acceder a cada ejemplo desde la pantalla principal.

---

## 📱 **Ejemplos Incluidos**

### 1. **Ejemplo Future**
Demuestra cómo manejar tareas asíncronas con `Future`. Incluye un ejemplo de simulación de carga de datos con un retraso programado.

- **Clase principal:** `FutureExample`
- **Ruta:** `/futureExample`

---

### 2. **Ejemplo Stream**
Ilustra el uso de `Stream` para gestionar flujos de datos en tiempo real, como un contador que se actualiza cada segundo.

- **Clase principal:** `StreamExample`
- **Ruta:** `/streamExample`

---

### 3. **Ejemplo API Simulada**
Simula la consulta de datos desde una API y muestra los resultados en una lista desplegable. Es ideal para entender el manejo de datos remotos.

- **Clase principal:** `ApiSimulationExample`
- **Ruta:** `/apiSimulation`

---

### 4. **Ejemplo Descarga**
Simula el proceso de descarga de un archivo con una barra de progreso que se actualiza en tiempo real usando `Stream`.

- **Clase principal:** `DownloadExample`
- **Ruta:** `/downloadExample`

---

## 🎨 **Diseño y Apariencia**

El diseño de la aplicación utiliza los colores institucionales de la **UIDE**:

- **Granate (#7A003C):** Color principal para botones y AppBar.
- **Amarillo (#FFD700):** Color de acento para degradados y detalles.
- **Blanco:** Fondo limpio y profesional.

### **Captura de Pantalla:**
*(Inserta capturas de pantalla de la app aquí para que se vea atractiva en GitHub).*

---

## 🛠️ **Estructura del Proyecto**

lib/ ├── main.dart # Archivo principal ├── services.dart # Servicios asíncronos ├── future_example.dart # Ejemplo Future ├── stream_example.dart # Ejemplo Stream ├── api_simulation.dart # Ejemplo API Simulada ├── download_example.dart # Ejemplo Descarga


---

## 🧑‍💻 **Cómo Usar el Proyecto**

### 1. **Requisitos Previos**
- Flutter 3.27.0 o superior
- Dart 3.6.0
- Un editor de texto como VS Code o Android Studio

### 2. **Clona el Repositorio**
```bash
git clone https://github.com/richardmijo/asincrono.git
cd asincrono

 Instala las Dependencias

 flutter pub get


Ejecuta la Aplicación

flutter run
