USE dbgamarramarket;
SELECT DATABASE() AS '05_Actividad_BD1';

-- Actualización de datos en tablas --
ALTER TABLE CLIENTE
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;

ALTER TABLE PRENDA
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;

ALTER TABLE VENDEDOR
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;

ALTER TABLE VENTA
MODIFY COLUMN id INT AUTO_INCREMENT,
MODIFY COLUMN activo BOOL DEFAULT 1;

ALTER TABLE VENTA_DETALLE
MODIFY COLUMN ID INT AUTO_INCREMENT;

-- Insertar datos en la tabla CLIENTE --
INSERT INTO CLIENTE 
    (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
("DNI", "12345678", "Carlos", "Gomez Perez", "carlos.gomez@ejemplo.com", "998456789", str_to_date("10/02/1970", "%d/%m/%Y")),
("DNI", "87654321", "Ana", "Lopez Sanchez", "ana.lopez@ejemplo.com", "912345678", str_to_date("20/03/1985", "%d/%m/%Y")),
("CNE", "147258369", "Luis", "Ramirez Torres", "luis.ramirez@ejemplo.com", "921234567", str_to_date("06/06/1990", "%d/%m/%Y")),
("CNE", "963852741", "Maria", "Rojas Diaz", "maria.rojas@empresa.com", "931234567", str_to_date("10/08/1988", "%d/%m/%Y")),
("DNI", "753951456", "José", "Paredes Campos", "jose.paredes@ejemplo.com", "941234567", str_to_date("25/12/1982", "%d/%m/%Y"));

SELECT * FROM CLIENTE;

-- Insertar datos en la tabla VENDEDOR --
INSERT INTO VENDEDOR
    (tipo_documento, numero_documento, nombres, apellidos, salario, celular, email)
VALUES
    ("DNI", "12378945", "Beatriz", "Flores Luna", "1500.00", "987654321", "beatriz.flores@ejemplo.com"),
    ("DNI", "45612378", "Pedro", "Rios Valle", "1350.00", "965432187", "pedro.rios@empresa.com");

SELECT * FROM VENDEDOR;

-- Insertar datos en la tabla PRENDA --
INSERT INTO PRENDA
    (descripcion, marca, cantidad, talla, precio)
VALUES
    ("Camisa Formal", "Zara", 50, 15, 70.00),
    ("Polo Deportivo", "Nike", 80, 16, 50.00),
    ("Pantalón Jeans", "Levis", 30, 28, 85.00),
    ("Abrigo Invierno", "H&M", 15, 20, 120.00);

SELECT * FROM PRENDA;

-- Insertar datos en la tabla VENTA --
INSERT INTO VENTA
    (fecha_hora, cliente_id, vendedor_id)
VALUES
    (now(), 1, 1),
    (now(), 2, 2),
    (now(), 3, 1);

SELECT * FROM VENTA;

-- Insertar datos en la tabla VENTA_DETALLE --
INSERT INTO VENTA_DETALLE
    (venta_id, prenda_id, cantidad)
VALUES
    (1, 1, 2),
    (1, 2, 3),
    (2, 3, 1),
    (3, 4, 4);

SELECT * FROM VENTA_DETALLE;

-- Actualizar el número de celular de un cliente específico --
UPDATE CLIENTE
SET celular = '922881102'
WHERE id = 3;

-- Actualizar número de celular de un cliente existente --
UPDATE CLIENTE
SET celular = '977226605'
WHERE numero_documento = "87654321";

-- Desactivar clientes por DNI --
UPDATE CLIENTE
SET activo = 0
WHERE numero_documento IN ("753951456", "147258369");

-- Vaciar el campo celular de clientes específicos --
UPDATE CLIENTE
SET celular = ""
WHERE numero_documento IN ("963852741", "12345678");

-- Reactivar cliente y actualizar su correo --
UPDATE CLIENTE
SET activo = 1,
    email = "nuevo.correo@ejemplo.com"
WHERE nombres = "José" AND apellidos = "Paredes Campos";

-- Insertar nuevos datos de clientes y vendedores --
INSERT INTO CLIENTE
    (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
    ("DNI", "78945612", "Manuel", "Ortega Ramos", "manuel.ortega@ejemplo.com", "", str_to_date("15/05/1995", "%d/%m/%Y")),
    ("DNI", "45678912", "Laura", "Martinez Saenz", "laura.martinez@empresa.com", "987654312", str_to_date("10/10/1990", "%d/%m/%Y"));

SELECT * FROM CLIENTE;

-- Actualizar el precio de una prenda específica --
UPDATE PRENDA
SET precio = 55.00
WHERE descripcion = "Polo Deportivo" AND marca = "Nike";

SELECT * FROM PRENDA;

-- Cambiar el nombre de una prenda --
UPDATE PRENDA
SET descripcion = "Corbata Formal"
WHERE descripcion = "Corbata";

SELECT * FROM PRENDA;

-- Eliminar físicamente ciertas prendas y vendedores --
DELETE FROM PRENDA
WHERE descripcion IN ('Camisa Formal', 'Abrigo Invierno');

DELETE FROM VENDEDOR
WHERE nombres = "Pedro" AND apellidos = "Rios Valle";

-- Eliminar clientes específicos --
DELETE FROM CLIENTE
WHERE numero_documento IN ('12345678', '45678912');

-- Eliminar clientes nacidos en un año específico --
DELETE FROM CLIENTE
WHERE EXTRACT(YEAR FROM fecha_nacimiento) = 1990;

select * FROM CLIENTE;