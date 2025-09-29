# Finny - Plataforma de Cursos Online

Una aplicación móvil desarrollada en Flutter para la gestión y visualización de cursos online con funcionalidades de progreso, favoritos y filtrado.

## 📱 Características

- **Catálogo de Cursos**: Navegación y búsqueda de cursos disponibles
- **Sistema de Favoritos**: Guardar cursos de interés
- **Progreso de Usuario**: Seguimiento del avance en los cursos
- **Filtros Avanzados**: Búsqueda por nivel, rol, producto y duración
- **Tema Adaptativo**: Soporte para modo claro y oscuro
- **Diseño Responsivo**: Optimizado para diferentes tamaños de pantalla
- **Gestión de Conectividad**: Manejo de estados de conexión a internet

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework principal (3.35.4)
- **Riverpod**: Gestión de estado reactiva
- **Go Router**: Navegación declarativa
- **Dio**: Cliente HTTP para APIs
- **Shared Preferences**: Almacenamiento local
- **Connectivity Plus**: Monitoreo de conectividad
- **Google Fonts**: Tipografías personalizadas
- **Flutter SVG**: Soporte para iconos SVG

## 📋 Prerrequisitos

### Software Requerido

#### 1. Flutter SDK (3.35.4+)

```bash
# Verificar versión actual
flutter --version

# Si no está instalado, descargar desde:
# https://docs.flutter.dev/get-started/install

# Agregar al PATH (Windows)
# Agregar C:\flutter\bin al PATH del sistema

# Agregar al PATH (macOS/Linux)
echo 'export PATH="$PATH:/path/to/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
```

#### 2. Android Studio (Última versión estable)

- **Descargar**: https://developer.android.com/studio
- **Configurar**: Android SDK, Android SDK Command-line Tools
- **SDK mínimo**: API 21 (Android 5.0)
- **SDK objetivo**: API 34 (Android 14)

#### 3. VS Code con Extensiones

```bash
# Extensiones esenciales
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension ms-vscode.vscode-json
code --install-extension bradlc.vscode-tailwindcss
```
 

### Verificación Completa del Entorno

```bash
# Verificar Flutter y dependencias
flutter doctor -v

# Debe mostrar:
# ✓ Flutter (Channel stable, 3.35.4)
# ✓ Android toolchain - develop for Android devices
# ✓ Chrome - develop for the web
# ✓ Visual Studio - develop for Windows
# ✓ Android Studio (version 2023.x)
# ✓ VS Code (version 1.x)
# ✓ Connected device (1 available)
```

## 🚀 Instalación y Configuración Paso a Paso

### Paso 1: Clonar el Repositorio

```bash
# Clonar el repositorio
git clone https://github.com/dev-deax/finny.git

# Navegar al directorio del proyecto
cd finny
```

### Paso 2: Instalar Dependencias de Flutter

```bash
# Limpiar cache (si es necesario)
flutter clean

# Obtener dependencias
flutter pub get

# Verificar que no hay conflictos
flutter pub deps

# Debe mostrar todas las dependencias sin conflictos
```

### Paso 3: Configuración Específica por Plataforma

#### Android - Configuración Detallada

```bash
# Verificar configuración Android
flutter doctor --android-licenses

# Aceptar todas las licencias (presionar 'y' en cada una)
# Si hay problemas, ejecutar:
# sdkmanager --licenses

# Verificar dispositivos disponibles
flutter devices

# Si no hay dispositivos, crear un emulador:
# 1. Abrir Android Studio
# 2. Tools > AVD Manager
# 3. Create Virtual Device
# 4. Seleccionar Pixel 7 (API 34)
# 5. Descargar sistema Android 14
# 6. Configurar AVD y iniciar
```

**Configuración de Android Studio:**

1. Abrir Android Studio
2. File > Settings > Appearance & Behavior > System Settings > Android SDK
3. SDK Platforms: Marcar Android 14.0 (API 34)
4. SDK Tools: Marcar Android SDK Build-Tools, Android SDK Command-line Tools
5. Apply y OK

#### iOS - Configuración Detallada (Solo macOS)

```bash
# Navegar al directorio iOS
cd ios

# Instalar dependencias de CocoaPods
pod install

# Si hay errores, limpiar y reinstalar:
# pod deintegrate
# pod install

# Volver al directorio raíz
cd ..

# Verificar configuración iOS
flutter doctor --ios
```

**Configuración de Xcode:**

1. Abrir Xcode
2. Preferences > Accounts > Agregar Apple ID
3. Abrir proyecto: `ios/Runner.xcworkspace`
4. Seleccionar equipo de desarrollo
5. Configurar Bundle Identifier único


