CREATE DATABASE IF NOT EXISTS adw_dwh;


use adw_dwh;

DROP TABLE IF EXISTS FACT_VentasTotales;
DROP TABLE IF EXISTS FACT_NuevoDomicilio;
DROP TABLE IF EXISTS FACT_NuevaReview;
DROP TABLE IF EXISTS FACT_Fabricacion;
DROP TABLE IF EXISTS FACT_NuevaOferta;
DROP TABLE IF EXISTS DIM_Producto;
DROP TABLE IF EXISTS DIM_Tienda;
DROP TABLE IF EXISTS DIM_Cliente;
DROP TABLE IF EXISTS DIM_Vendedor;
DROP TABLE IF EXISTS DIM_Entrega;




-- DIMENSIONES: ---------------------------------------------


CREATE TABLE IF NOT EXISTS DIM_Producto (
  producto_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  producto_id VARCHAR(45) NOT NULL,
  Subcategoria VARCHAR(45),
  Categoria VARCHAR(45),
  Nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (producto_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Tienda (
  Tienda_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Tienda_id VARCHAR(45) NOT NULL,
  Cod_postal VARCHAR(10),
  Ciudad VARCHAR(45),
  Estado VARCHAR(45),
  Pais VARCHAR(45),
  Nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (Tienda_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Cliente (
  cliente_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cliente_id VARCHAR(45) NOT NULL,
  Demografia text,
  Suffix VARCHAR(255),
  Title VARCHAR(255),
  PersonType CHAR(255),
  PRIMARY KEY (cliente_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Vendedor (
  Vendedor_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Vendedor_id VARCHAR(45) NOT NULL,
  -- Tipo VARCHAR(45),
  Antiguedad INT,
  Estado_Marital VARCHAR(45),
  Salario DECIMAL(10, 2),
  Titulo VARCHAR(255),
  PRIMARY KEY (Vendedor_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS DIM_Entrega (
  entrega_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  entrega_id VARCHAR(45) NOT NULL,
  Metodo_de_entrega VARCHAR(45),
  Zip_code VARCHAR(10),
  PRIMARY KEY (entrega_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS adw_dwh.DIM_Fecha_Venta (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
 )ENGINE=InnoDB DEFAULT CHARSET=utf8;





-- HECHOS: ---------------------------------------------

CREATE TABLE IF NOT EXISTS FACT_VentasTotales (
    Venta_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Venta_id VARCHAR(45) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL,
    Descuento DECIMAL(10, 2) NOT NULL,
    Profit DECIMAL(10, 2) NOT NULL,
    Fecha_Key INT UNSIGNED,
    Vendedor_Key INT UNSIGNED,
    Tienda_Key INT UNSIGNED,
    Cliente_Key INT UNSIGNED,
    Pago_Key INT UNSIGNED,
    Entrega_Key INT UNSIGNED,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Venta_key),
    CONSTRAINT fk_fecha
        FOREIGN KEY (Fecha_Key)
        REFERENCES DIM_Fecha_Venta(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_vendedor
        FOREIGN KEY (Vendedor_Key)
        REFERENCES DIM_Vendedor(Vendedor_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_tienda
        FOREIGN KEY (Tienda_Key)
        REFERENCES DIM_Tienda(Tienda_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_cliente
        FOREIGN KEY (Cliente_Key)
        REFERENCES DIM_Cliente(Cliente_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    -- CONSTRAINT fk_pago
    --     FOREIGN KEY (Pago_Key)
    --     REFERENCES DIM_Pago(Pago_key)
    --     ON DELETE CASCADE
    --     ON UPDATE NO ACTION,
    CONSTRAINT fk_entrega
        FOREIGN KEY (Entrega_Key)
        REFERENCES DIM_Entrega(Entrega_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_producto
        FOREIGN KEY (Producto_Key)
        REFERENCES DIM_Producto(Producto_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    INDEX fk_customer_idx (Cliente_Key ASC) VISIBLE,
    INDEX fk_stafk_idx (Vendedor_Key ASC) VISIBLE,
    INDEX fk_store_idx (Tienda_Key ASC) VISIBLE,
    -- INDEX fk_date_idx (Fecha_Key ASC) VISIBLE,
    INDEX fk_film_idx (Producto_Key ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS FACT_NuevoDomicilio (
    Domicilio_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Domicilio_id VARCHAR(45) NOT NULL,
    Ship_rate DECIMAL(10, 2),
    Ship_base DECIMAL(10, 2),
    Costo_orden DECIMAL(10, 2),
    Costo_envio DECIMAL(10, 2),
    -- Tiempo_entrega VARCHAR(45),
    Tamano VARCHAR(45),
    Peso DECIMAL(10, 2),
    Entrega_Key INT UNSIGNED,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Domicilio_key),

    CONSTRAINT fk_entrega_dom
        FOREIGN KEY (Entrega_Key)
        REFERENCES DIM_Entrega(Entrega_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,

    CONSTRAINT fk_producto_dom
        FOREIGN KEY (Producto_Key)
        REFERENCES DIM_Producto(Producto_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FACT_NuevaReview (
    Review_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Rewiev_id VARCHAR(45) NOT NULL,
    Estrellas INT,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Review_key),
    CONSTRAINT fk_producto_review
        FOREIGN KEY (Producto_Key)
        REFERENCES DIM_Producto(Producto_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    INDEX fk_film_idx (Producto_Key ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
