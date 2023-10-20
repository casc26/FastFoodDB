--Crea una nueva base de datos
CREATE DATABASE Restaurante;

--Usa la base de datos creada como "Restaurante"
USE Restaurante;

--Crea la tabla tipo, la cual clasificara los productos en categorías
CREATE TABLE Tipo (
    TipoID char(5) not null,
    NombreTipo VARCHAR(50) not null,
	constraint pk_tipo primary key(TipoID)
)

--Inserta 3 tipos, Comida, Extras y Bebidas
INSERT INTO Tipo 
VALUES
('T0001','Comida'),('T0002','Extras'),('T0003','Bebidas')

--Selecciona todos los datos de la tabla Tipo y los muestra
SELECT*FROM Tipo

--Crea la tabla Producto, la cual almacenará los diversos platos que tiene el restaurante.
CREATE TABLE Producto 
(
    ProductoID CHAR(4) not null,
    NombreProducto VARCHAR(50),
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2),
    TipoID char(5) not null,
	CONSTRAINT pk_Producto PRIMARY KEY (ProductoID),
    CONSTRAINT fk_tipo FOREIGN KEY (TipoID) REFERENCES Tipo(TipoID)
)

--Inserta Productos a diferentes categorías
INSERT INTO Producto (ProductoID, NombreProducto, Descripcion, Precio, TipoID)
VALUES('P001', 'Pizza Americana Familiar', 'Pepperonni, Pimientos, Aceituna', 23.50, 'T0001'),
      ('P002', 'Alitas BBQ', 'Alas de pollo en salsa BBQ', 20.50, 'T0002'),
      ('P003', 'Limonada Frozen', 'Bebida de Limon helada', 10.00, 'T0003')

--Selecciona todos los datos de la tabla Producto y los muestra
SELECT*FROM Producto

-- Crea la tabla Cliente para almacenar información sobre los clientes
CREATE TABLE Cliente 
(
    ClienteID CHAR(4)NOT NULL,
    Nombre VARCHAR(50)NOT NULL,
    Apellido VARCHAR(50)NOT NULL,
    Direccion VARCHAR(255)NOT NULL,
    Telefono VARCHAR(9) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY(ClienteID)
);

-- Inserta clientes
INSERT INTO Cliente (ClienteID, Nombre, Apellido, Direccion, Telefono)
VALUES 
('C001', 'Juan', 'Perez', 'Arequipa', '987654321'),
('C002', 'Pepito', 'Quispe', 'Lima', '933447787')

--Selecciona todos los datos de la tabla Cliente y los muestra
SELECT*FROM Cliente

-- Crea la tabla Empleado para almacenar información sobre los empleados
CREATE TABLE Empleado 
(
    EmpleadoID char(4)NOT NULL,
    Nombre VARCHAR(50)NOT NULL,
    Apellido VARCHAR(50)NOT NULL,
    Puesto VARCHAR(50)NOT NULL,
    Salario DECIMAL(10, 2)NOT NULL,
	CONSTRAINT pk_empleado PRIMARY KEY(EmpleadoID) 
);

-- Añade empleados
INSERT INTO Empleado(EmpleadoID, Nombre, Apellido, Puesto, Salario)
VALUES('E081', 'Juan', 'Apaza', 'Camarero', 1500),
      ('E010', 'Felipe', 'Nuñez', 'Camarero', 1500),
      ('E130', 'Alexis', 'Colque', 'Chef', 2500),
      ('E150', 'Alberto', 'Apaza', 'Cocinero', 2000),
      ('E261', 'Diego', 'Rosas', 'Ayudante', 1800),
      ('E260', 'Carlos', 'Soriano', 'Gerente', 3500)

--Selecciona todos los datos de la Empleado y los muestra
SELECT*FROM Empleado

--Crea la tabla Pedido para agregar los datos para un posible comprobante
CREATE TABLE Pedido (
    PedidoID char(5)NOT NULL,
    ClienteID CHAR(4)NOT NULL,
    EmpleadoID char(4)NOT NULL,
    FechaPedido DATETIME NOT NULL,
	--DATA FECHA
	--DATATIME FECHA + HORA
	CONSTRAINT pk_pedido PRIMARY KEY(PedidoID), 
    CONSTRAINT fk_cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    CONSTRAINT fk_empleado FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID)
);

--Añade a la tabla Pedido, la columna Total
ALTER TABLE Pedido
ADD Total DECIMAL(6,2) NOT NULL
	

SELECT*FROM Pedido
SELECT*FROM Empleado
SELECT*FROM Cliente
	
-- Insertar un pedido
INSERT INTO Pedido (PedidoID, ClienteID, EmpleadoID, FechaPedido, Total)
VALUES ('00001', 'C001', 'E010', '08/16/2023 12:00', 20.50);

--Crea la tabla DetallePedido donde se almacenarán el Producto a consumir, la cantidad y el subtotal
CREATE TABLE DetallePedido (
    DetalleID char(4)NOT NULL,
    PedidoID char(5)NOT NULL,
    ProductoID CHAR(4) NOT NULL,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(10, 2)NOT NULL,
	CONSTRAINT pk_detallepedido PRIMARY KEY (DetalleID),
    CONSTRAINT fk_pedido  FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    CONSTRAINT fk_producto FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Inserta un detalle de pedido
INSERT INTO DetallePedido (DetalleID, PedidoID, ProductoID, Cantidad, Subtotal)
VALUES ('D001','00001','P001', 2, 20.50);

--Selecciona todos los datos de DetallePedido y los muestra
SELECT*FROM DetallePedido

--Modifica el Subtotal en la tabla DetallePedido, remplazando todos los valores que tenga '20.50' como precio
UPDATE DetallePedido
SET Subtotal = 41.00
WHERE Subtotal = 20.50