### Paso 4: Verificación Final

```bash
# Verificar configuración completa
flutter doctor -v

# Verificar dispositivos disponibles
flutter devices

# Debe mostrar al menos:
# - Chrome (web)
# - Windows (desktop)
# - Android (si hay emulador/dispositivo)
# - iOS Simulator (solo en macOS)

# Verificar que el proyecto compila
flutter analyze

# Debe mostrar: "No issues found!"
```

## ▶️ Ejecución de la Aplicación

### Comandos de Desarrollo Detallados

#### Verificar Dispositivos Disponibles

```bash
# Listar todos los dispositivos conectados
flutter devices

# Ejemplo de salida:
# 2 connected devices:
#
# Windows (desktop) • windows • windows-x64 • Microsoft Windows
# Chrome (web)      • chrome  • web-javascript • Google Chrome
# Android (mobile)  • emulator-5554 • android-x64 • Android 14 (API 34)
```

#### Ejecución en Modo Debug (Desarrollo)

```bash
# Ejecutar en el primer dispositivo disponible
flutter run


# Ejecutar con hot reload habilitado (por defecto)
flutter run --hot

# Ejecutar con hot restart automático
flutter run --hot --hot-restart

# Ejecutar con verbose logging
flutter run -v

```

#### Ejecución en Modo Profile (Análisis de Rendimiento)

```bash
# Ejecutar en modo profile
flutter run --profile

# Profile con análisis de memoria
flutter run --profile --trace-startup

# Profile con timeline detallado
flutter run --profile --trace-skia
```

#### Ejecución en Modo Release (Producción)

```bash
# Ejecutar en modo release
flutter run --release

# Release con optimizaciones adicionales
flutter run --release --obfuscate --split-debug-info=debug-info/
```

### Comandos de Utilidad y Debugging

#### Limpieza y Mantenimiento

```bash
# Limpiar proyecto
flutter clean

# Limpiar y reinstalar dependencias
flutter clean && flutter pub get

# Limpiar cache de Flutter
flutter pub cache clean

# Limpiar cache de pub
flutter pub cache repair
```

#### Información del Proyecto

```bash
# Información del proyecto
flutter pub deps

# Información de dependencias
flutter pub deps --style=tree

# Información de configuración
flutter config

# Información de versión
flutter --version
```

## 🏗️ Arquitectura del Proyecto

### Estructura de Carpetas

```
lib/
├── core/                    # Funcionalidades centrales
│   ├── constants/          # Constantes de la aplicación
│   ├── datasources/        # Fuentes de datos
│   ├── extensions/         # Extensiones de Dart/Flutter
│   ├── mixins/            # Mixins reutilizables
│   ├── providers/         # Proveedores globales
│   ├── router/            # Configuración de navegación
│   ├── services/          # Servicios globales
│   ├── theme/             # Temas y estilos
│   ├── utils/             # Utilidades
│   └── widgets/           # Widgets reutilizables
├── features/              # Funcionalidades por módulos
│   ├── courses/           # Módulo de cursos
│   │   ├── domain/        # Entidades y casos de uso
│   │   ├── data/          # Repositorios y datasources
│   │   └── presentation/  # UI y providers
│   └── home/              # Módulo de inicio
└── main.dart              # Punto de entrada
```

### Patrones de Arquitectura

- **Clean Architecture**: Separación clara entre capas (Domain, Data, Presentation)
- **Riverpod**: Gestión de estado reactiva y dependency injection
- **Repository Pattern**: Abstracción de fuentes de datos
- **Provider Pattern**: Inyección de dependencias y gestión de estado

### Decisiones Técnicas

#### 1. Gestión de Estado con Riverpod

- **Razón**: Mayor flexibilidad y mejor testing que Provider
- **Beneficios**: Estado reactivo, dependency injection, mejor rendimiento
- **Implementación**:
  - `StateNotifierProvider` para estado complejo (listas de cursos, filtros)
  - `FutureProvider` para operaciones asíncronas (carga de datos)
  - Providers anidados para dependency injection

#### 2. Navegación con Go Router

- **Razón**: Navegación declarativa y type-safe
- **Beneficios**: Mejor manejo de deep links, navegación anidada
- **Implementación**:
  - Rutas tipadas con constantes (`homeRoute`, `courseDetailRoute`)
  - Error handling centralizado con `errorBuilder`

#### 3. Material Design 3

