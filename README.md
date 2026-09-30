# Consultas SQL optimizadas

Colección de consultas **SQL orientadas al análisis de datos y apoyo a la toma de decisiones** en un escenario empresarial de comercialización de piezas de vehículos.

El proyecto fue desarrollado como parte de la asignatura **Base de Datos SQL** de la Maestría en Big Data e Inteligencia de Negocios y se centra en transformar información almacenada en una base de datos en consultas útiles para analizar **ventas, rentabilidad, inventario, clientes y demanda**.

> **Nota:** Este repositorio contiene únicamente las **consultas SQL desarrolladas y optimizadas**. El proyecto académico original también incluía el modelo de datos, diccionario de datos, gráficos y reportes.

## 🎯 Objetivo

Desarrollar consultas SQL capaces de extraer y relacionar información de diferentes áreas del negocio para generar datos relevantes para el análisis y la toma de decisiones.

Las consultas utilizan relaciones entre tablas, filtros, agrupaciones y diferentes dimensiones de análisis como **zona geográfica, provincia, región, categoría de artículo, proveedor, año, mes y trimestre**.

## 📊 Consultas incluidas

### 1. Análisis de rentabilidad

Consulta para analizar la rentabilidad según **zona geográfica, tipo de vehículo, importador y trimestre**, relacionando información de artículos y zonas.

### 2. Margen de ganancia y discrepancias

Consulta para comparar **costos, precios de venta, margen bruto y margen porcentual**, permitiendo identificar diferencias entre el costo de los artículos y su precio.

### 3. Stock disponible

Consulta para analizar el **stock disponible y las ventas recientes** según zona y categoría de piezas, facilitando el análisis de disponibilidad de inventario.

### 4. Clientes por provincia

Consulta para analizar el **número de clientes por provincia y trimestre**, segmentando la información por período.

### 5. Ingresos mensuales

Consulta para analizar los **ingresos generados y artículos vendidos** según provincia, categoría y año.

### 6. Tendencia de demanda

Consulta para analizar la **demanda de piezas por temporada y zona**, utilizando métricas como promedio y demanda total.

### 7. Tendencia del margen bruto

Consulta para comparar la evolución del **margen de ganancia bruta** por categoría de piezas y región, incluyendo comparación mensual.

### 8. Índice de devoluciones

Consulta para analizar el **índice de devoluciones** según proveedor, categoría y zona, realizando comparaciones trimestrales mediante una expresión `CTE`.

### 9. Volumen de ventas

Consulta para analizar la distribución del **volumen de ventas de piezas** por tipo de producto y región geográfica durante un período trimestral.

### 10. Análisis de demanda y necesidades

Consulta que relaciona **demanda promedio, proyección trimestral, stock actual y recomendación**, permitiendo analizar las necesidades de inventario por zona, fabricante y marca.

Estas líneas de análisis corresponden a los diez reportes definidos en el proyecto académico.

## 🛠️ Tecnologías

* **SQL**
* SQL Server
* Consultas `SELECT`
* `JOIN`
* `INNER JOIN`
* `WHERE`
* `GROUP BY`
* `CASE`
* `IN`
* CTE (`WITH`)
* Funciones de agregación
* Filtros temporales
* Consultas multidimensionales

## 🔎 Principales habilidades demostradas

* Análisis de datos mediante SQL
* Integración de información de múltiples tablas
* Uso de relaciones entre tablas mediante `JOIN`
* Agregación y segmentación de datos
* Análisis temporal por año, mes y trimestre
* Análisis de ventas e ingresos
* Análisis de rentabilidad y márgenes
* Análisis de inventario y demanda
* Análisis de devoluciones
* Preparación de información para reportería y Business Intelligence

## 🗂️ Contexto de los datos

El modelo utilizado en el proyecto contempla información relacionada con diferentes procesos empresariales, incluyendo **logística y transporte, importación, investigación de mercado, ventas, compras y gestión financiera**. Entre las entidades utilizadas en las consultas se encuentran artículos, grupos de artículos, zonas, provincias, regiones, ventas, compras y proveedores.

Las consultas trabajan principalmente sobre una **base de datos resumen**, relacionando tablas de información analítica con tablas de referencia para obtener descripciones y dimensiones de negocio.

## 💼 Aplicación al análisis de datos

Este proyecto representa una aplicación práctica de SQL para convertir datos empresariales en información que puede utilizarse en procesos de:

* Business Intelligence
* Análisis de ventas
* Análisis de rentabilidad
* Gestión de inventarios
* Análisis de clientes
* Análisis de demanda
* Generación de reportes

El proyecto académico plantea, por ejemplo, utilizar el análisis de inventario y demanda para apoyar la planificación de existencias y las necesidades de abastecimiento.

## 📌 Nota sobre el proyecto

Las consultas fueron desarrolladas como parte de un proyecto académico de **Base de Datos SQL**. El repositorio presenta específicamente la parte de **consultas SQL**, mientras que otros componentes del trabajo original —como el diccionario de datos, modelo de tablas y visualizaciones— no forman parte de este repositorio.

## 👩‍💻 Autora

**Patzi Estíbaliz Pérez Moquete**

Ingeniera en Sistemas | Magíster en Big Data e Inteligencia de Negocios

**Áreas de interés:**

* Análisis de Datos
* Business Intelligence
* SQL
* Power BI
* Big Data
* Inteligencia Artificial
