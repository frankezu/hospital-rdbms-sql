# Sistema de Gestión Hospitalaria Integral
**Diseño Relacional, Auditoría de Datos y Prototipo de Dashboard Clínico**

![MySQL](https://img.shields.io/badge/MySQL-8.4-blue?style=flat-square&logo=mysql)
![HTML5](https://img.shields.io/badge/HTML5-Prototyping-orange?style=flat-square&logo=html5)
![CSS3](https://img.shields.io/badge/CSS3-Styling-blue?style=flat-square&logo=css3)
![Cloud](https://img.shields.io/badge/Cloud-Aiven-purple?style=flat-square)

🔗 **[Ver Prototipo del Dashboard en Vivo](https://frankezu.github.io/hospital-rdbms-sql/)**

## Descripción del Proyecto
Este proyecto es un sistema inteligente de gestión clínica orientado a optimizar entornos hospitalarios de alta presión. Su núcleo es una base de datos relacional altamente normalizada que garantiza la consistencia transaccional en la asignación de turnos médicos, el control de inventario y la trazabilidad de insumos críticos.

### Características Principales
- **Arquitectura y Normalización:** Diseño relacional y normalización hasta tercera forma normal con lógica de trazabilidad integrada para garantizar la integridad absoluta de los registros.
- **Consultas y Análisis SQL:** Implementación de consultas avanzadas en SQL para el cruce y análisis de múltiples tablas, auditoría interna y generación de reportes de gestión.
- **Interfaz de Monitoreo:** Prototipo de dashboard web visual para el monitoreo de indicadores clave y la automatización de alertas operativas críticas.
- **Despliegue Cloud Seguro:** Implementación en Aiven Cloud con cifrado SSL estricto.

---

## Arquitectura de Datos

El diseño lógico y físico fue documentado minuciosamente para garantizar escalabilidad:

- **Modelo Entidad-Relación (MER):** [Ver Diagrama](docs/MER.png)
- **Modelo Relacional (MR):** [Ver Diagrama](docs/MR.png)
- 📊 **[Presentación Técnica Interactiva (Canva)](https://canva.link/da6jlq3nwk3cmo5)** | 📄 *[Descargar PDF](docs/Presentacion_proyecto.pdf)*

---

## Infraestructura y Despliegue

El sistema opera en un entorno de nube real con las siguientes especificaciones:

- **Motor de Base de Datos:** MySQL 8.4.8
- **Proveedor Cloud:** Aiven Cloud (Instancia gestionada)
- **Seguridad de Red:** Conexión cifrada mediante SSL obligatorio (`SSL Mode: REQUIRED`)
- **Estrategia de Persistencia:** Aislamiento de entornos mediante esquemas relacionales indexados.

> 💡 *Nota: Para la revisión local de la estructura y los datos de prueba, ejecute en orden secuencial los scripts alojados en la carpeta `/sql` (`ddl.sql`, `dml_data.sql` y `dml_query.sql`).*

---

## 📂 Estructura del Repositorio

```text
├── sql/
│   ├── ddl.sql           # Definición de estructuras y tablas (DDL)
│   ├── dml_data.sql      # Poblado de entidades y maestros (DML)
│   └── dml_query.sql     # Consultas avanzadas y lógica de negocio
├── docs/
│   ├── MER.png           # Diagrama Entidad-Relación
│   ├── MR.png            # Diagrama Relacional
│   └── Presentacion_proyecto.pdf
├── index.html            # Prototipo visual del dashboard web
├── style.css             # Estilos de la interfaz web
├── logo.png              # Logo institucional del dashboard
└── README.md
```

---

## Contexto Académico y Autores
Este proyecto fue desarrollado como demostración técnica para la asignatura **Bases de Datos (ICI3240)** en la **Pontificia Universidad Católica de Valparaíso (PUCV)**.

**Equipo de Desarrollo:**
- Franco Bernal
- Ariel Leiva
- Hugo Palomino
- Felipe Romero