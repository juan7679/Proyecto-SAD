# Proyecto - Base de Datos para Camiseta Térmica Inteligente

## Introducción
Este proyecto consiste en el diseño e implementación de una base de datos relacional para gestionar la información asociada a un sistema de camisetas térmicas inteligentes. La base de datos incluye tablas relacionadas para usuarios, camisetas, historial de temperatura, alertas y configuración personalizada, con datos de prueba para su uso.

## Requisitos Previos

**Software**:
- MySQL Server instalado en el equipo.
- MySQL Workbench u otra herramienta para gestionar bases de datos.

**Archivos necesarios**:
- `base_datos.sql`: Archivo SQL con la estructura y datos del proyecto.

## Instrucciones para Importar y Ejecutar el Código

### 1. **Importar el Script SQL**

1. Abre MySQL Workbench y conéctate a tu servidor MySQL.
2. Crea una nueva base de datos:

    ```sql
    CREATE DATABASE CamisetaTermicaInteligente;
    USE CamisetaTermicaInteligente;
    ```

3. Importa el archivo `camisetaTermica.sql` y ejecuta el script.

### 2. **Verificar las Tablas y Datos**

- Mostrar todas las tablas:

    ```sql
    SHOW TABLES;
    ```

- Verificar los datos en la tabla `Usuarios`:

    ```sql
    SELECT * FROM Usuarios;
    ```

### 3. **Realizar Consultas de Prueba**

- Consultar camisetas activas por usuario:

    ```sql
    SELECT Usuarios.Nombre, Camisetas.ID_Camiseta, Camisetas.Modelo
    FROM Camisetas
    JOIN Usuarios ON Camisetas.ID_Usuario = Usuarios.ID_Usuario
    WHERE Camisetas.Estado = 'Activa';
    ```

- Obtener alertas sin resolver:

    ```sql
    SELECT * FROM Alertas WHERE Estado_Alerta = 'No Resuelta';
    ```

## Estructura de la Base de Datos

- **Usuarios**: Información básica sobre los usuarios.
- **Camisetas**: Datos de las camisetas asignadas a cada usuario.
- **Historial_Temperatura**: Registros de temperaturas y ajustes realizados.
- **Alertas**: Notificaciones generadas por la camiseta.
- **Configuracion_Usuario**: Configuraciones personalizadas de umbrales térmicos.

## Autor

Juan Carlos Zuñiga Alfaro
