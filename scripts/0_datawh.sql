use adw;

DROP TABLE IF EXISTS FACT_VentasTotales;
DROP TABLE IF EXISTS FACT_NuevoDomicilio;
DROP TABLE IF EXISTS FACT_NuevaReview;
DROP TABLE IF EXISTS FACT_Fabricacion;
DROP TABLE IF EXISTS FACT_NuevaOferta;
DROP TABLE IF EXISTS DIM_Producto;
DROP TABLE IF EXISTS DIM_Tienda;
DROP TABLE IF EXISTS DIM_Cliente;
DROP TABLE IF EXISTS DIM_Fecha;
DROP TABLE IF EXISTS DIM_Vendedor;
DROP TABLE IF EXISTS DIM_Pago;
DROP TABLE IF EXISTS DIM_Entrega;
DROP TABLE IF EXISTS DIM_ShipDate;
DROP TABLE IF EXISTS DIM_DueDate;
DROP TABLE IF EXISTS DIM_OrderDate;
DROP TABLE IF EXISTS DIM_Fabricacion;
DROP TABLE IF EXISTS DIM_LugarDeFabricacion;
DROP TABLE IF EXISTS DIM_Fabricador;
DROP TABLE IF EXISTS DIM_Sell_Start_Date;
DROP TABLE IF EXISTS DIM_Sell_End_Date;
DROP TABLE IF EXISTS DIM_Oferta;
DROP TABLE IF EXISTS DIM_Fecha_inicio;
DROP TABLE IF EXISTS DIM_Fecha_fin;



