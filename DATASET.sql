CREATE DATABASE BDifd;
CREATE EXTENSION IF NOT EXISTS pgcrypto;


CREATE TABLE IF NOT EXISTS Usuarios (
    Region TEXT PRIMARY KEY,
    Gerente TEXT NOT NULL
);
CREATE TABLE Ordenes (
    ID_de_fila SERIAL PRIMARY KEY,  
    Prioridad_de_pedido TEXT NOT NULL,  
    Descuento DECIMAL(5, 2) NOT NULL,  
    Precio_unitario DECIMAL(10, 2) NOT NULL,  
    Costo_de_envio DECIMAL(10, 2) NOT NULL, 
    ID_de_cliente INT NOT NULL, 
    Nombre_del_cliente TEXT NOT NULL, 
    Modo_de_envio TEXT NOT NULL, 
    Segmento_de_clientes TEXT NOT NULL,  
    Categoria_de_producto TEXT NOT NULL,  
    Subcategoria_de_producto TEXT NOT NULL, 
    Contenedor_de_producto TEXT,  
    Nombre_del_producto TEXT NOT NULL,  
    Margen_base_del_producto DECIMAL(10, 2),  
    Pais TEXT,  
    Region TEXT REFERENCES Usuarios(Region),  
    Estado_o_Provincia TEXT NOT NULL,  
    Ciudad TEXT NOT NULL,  
    Codigo_Postal INT NOT NULL,  
    Fecha_del_pedido DATE NOT NULL,  
    Fecha_de_envio DATE NOT NULL, 
    Ganancia DECIMAL(10, 4) NOT NULL,  
    Cantidad_pedida_nueva INT NOT NULL,  
    Ventas DECIMAL(10, 2) NOT NULL,  
    ID_de_pedido INT NOT NULL,  
    CONSTRAINT pedido_fila_unica UNIQUE (ID_de_pedido, ID_de_fila)  
);
CREATE TABLE Dev (
    ID_de_pedido INT NOT NULL,  
    ID_de_fila INT NOT NULL,    
    Estado TEXT NOT NULL,  
    CONSTRAINT fk_pedido_fila FOREIGN KEY (ID_de_pedido, ID_de_fila) 
        REFERENCES Ordenes(ID_de_pedido, ID_de_fila) 
);
CREATE TABLE IF NOT EXISTS Log_Ordenes (
    ID_de_log SERIAL PRIMARY KEY,
    ID_de_pedido INT NOT NULL,
    Fecha_de_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Detalle TEXT NOT NULL
);
SELECT * FROM usuarios;
SELECT * FROM Log_Ordenes;


SELECT * FROM Ordenes WHERE ID_de_pedido = 101 AND ID_de_fila = 6;