- **Razón**: Diseño moderno y consistente
- **Beneficios**: Mejor UX, soporte nativo para temas
- **Implementación**:
  - `ColorScheme.fromSeed()` con color primario personalizado
  - Sistema de colores completo para modo claro y oscuro
  - Componentes personalizados siguiendo MD3 guidelines

#### 4. Arquitectura por Features

- **Razón**: Escalabilidad y mantenibilidad
- **Beneficios**: Código organizado, fácil testing, trabajo en equipo
- **Estructura**:
  - Separación clara: `domain/`, `data/`, `presentation/`
  - Providers específicos por feature
  - Repositorios abstractos con implementaciones concretas

#### 5. Sistema de Temas Personalizado

- **Razón**: Consistencia visual y adaptabilidad
- **Beneficios**: Soporte completo para modo claro/oscuro, branding personalizado
- **Implementación**:
  - `ThemeBuilders` para construcción programática de temas
  - Paleta de colores completa con 125+ colores definidos
  - Google Fonts (Inter) para tipografía consistente
  - Componentes temáticos (botones, cards, iconos)

#### 6. Gestión de Conectividad Inteligente

- **Razón**: Mejor UX en condiciones de red variables
- **Beneficios**: Manejo graceful de desconexiones, feedback visual
- **Implementación**:
  - `ConnectivityService` singleton con verificación real de internet
  - `StreamProvider` para estado reactivo de conectividad
  - Widgets adaptativos que cambian según estado de conexión
  - Verificación con `InternetAddress.lookup('google.com')`

#### 7. Sistema de Filtros Avanzado

- **Razón**: Búsqueda eficiente y experiencia de usuario mejorada
- **Beneficios**: Filtrado en tiempo real, persistencia de estado
- **Implementación**:
  - `FilterStateNotifier` con `ToggleMixin` para lógica reutilizable
  - Filtros múltiples: productos, roles, niveles, materias
  - Búsqueda por texto con debouncing
  - Estado persistente durante la sesión

#### 8. Widgets Reutilizables y Extensions

- **Razón**: Consistencia de UI y reducción de código duplicado
- **Beneficios**: Mantenimiento más fácil, diseño consistente
- **Implementación**:
  - `BuildContextExtension` para acceso directo a tema y colores
  - Widgets modulares: `ChipWidget`, `BadgeWidget`, `SectionHeaderWidget`
  - Sistema de placeholders y error states unificado
  - Componentes adaptativos a conectividad

#### 9. Manejo de Estados de Carga

- **Razón**: Feedback visual claro para el usuario
- **Beneficios**: Mejor UX, transparencia en operaciones
- **Implementación**:
  - Estados unificados: `loading`, `data`, `error`
  - Paginación con `hasMore` y `currentPage`
  - Error handling específico por tipo de error
  - Refresh y load more automáticos

#### 10. Sistema de Imágenes con Conectividad

- **Razón**: Manejo robusto de imágenes en red
- **Beneficios**: Fallbacks apropiados, mejor rendimiento
- **Implementación**:
  - `NetworkSvgWithConnectivity` para imágenes SVG
  - Placeholders personalizados durante carga
  - Error widgets específicos para problemas de conectividad
  - Verificación de URL antes de renderizar

#### 11. Patrones de Diseño Implementados

- **Singleton Pattern**: `ConnectivityService` para gestión única de conectividad
- **Repository Pattern**: Abstracción de fuentes de datos con `CourseRepository`
- **State Notifier Pattern**: Gestión de estado complejo con `CourseListNotifier`
- **Mixin Pattern**: `ToggleMixin` para lógica reutilizable de filtros
- **Factory Pattern**: `ThemeBuilders` para construcción de temas
- **Observer Pattern**: Streams para reactividad en conectividad

#### 12. Optimizaciones de Rendimiento

- **Lazy Loading**: Carga de cursos con paginación
- **Debouncing**: Búsqueda con retraso para evitar requests excesivos
- **Caching**: Providers con cache automático de Riverpod
- **Widget Reutilization**: Componentes modulares para evitar rebuilds innecesarios
- **Image Optimization**: Verificación de conectividad antes de cargar imágenes

#### 13. Manejo de Errores Robusto

- **Error Boundaries**: Manejo centralizado de errores en rutas
- **Error Types**: Diferentes tipos de error (conectividad, servidor, datos)
- **User Feedback**: Mensajes de error específicos y accionables
- **Graceful Degradation**: Funcionalidad limitada sin conexión
- **Retry Logic**: Reintentos automáticos en operaciones críticas

#### 14. Análisis de Código y Calidad

