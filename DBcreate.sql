-- Crear la base de datos del restaurante
CREATE DATABASE Restaurante;

-- Usar la base de datos
USE Restaurante;

-- Crear la tabla Tipo para categorizar los productos
CREATE TABLE Tipo (
    TipoID INT PRIMARY KEY,
    NombreTipo NVARCHAR(50)
);
