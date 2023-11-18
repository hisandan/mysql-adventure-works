
-- Crear Tablas de la Data Warehouse
source scripts/0_datawh.sql;

-- Cargar Datos Dimensiones
source scripts/dimensiones/DIM_Entrega.sql;
source scripts/dimensiones/DIM_Producto.sql;
source scripts/dimensiones/DIM_Tienda.sql;
source scripts/dimensiones/DIM_Vendedor.sql;
source scripts/dimensiones/DIM_Cliente.sql;
-- Fechas 
source scripts/dimensiones/DIM_Fecha_OrderDate.sql;
source scripts/dimensiones/DIM_Fecha_OrderDueDate.sql;
source scripts/dimensiones/DIM_Fecha_OrderShipDate.sql;
source scripts/dimensiones/DIM_Fecha_Review.sql;


-- Cargar Datos Hechos
source scripts/hechos/FACT_VentasTotales.sql;
source scripts/hechos/FACT_NuevoDomicilio.sql;
source scripts/hechos/FACT_NuevaReview.sql;


-- Realizar Consultas
source scripts/consultas.sql;