- **Very Good Analysis**: Configuración de linting estricto
- **Flutter Lints**: Reglas de calidad de código Flutter
- **Code Coverage**: Análisis de cobertura de tests
- **Performance Monitoring**: Análisis de rendimiento con DevTools
- **Architecture Validation**: Verificación de patrones arquitectónicos

### Métricas del Proyecto

- **Widgets Personalizados**: 15+ componentes reutilizables
- **Providers**: 10+ providers para gestión de estado
- **Pantallas**: 3 pantallas principales (Home, Catálogo, Detalle)
- **Features**: 2 módulos principales (Home, Courses)
- **Dependencias**: 9 dependencias principales + 4 dev dependencies

## 🐛 Depuración y Resolución de Problemas

### Problemas Comunes y Soluciones Detalladas

#### 1. Errores de Dependencias

**Problema**: `flutter pub get` falla o hay conflictos de versiones

```bash
# Solución paso a paso:
# 1. Limpiar completamente
flutter clean
rm -rf .dart_tool/
rm -rf build/

# 2. Limpiar cache de pub
flutter pub cache clean

# 3. Reinstalar dependencias
flutter pub get

# 4. Si persiste, verificar pubspec.yaml
flutter pub deps --style=tree

# 5. Forzar resolución de dependencias
flutter pub upgrade --major-versions
```

**Problema**: Dependencias específicas fallan

```bash
# Para connectivity_plus
flutter pub add connectivity_plus

# Para dio
flutter pub add dio

# Para flutter_riverpod
flutter pub add flutter_riverpod

# Verificar versiones compatibles
flutter pub outdated
```

#### 2. Problemas de Android

**Problema**: `flutter doctor` muestra errores de Android

```bash
# Verificar licencias de Android
flutter doctor --android-licenses

# Aceptar todas las licencias
# Si falla, ejecutar manualmente:
# sdkmanager --licenses

# Verificar configuración de Android Studio
# File > Settings > Appearance & Behavior > System Settings > Android SDK
# Asegurar que estén instalados:
# - Android 14.0 (API 34)
# - Android SDK Build-Tools
# - Android SDK Command-line Tools
# - Android SDK Platform-Tools
```

**Problema**: Emulador no aparece en `flutter devices`

```bash
# Listar AVDs disponibles
avdmanager list avd

# Crear nuevo AVD
avdmanager create avd -n Pixel7 -k "system-images;android-34;google_apis;x86_64"

# Iniciar emulador
emulator -avd Pixel7

# Verificar que aparece
flutter devices
```

**Problema**: Error de compilación Android

```bash
# Limpiar build de Android
cd android
./gradlew clean
cd ..

# Limpiar Flutter
flutter clean

# Reconstruir
flutter build apk --debug
```

#### 3. Problemas de iOS (Solo macOS)

**Problema**: `pod install` falla

```bash
# Limpiar completamente CocoaPods
cd ios
rm -rf Pods/
rm Podfile.lock
pod deintegrate
pod install

# Si persiste, actualizar CocoaPods
sudo gem install cocoapods
pod repo update
pod install
```

**Problema**: Error de signing en Xcode

```bash
# Abrir proyecto en Xcode
open ios/Runner.xcworkspace

# En Xcode:
# 1. Seleccionar Runner en el navegador
# 2. Signing & Capabilities
# 3. Team: Seleccionar tu Apple ID
# 4. Bundle Identifier: Cambiar a algo único (com.tuempresa.finny)
```

**Problema**: Simulador no aparece

```bash
# Listar simuladores disponibles
xcrun simctl list devices

# Iniciar simulador específico
xcrun simctl boot "iPhone 15 Pro"

# Verificar que aparece
flutter devices
```

#### 4. Problemas de Web

**Problema**: `flutter run -d chrome` falla

```bash
# Habilitar soporte web
flutter config --enable-web

# Verificar configuración
flutter doctor --web

# Limpiar y reconstruir
flutter clean
flutter create --platforms web .

# Ejecutar
flutter run -d chrome
```

**Problema**: Errores de CORS o recursos

```bash
# Ejecutar con host específico
flutter run -d chrome --web-hostname 0.0.0.0 --web-port 8080

# Verificar archivos web
ls web/
# Debe contener: index.html, manifest.json, favicon.png
```

#### 5. Problemas de Windows

**Problema**: `flutter doctor --windows` muestra errores

```bash
# Instalar Visual Studio 2022 con:
# - C++ workload
# - Windows 10/11 SDK
# - CMake tools

# Verificar configuración
flutter config --enable-windows-desktop

# Limpiar y reconstruir
flutter clean
flutter create --platforms windows .
```

