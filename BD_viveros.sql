-- Crear las tablas

-- Tabla Cliente
CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    tipo VARCHAR(20) CHECK (tipo IN ('Normal', 'Tajinaste Plus')) NOT NULL,
    datos_personales JSONB NOT NULL,
    fecha_ingreso DATE,
    bonificaciones DECIMAL(10, 2) DEFAULT 0
);

-- Tabla Vivero
CREATE TABLE Vivero (
    vivero_id SERIAL PRIMARY KEY,
    latitud DECIMAL(9, 6) NOT NULL,
    longitud DECIMAL(9, 6) NOT NULL
);

-- Tabla Zona
CREATE TABLE Zona (
    zona_id SERIAL PRIMARY KEY,
    tipo VARCHAR(20) CHECK (tipo IN ('Exterior', 'Interior', 'Almacén')) NOT NULL,
    vivero_id INT REFERENCES Vivero(vivero_id) ON DELETE CASCADE
);

-- Tabla Productos
CREATE TABLE Productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    stock INT CHECK (stock >= 0) NOT NULL
);

-- Tabla Asignado (relación entre Productos y Zonas)
CREATE TABLE Asignado (
    zona_id INT REFERENCES Zona(zona_id) ON DELETE CASCADE,
    producto_id INT REFERENCES Productos(producto_id) ON DELETE CASCADE,
    cantidad INT CHECK (cantidad >= 0),
    PRIMARY KEY (zona_id, producto_id)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    empleado_id SERIAL PRIMARY KEY,
    datos_personales JSONB NOT NULL,
    historico JSONB
);

-- Tabla Compra (relación entre Cliente y Productos)
CREATE TABLE Compra (
    compra_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Cliente(cliente_id) ON DELETE CASCADE,
    producto_id INT REFERENCES Productos(producto_id) ON DELETE CASCADE,
    fecha DATE NOT NULL
);

-- Tabla Control_Pedidos (relación entre Empleado y Compra)
CREATE TABLE Control_Pedidos (
    pedido_id SERIAL PRIMARY KEY,
    empleado_id INT REFERENCES Empleado(empleado_id) ON DELETE SET NULL,
    cliente_id INT REFERENCES Cliente(cliente_id) ON DELETE CASCADE,
    compra_id INT REFERENCES Compra(compra_id) ON DELETE CASCADE
);

-- Tabla Trabaja (relación entre Empleado y Vivero)
CREATE TABLE Trabaja (
    empleado_id INT REFERENCES Empleado(empleado_id) ON DELETE CASCADE,
    vivero_id INT REFERENCES Vivero(vivero_id) ON DELETE CASCADE,
    PRIMARY KEY (empleado_id, vivero_id)
);

-- Tabla Tiene (relación entre Empleado y Zona)
CREATE TABLE Tiene (
    empleado_id INT REFERENCES Empleado(empleado_id) ON DELETE CASCADE,
    zona_id INT REFERENCES Zona(zona_id) ON DELETE CASCADE,
    PRIMARY KEY (empleado_id, zona_id)
);

-- Inserción de datos en las tablas

-- Insertar datos en Cliente
INSERT INTO Cliente (tipo, datos_personales, fecha_ingreso, bonificaciones) VALUES
('Normal', '{"nombre": "Juan", "edad": 35}', NULL, 0),
('Tajinaste Plus', '{"nombre": "Ana", "edad": 28}', '2021-01-15', 150.5),
('Tajinaste Plus', '{"nombre": "Luis", "edad": 42}', '2021-02-20', 200),
('Normal', '{"nombre": "Marta", "edad": 30}', NULL, 0),
('Tajinaste Plus', '{"nombre": "Clara", "edad": 25}', '2021-05-10', 75);

-- Insertar datos en Vivero
INSERT INTO Vivero (latitud, longitud) VALUES
(28.123456, -16.567890),
(28.654321, -16.123456),
(28.987654, -16.789012),
(28.543210, -16.456789),
(28.678901, -16.345678);

-- Insertar datos en Zona
INSERT INTO Zona (tipo, vivero_id) VALUES
('Exterior', 1),
('Interior', 2),
('Almacén', 3),
('Exterior', 4),
('Interior', 5);

-- Insertar datos en Productos
INSERT INTO Productos (nombre, stock) VALUES
('Maceta grande', 50),
('Fertilizante', 100),
('Regadera', 30),
('Abono', 25),
('Tierra vegetal', 70);

-- Insertar datos en Asignado
INSERT INTO Asignado (zona_id, producto_id, cantidad) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 5),
(4, 4, 8),
(5, 5, 15);

-- Insertar datos en Empleado
INSERT INTO Empleado (datos_personales, historico) VALUES
('{"nombre": "Carlos", "puesto": "vendedor"}', '{"2023": "Ventas"}'),
('{"nombre": "Laura", "puesto": "jardinero"}', '{"2023": "Jardinería"}'),
('{"nombre": "Diego", "puesto": "logística"}', '{"2023": "Logística"}'),
('{"nombre": "Sofía", "puesto": "vendedor"}', '{"2023": "Ventas"}'),
('{"nombre": "María", "puesto": "administración"}', '{"2023": "Administración"}');

-- Insertar datos en Compra
INSERT INTO Compra (cliente_id, producto_id, fecha) VALUES
(1, 1, '2023-01-10'),
(2, 2, '2023-01-15'),
(3, 3, '2023-01-20'),
(4, 4, '2023-02-05'),
(5, 5, '2023-02-10');

-- Insertar datos en Control_Pedidos
INSERT INTO Control_Pedidos (empleado_id, cliente_id, compra_id) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 1, 5);

-- Insertar datos en Trabaja
INSERT INTO Trabaja (empleado_id, vivero_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insertar datos en Tiene
INSERT INTO Tiene (empleado_id, zona_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Ejemplos de DELETE

-- Eliminar un cliente y todas sus compras
DELETE FROM Cliente WHERE cliente_id = 1;

-- Eliminar una zona y todos los productos asignados a ella
DELETE FROM Zona WHERE zona_id = 2;
