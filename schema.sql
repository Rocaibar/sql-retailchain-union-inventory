--======================================================
-- RetailChain - Inventario por sucursal
--======================================================

DROP TABLE IF EXISTS inventario_sucursal_norte;
DROP TABLE IF EXISTS inventario_sucursal_sur;

-- Creo las tablas de inventario
-- * Sucursal Norte.
CREATE TABLE inventario_sucursal_norte (
id_producto INT,
nombre_producto VARCHAR(100) NOT NULL,
categoria VARCHAR(50),
stock INT NOT NULL
);

-- * Sucursal Sur.
CREATE TABLE inventario_sucursal_sur (
id_producto INT,
nombre_producto VARCHAR(100) NOT NULL,
categoria VARCHAR(50),
stock INT NOT NULL
);

-- Carga de información a las tablas.
-- * Sucursal Norte.
INSERT INTO inventario_sucursal_norte (id_producto, nombre_producto, categoria, stock) VALUES
(101, 'Laptop Pro 15', 'Computación', 8),
(102, 'Mouse Inalámbrico', 'Accesorios', 30),
(103, 'Monitor 4K 27"','Computación', 5),
(104, 'Teclado Mecánico', 'Accesorios', 20),
(105, 'Auriculares BT Pro', 'Audio', 15),
-- Estos productos también están en la sucursal sur
(106, 'SSD Externo 1TB', 'Almacenamiento', 10),
(107, 'Webcam HD 1080p', 'Accesorios', 12);

-- * Sucursal Sur.
INSERT INTO inventario_sucursal_sur (id_producto, nombre_producto, categoria, stock) VALUES
(103, 'Monitor 4K 27"', 'Computación', 3),
(104, 'Teclado Mecánico', 'Accesorios', 18),
(106, 'SSD Externo 1TB', 'Almacenamiento', 7),
-- Estos productos son exclusivos de la sucursal sur
(108, 'Laptop Basic 14', 'Computación', 6),
(109, 'Parlante Bluetooth', 'Audio', 22),
(110, 'Hub USB-C 7p', 'Accesorios', 35),
(111, 'Webcam HD 1080p', 'Accesorios', 9);