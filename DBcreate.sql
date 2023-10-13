-- Crear la base de datos del restaurante
CREATE DATABASE Restaurante;

-- Usar la base de datos
USE Restaurante;

-- Crear la tabla Tipo para categorizar los productos
CREATE TABLE Tipo (
    TipoID INT PRIMARY KEY,
    NombreTipo NVARCHAR(50)
);

--Insertar 3 tipos de productos
INSERT INTO Tipo (TipoID, NombreTipo)
VALUES(1,'Comida'),
      (2,'Extras'),
      (3,'Bebidas')

-- Crear la tabla Producto para almacenar los productos del menú
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    NombreProducto NVARCHAR(100),
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10, 2),
    TipoID INT,
    FOREIGN KEY (TipoID) REFERENCES Tipo(TipoID)
);

-- Insertar productos
INSERT INTO Producto (ProductoID, NombreProducto, Descripcion, Precio, TipoID)
VALUES(1, 'Pizza Americana Familiar', 'Pepperonni, Pimientos, Aceituna', '23.50', 1),
      (2, 'Alitas BBQ', 'Alas de pollo en salsa BBQ', '20.50', 2),
      (3, 'Limonada Frozen', 'Bebida de Limon helada', '10.00', 3)

-- Crear la tabla Cliente para almacenar información sobre los clientes
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(15)
);

-- Insertar un cliente
INSERT INTO Cliente (ClienteID, Nombre, Apellido, Direccion, Telefono)
VALUES (1, 'Juan', 'Perez', 'Arequipa', '987654321');

-- Crear la tabla Empleado para almacenar información sobre los empleados
CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Puesto NVARCHAR(50),
    Salario DECIMAL(10, 2)
);

-- Insertar un empleado
INSERT INTO Empleado (EmpleadoID, Nombre, Apellido, Puesto, Salario)
VALUES (12122000, 'Ana', 'Gomez', 'Camarero', 1500.00);

-- Añade más empleados
INSERT INTO Empleado(EmpleadoID, Nombre, Apellido, Puesto, Salario)
VALUES(08112001, 'Juan', 'Apaza', 'Camarero', 1500),
      (01021999, 'Felipe', 'Nuñez', 'Camarero', 1500),
      (13061992, 'Alexis', 'Colque', 'Chef', 500),
      (15021980, 'Alberto', 'Apaza', 'Cocinero', 2000),
      (26122000, 'Diego', 'Rosas', 'Ayudante', 1800)
      (26012005, 'Carlos', 'Soriano', 'Gerente', 500)

-- Crear la tabla Pedido para registrar los pedidos de los clientes
CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    EmpleadoID INT,
    FechaPedido DATETIME,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID)
);

-- Insertar un pedido
INSERT INTO Pedido (PedidoID, ClienteID, EmpleadoID, FechaPedido, Total)
VALUES (1, 1, 1, GETDATE(), 20.50);

-- Crear la tabla DetallePedido para almacenar los detalles de los productos en cada pedido
CREATE TABLE DetallePedido (
    DetalleID INT PRIMARY KEY,
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Insertar un detalle de pedido
INSERT INTO DetallePedido (DetalleID, PedidoID, ProductoID, Cantidad, Subtotal)
VALUES (1, 1, 2, 1, 20.50);
