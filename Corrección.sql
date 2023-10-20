CREATE DATABASE Restaurante;

USE Restaurante;


CREATE TABLE Tipo (
    TipoID char(5) not null,
    NombreTipo VARCHAR(50) not null,
	constraint pk_tipo primary key(TipoID)
)
INSERT INTO Tipo 
VALUES
('T0001','Comida'),('T0002','Extras'),('T0003','Bebidas')
Select*from Tipo


CREATE TABLE Producto 
(
    ProductoID CHAR(4) not null,
    NombreProducto VARCHAR(50),
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2),
    TipoID char(5) not null,
	constraint pk_Producto primary key(ProductoID),
    constraint fk_tipo FOREIGN KEY (TipoID) REFERENCES Tipo(TipoID)
)

INSERT INTO Producto (ProductoID, NombreProducto, Descripcion, Precio, TipoID)
VALUES('P001', 'Pizza Americana Familiar', 'Pepperonni, Pimientos, Aceituna', 23.50, 'T0001'),
      ('P002', 'Alitas BBQ', 'Alas de pollo en salsa BBQ', 20.50, 'T0002'),
      ('P003', 'Limonada Frozen', 'Bebida de Limon helada', 10.00, 'T0003')
select*from Producto

-- Crear la tabla Cliente para almacenar información sobre los clientes
CREATE TABLE Cliente 
(
    ClienteID CHAR(4)NOT NULL,
    Nombre VARCHAR(50)not null,
    Apellido VARCHAR(50)not null,
    Direccion VARCHAR(255)not null,
    Telefono VARCHAR(15) not null,
	constraint pk_cliente primary key(ClienteID)
);

-- Insertar un cliente
INSERT INTO Cliente (ClienteID, Nombre, Apellido, Direccion, Telefono)
VALUES 
('C001', 'Juan', 'Perez', 'Arequipa', '987654321'),
('C002', 'Pepito', 'Quispe', 'Lima', '933447787')
SELECT*FROM Cliente

-- Crear la tabla Empleado para almacenar información sobre los empleados
CREATE TABLE Empleado 
(
    EmpleadoID char(4)not null,
    Nombre VARCHAR(50)not null,
    Apellido VARCHAR(50)not null,
    Puesto VARCHAR(50)not null,
    Salario DECIMAL(10, 2)not null,
	constraint pk_empleado primary key(EmpleadoID) 
);
-- Añade más empleados
INSERT INTO Empleado(EmpleadoID, Nombre, Apellido, Puesto, Salario)
VALUES('E081', 'Juan', 'Apaza', 'Camarero', 1500),
      ('E010', 'Felipe', 'Nuñez', 'Camarero', 1500),
      ('E130', 'Alexis', 'Colque', 'Chef', 2500),
      ('E150', 'Alberto', 'Apaza', 'Cocinero', 2000),
      ('E261', 'Diego', 'Rosas', 'Ayudante', 1800),
      ('E260', 'Carlos', 'Soriano', 'Gerente', 3500)
	  SELECT*FROM Empleado

CREATE TABLE Pedido (
    PedidoID char(5)not null,
    ClienteID CHAR(4)NOT NULL,
    EmpleadoID char(4)not null,
    FechaPedido DATETIME NOT NULL,
	Total decimal(6,2) not null,
	--DATA FECHA
	--DATATIME FECHA + HORA
	constraint pk_pedido primary key(PedidoID), 
    constraint fk_cliente FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    constraint fk_empleado FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID)

);
-- Insertar un pedido
INSERT INTO Pedido (PedidoID, ClienteID, EmpleadoID, FechaPedido, Total)
VALUES ('00001', 'C001', 'E010', '08/16/2023 12:00', 20.50);
select*from Pedido
SELECT*FROM Empleado
SELECT*FROM Cliente

CREATE TABLE DetallePedido (
    DetalleID char(4)not null,
    PedidoID char(5)not null,
    ProductoID CHAR(4) not null,
    Cantidad INT not null,
    Subtotal DECIMAL(10, 2)not null,
	constraint pk_detallepedido primary key (DetalleID),
    constraint fk_pedido  FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    constraint fk_producto FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Insertar un detalle de pedido
INSERT INTO DetallePedido (DetalleID, PedidoID, ProductoID, Cantidad, Subtotal)
VALUES ('D001','00001','P001', 2, 20.50);
select*from DetallePedido
