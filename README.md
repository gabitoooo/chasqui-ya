# Chasqui Ya

Aplicación Flutter desarrollada con arquitectura en capas y gestión de estado con Riverpod.

## Arquitectura

El proyecto sigue una arquitectura en capas.

```
lib/
├── data/           # Capa de Datos
├── aplication/     # Capa de Aplicación (Lógica de Negocio)
└── ui/             # Capa de Presentación (Interfaz de Usuario)
```

### Capa de Datos (`data/`)

Responsable de la comunicación con APIs externas y el manejo de datos.

**Estructura:**
```
data/
├── models/              # Modelos de datos (DTOs)
├── repositories/        # Repositorios para operaciones CRUD
└── http_service.dart    # Servicio HTTP centralizado
```

**Componentes:**

- **Models**: Clases que representan las entidades del sistema
  - Incluyen métodos `fromJson()` y `toJson()` para serialización
  
- **Repositories**: Encapsulan la lógica de acceso a datos
  - Utilizan `HttpService` para realizar peticiones HTTP
  - Manejan la conversión entre JSON y modelos
  
- **HttpService**: Servicio centralizado para peticiones HTTP
  - Configura la URL base desde variables de entorno
  - Métodos: `get()`, `post()`, `put()`, `delete()`
  - Maneja headers y autenticación

### Capa de Aplicación (`aplication/`)

Gestiona el estado de la aplicación usando Riverpod. Organizada por features/módulos.

**Estructura por Feature:**
```
aplication/
└── [feature]/
    ├── [feature]_state.dart      # Definición del estado
    └── [feature]_notifier.dart   # Lógica de negocio y providers
```

### Capa de Presentación (`ui/`)

Contiene los widgets y pantallas de la aplicación. Organizada por features/módulos.

**Estructura por Feature:**
```
ui/
└── [feature]/
    ├── [feature]_index_ui.dart    # Pantalla de listado
    ├── [feature]_form_ui.dart     # Pantalla de formulario
    
```

**Responsabilidades:**
- Consumir providers de Riverpod
- Renderizar la interfaz de usuario
- Manejar interacciones del usuario
- Navegar entre pantallas


## Configuración Inicial

### 1. Variables de Entorno

El proyecto utiliza `flutter_dotenv` para gestionar variables de entorno.

**Crear archivo `.env`:** El archivo .env debe crearse con los paramteros de .env.example 

**IMPORTANTE:** El archivo `.env` contiene configuración sensible y **NO debe** ser versionado en Git.

### Organización por Features

Cada funcionalidad se organiza en su propia carpeta en las tres capas:
- `data/models/`, `data/repositories/`
- `aplication/[feature]/`
- `ui/[feature]/`