#### 6. Problemas de macOS

**Problema**: Error de compilación macOS

```bash
# Verificar Xcode
xcode-select --print-path

# Si es necesario, reinstalar command line tools
sudo xcode-select --install

# Habilitar soporte macOS
flutter config --enable-macos-desktop

# Limpiar y reconstruir
flutter clean
flutter create --platforms macos .
```

#### 7. Problemas de Linux

**Problema**: Dependencias faltantes en Linux

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev

# Fedora
sudo dnf install clang cmake ninja-build pkg-config gtk3-devel

# Habilitar soporte Linux
flutter config --enable-linux-desktop

# Limpiar y reconstruir
flutter clean
flutter create --platforms linux .
```

#### 8. Problemas de Rendimiento

**Problema**: App lenta o con lag

```bash
# Ejecutar en modo profile
flutter run --profile

# Analizar con DevTools
flutter run --profile --trace-startup

# Verificar memoria
flutter run --profile --trace-skia

# En DevTools:
# - Timeline: Ver frame drops
# - Memory: Ver uso de memoria
# - Performance: Ver bottlenecks
```

**Problema**: Hot reload no funciona

```bash
# Forzar hot restart
flutter run --hot-restart

# Reiniciar completamente
flutter run --hot

# Verificar que no hay errores de compilación
flutter analyze
```

#### 9. Problemas de Conectividad

**Problema**: App no detecta conexión a internet

```bash
# Verificar permisos en Android
# android/app/src/main/AndroidManifest.xml debe contener:
# <uses-permission android:name="android.permission.INTERNET" />

# Verificar configuración de conectividad
# En el código, verificar que ConnectivityService esté inicializado
```

#### 10. Problemas de Debugging

**Problema**: No se pueden ver logs de debug

```bash
# Ejecutar con verbose logging
flutter run -v

# Ver logs específicos
flutter logs

# En VS Code, usar Debug Console
# O en terminal: flutter run --verbose
```

### Comandos de Diagnóstico Avanzado

#### Análisis Completo del Sistema

```bash
# Información completa del sistema
flutter doctor -v

# Información de dispositivos
flutter devices -v

# Información de configuración
flutter config

# Información de dependencias
flutter pub deps --style=tree

# Análisis de código
flutter analyze --verbose
```

#### Limpieza Completa del Proyecto

```bash
# Script de limpieza completa
#!/bin/bash
echo "Limpiando proyecto Flutter..."

# Limpiar Flutter
flutter clean
rm -rf .dart_tool/
rm -rf build/

# Limpiar Android
cd android
./gradlew clean
cd ..

# Limpiar iOS (solo macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    cd ios
    rm -rf Pods/
    rm Podfile.lock
    pod install
    cd ..
fi

# Limpiar cache
flutter pub cache clean

# Reinstalar dependencias
flutter pub get

echo "Limpieza completada"
```

#### Verificación de Integridad

```bash
# Verificar que todo funciona
flutter analyze
flutter test
flutter build apk --debug
flutter build web --debug

# Si todos pasan, el proyecto está listo
```

### Herramientas de Debugging

#### 1. Flutter Inspector

- Inspeccionar widget tree
- Analizar layout y renderizado
- Debug de performance

#### 2. Dart DevTools

```bash
# Iniciar DevTools
flutter pub global activate devtools
flutter pub global run devtools
```

#### 3. Logs de Debug

```dart
// En el código
debugPrint('Mensaje de debug');
log('Información general');
```

## 📊 Limitaciones Actuales

### Funcionalidades Pendientes

- [ ] Sistema de autenticación de usuarios
- [ ] Sincronización de datos con servidor
- [ ] Notificaciones push
- [ ] Modo offline completo
- [ ] Sistema de calificaciones y reviews

### Limitaciones Técnicas

- **Datos Mock**: Actualmente usa datos simulados(nombre de usuario, progreso en los cursos)
- **Almacenamiento Local**: Solo SharedPreferences
- **Sin Autenticación**: No hay sistema de usuarios

## 🔮 Mejoras Futuras

### Corto Plazo

- [ ] Implementar API dedicada para cursos
- [ ] Sistema de autenticación básico
- [ ] Mejoras en UI/UX
- [ ] Testing automatizado

### Mediano Plazo

- [ ] Sistema de progreso persistente
- [ ] Notificaciones push
- [ ] Analytics y métricas

### Largo Plazo

- [ ] Sistema de pagos
- [ ] Contenido multimedia avanzado
- [ ] IA para recomendaciones

**Desarrollado con ❤️ usando Flutter**