-- DIMENSIONES: ---------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------



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
  Demografia VARCHAR(255),
  Cultura VARCHAR(45),
  Sexo CHAR(1),
  Edad INT,
  Cod_Postal VARCHAR(10),
  Nombre VARCHAR(255) NOT NULL,
  PRIMARY KEY (cliente_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS DIM_Fecha (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Vendedor (
  Vendedor_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Vendedor_id VARCHAR(45) NOT NULL,
  Tipo VARCHAR(45),
  Antiguedad INT,
  Estado_Marital VARCHAR(45),
  Salario DECIMAL(10, 2),
  Titulo VARCHAR(255),
  PRIMARY KEY (Vendedor_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS DIM_Pago (
  Pago_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Pago_id VARCHAR(45) NOT NULL,
  Tipo_de_Pago VARCHAR(45),
  Fee_pago DECIMAL(10, 2),
  PRIMARY KEY (Pago_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Entrega (
  entrega_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  entrega_id VARCHAR(45) NOT NULL,
  Metodo_de_entrega VARCHAR(45),
  Zip_code VARCHAR(10),
  PRIMARY KEY (entrega_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_ShipDate (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS DIM_DueDate (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_OrderDate (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Fabricacion (
  Fabricacion_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fabricacion_id VARCHAR(45) NOT NULL,
  Lugar_de_Fabricacion VARCHAR(45),
  Fabricador VARCHAR(45),
  PRIMARY KEY (Fabricacion_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_LugarDeFabricacion (
  lugarDeFabricacion_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  lugarDeFabricacion_id VARCHAR(45) NOT NULL,
  Cod_postal VARCHAR(10),
  Ciudad VARCHAR(45),
  Estado VARCHAR(45),
  Pais VARCHAR(45),
  Nombre VARCHAR(255),
  PRIMARY KEY (lugarDeFabricacion_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Fabricador (
  Fabricador_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fabricador_id VARCHAR(45) NOT NULL,
  Lugar_de_Fabricacion VARCHAR(45),
  Fabricador VARCHAR(45),
  PRIMARY KEY (Fabricador_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS DIM_Sell_Start_Date (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS DIM_Sell_End_Date (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS DIM_Oferta (
  oferta_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  oferta_id VARCHAR(45) NOT NULL,
  Tipo VARCHAR(45),
  Categoria VARCHAR(45),
  PRIMARY KEY (oferta_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS DIM_Fecha_inicio (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS DIM_Fecha_fin (
  Fecha_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  Cat_Momento_dia VARCHAR(45),
  Temporada VARCHAR(45),
  Dia INT,
  Mes INT,
  Anio INT,
  PRIMARY KEY (Fecha_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- HECHOS: ---------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
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
        REFERENCES DIM_Fecha(Fecha_key)
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
    CONSTRAINT fk_pago
        FOREIGN KEY (Pago_Key)
        REFERENCES DIM_Pago(Pago_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
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
    INDEX fk_film_idx (Producto_Key ASC) VISIBLE,
    INDEX fk_date_idx (Fecha_Key ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FACT_NuevoDomicilio (
    Domicilio_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Domicilio_id VARCHAR(45) NOT NULL,
    Ship_rate DECIMAL(10, 2),
    Ship_base DECIMAL(10, 2),
    Costo_orden DECIMAL(10, 2),
    Costo_envio DECIMAL(10, 2),
    Tiempo_entrega VARCHAR(45),
    Tamano VARCHAR(45),
    Peso DECIMAL(10, 2),
    ShipDate_Key INT UNSIGNED,
    DueDate_Key INT UNSIGNED,
    OrderDate_Key INT UNSIGNED,
    Entrega_Key INT UNSIGNED,
    Pago_Key INT UNSIGNED,
    Fabricacion_Key INT UNSIGNED,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Domicilio_key),
    CONSTRAINT fk_shipdate
        FOREIGN KEY (ShipDate_Key)
        REFERENCES DIM_ShipDate(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_duedate
        FOREIGN KEY (DueDate_Key)
        REFERENCES DIM_DueDate(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_orderdate
        FOREIGN KEY (OrderDate_Key)
        REFERENCES DIM_OrderDate(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_entrega_dom
        FOREIGN KEY (Entrega_Key)
        REFERENCES DIM_Entrega(Entrega_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_pago_dom
        FOREIGN KEY (Pago_Key)
        REFERENCES DIM_Pago(Pago_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_fabricacion_dom
        FOREIGN KEY (Fabricacion_Key)
        REFERENCES DIM_Fabricacion(Fabricacion_key)
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
    Fecha_Key INT UNSIGNED,
    Vendedor_Key INT UNSIGNED,
    Tienda_Key INT UNSIGNED,
    Cliente_Key INT UNSIGNED,
    Pago_Key INT UNSIGNED,
    Fabricacion_Key INT UNSIGNED,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Review_key),
    CONSTRAINT fk_fecha_review
        FOREIGN KEY (Fecha_Key)
        REFERENCES DIM_Fecha(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_vendedor_review
        FOREIGN KEY (Vendedor_Key)
        REFERENCES DIM_Vendedor(Vendedor_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_tienda_review
        FOREIGN KEY (Tienda_Key)
        REFERENCES DIM_Tienda(Tienda_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_cliente_review
        FOREIGN KEY (Cliente_Key)
        REFERENCES DIM_Cliente(Cliente_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_pago_review
        FOREIGN KEY (Pago_Key)
        REFERENCES DIM_Pago(Pago_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_fabricacion_review
        FOREIGN KEY (Fabricacion_Key)
        REFERENCES DIM_Fabricacion(Fabricacion_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_producto_review
        FOREIGN KEY (Producto_Key)
        REFERENCES DIM_Producto(Producto_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    INDEX fk_customer_idx (Cliente_Key ASC) VISIBLE,
    INDEX fk_stafk_idx (Vendedor_Key ASC) VISIBLE,
    INDEX fk_store_idx (Tienda_Key ASC) VISIBLE,
    INDEX fk_film_idx (Producto_Key ASC) VISIBLE,
    INDEX fk_date_idx (Fecha_Key ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FACT_Fabricacion (
    Fabricacion_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Fabricacion_id VARCHAR(45) NOT NULL,
    Cantidad INT,
    Costo_Fabricacion DECIMAL(10, 2),
    Dias_de_Manufactura INT,
    Safety_Stock_Level INT,
    LugarDeFabricacion_Key INT UNSIGNED,
    Fabricador_Key INT UNSIGNED,
    Sell_start_date_key INT UNSIGNED,
    Sell_end_date_key INT UNSIGNED,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Fabricacion_key),
    CONSTRAINT fk_lugar_fabricacion
        FOREIGN KEY (LugarDeFabricacion_Key)
        REFERENCES DIM_LugarDeFabricacion(lugarDeFabricacion_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_fabricador
        FOREIGN KEY (Fabricador_Key)
        REFERENCES DIM_Fabricador(Fabricador_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_sell_start_date
        FOREIGN KEY (Sell_start_date_key)
        REFERENCES DIM_Fecha(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_sell_end_date
        FOREIGN KEY (Sell_end_date_key)
        REFERENCES DIM_Fecha(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_producto_fabricacion
        FOREIGN KEY (Producto_Key)
        REFERENCES DIM_Producto(Producto_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    INDEX fk_customer_idx (Producto_Key ASC) VISIBLE,
    INDEX fk_stafk_idx (Fabricador_Key ASC) VISIBLE,
    INDEX fk_store_idx (LugarDeFabricacion_Key ASC) VISIBLE,
    INDEX fk_film_idx (Sell_start_date_key ASC) VISIBLE,
    INDEX fk_date_idx (Sell_end_date_key ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FACT_NuevaOferta (
    Nueva_oferta_key INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nueva_oferta_id VARCHAR(45) NOT NULL,
    Descuento DECIMAL(10, 2),
    min_qty INT,
    max_qty INT,
    Fecha_inicio_Key INT UNSIGNED,
    Fecha_fin_Key INT UNSIGNED,
    Oferta_Key INT UNSIGNED,
    Producto_Key INT UNSIGNED,
    PRIMARY KEY (Nueva_oferta_key),
    CONSTRAINT fk_fecha_inicio
        FOREIGN KEY (Fecha_inicio_Key)
        REFERENCES DIM_Fecha(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_fecha_fin
        FOREIGN KEY (Fecha_fin_Key)
        REFERENCES DIM_Fecha(Fecha_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_oferta
        FOREIGN KEY (Oferta_Key)
        REFERENCES DIM_Oferta(oferta_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT fk_producto_oferta
        FOREIGN KEY (Producto_Key)
        REFERENCES DIM_Producto(Producto_key)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    INDEX fk_customer_idx (Fecha_inicio_Key ASC) VISIBLE,
    INDEX fk_stafk_idx (Fecha_fin_Key ASC) VISIBLE,
    INDEX fk_store_idx (Oferta_Key ASC) VISIBLE,
    INDEX fk_film_idx (Producto_Key ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
