USE Almacen;

-- Personas
-- Create
DELIMITER $$
CREATE PROCEDURE PersonaCreate(
  nuevo_nombre VARCHAR(60),
  nuevo_apellido VARCHAR(60),
  nuevo_emal VARCHAR(60),
  nuevo_idRol INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Clientes(
  nombre,
  apellido,
  email,
  idRol
)
VALUES(
  nuevo_nombre,
  nuevo_apellido,
  nuevo_emal,
  nuevo_idRol
);
SET ultimoID = last_insert_id();
END$$
DELIMITER ;

 -- CALL PersonaCreate('Antonio','Freire','hola@gmail.com',1);

-- Read
DELIMITER $$
CREATE PROCEDURE PersonaRead(
  read_nombre VARCHAR(60),
  read_apellido VARCHAR(60),
  read_idRol INT
)
BEGIN
SELECT Personas.nombre, Personas.apellido, Personas.email, Personas.idRol
FROM Personas
WHERE Personas.idRol = read_idRol;
END $$
DELIMITER ;

-- CALL PersonaRead('Antonio', 'Freire', 1);

-- Update
DELIMITER $$
CREATE PROCEDURE PersonaUpdate(
  actualizar_nombre VARCHAR(60),
  actualizar_apellido VARCHAR(60),
  actualizar_email VARCHAR(60),
  actualizar_idRol INT,
  actualizar_id INT
)
BEGIN
UPDATE Personas
SET nombre = actualizar_nombre, apellido = actualizar_apellido, email = actualizar_email, idRol = actualizar_idRol
WHERE Personas.id = actualizar_id;
END $$
DELIMITER ;
-- Call PersonasUpdate('Marco', 'Torres', 'cebra@yahoo.com', 2);

-- Delete
DELIMITER $$
CREATE PROCEDURE PersonaDelete(
  borrar_id INT
)
BEGIN
DELETE FROM Persona
WHERE Persona.id = borrar_id;
END $$
DELIMITER ;
-- CALL PersonaDelete(1);

-- -------------------------------------------------------------------------------------------------------

-- Roles

-- Create
DELIMITER $$
CREATE PROCEDURE RolCreate(
  nuevo_cargo VARCHAR(60),
  nuevo_descripcion VARCHAR(60),
  OUT ultimoID INT
)
BEGIN
INSERT INTO Auto(
  cargo,
  descripcion
)
VALUES(
  nuevo_cargo,
  nuevo_descripcion
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call RolCreate('Bedegero','Asistente de bodega');

-- Read
DELIMITER $$
CREATE PROCEDURE RolRead(
  read_cargo VARCHAR(60),
  read_descripcion VARCHAR(60)
)
BEGIN
SELECT Rol.cargo, Rol.descripcion
FROM Rol
WHERE Rol.cargo = read_cargo AND Rol.descripcion = read_descripcion;
END $$
DELIMITER ;
-- CALL RolRead('Bodegero', 'Asistente de bodega');

-- Update
DELIMITER $$
CREATE PROCEDURE RolUpdate(
  actualizar_cargo VARCHAR(60),
  actualizar_descripcion VARCHAR(60),
  actualizar_id INT
)
BEGIN
UPDATE Roles
SET cargo = actualizar_cargo, descripcion =actualizar_descripcion
WHERE Roles.id = actualizar_id;
END $$
DELIMITER ;
-- Call RolUpdate('Repartidor', 'Movilizacion', 1);

-- Delete
DELIMITER $$
CREATE PROCEDURE RolDelete(
  borrar_id INT
)
BEGIN
DELETE FROM Roles
WHERE Roles.id = borrar_id;
END $$
DELIMITER ;
-- CALL RolDelete(1);

-- -------------------------------------------------------------------------------------------------------

-- Distriubidores

-- Create
DELIMITER $$
CREATE PROCEDURE DisCreate(
  nuevo_compania VARCHAR(60),
  nuevo_direccion VARCHAR(60),
  nuevo_telefono INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Distriubidores(
  compania,
  direccion,
  telefono
)
VALUES(
  nuevo_compania,
  nuevo_direccion,
  nuevo_telefono
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call DisCreate('Montenegro','Manabi-Rocafuerte', 522422787);

-- Read
DELIMITER $$
CREATE PROCEDURE DisRead(
  read_compania VARCHAR(60),
  read_direccion VARCHAR(60),
  read_telefono INt
)
BEGIN
SELECT Distriubidores.compania, Distriubidores.direccion, Distriubidores.telefono
FROM Distriubidores
WHERE Distriubidores.compania= read_compania;
END $$
DELIMITER ;
-- CALL DisRead('Montenegro', 'Manabi-Rocafuerte', 522422787);

-- Update
DELIMITER $$
CREATE PROCEDURE DisUpdate(
  actualizar_compania VARCHAR(60),
  actualizar_direccion VARCHAR(60),
  actualizar_telefono INT,
  actualizar_id INT
)
BEGIN
UPDATE Distriubidores
SET compania = actualizar_compania, direccion =actualizar_direccion, telefono = actualizar_telefono
WHERE Distriubidores.id = actualizar_id;
END $$
DELIMITER ;
-- Call DisUpdate('Adelca', 'Quito-Carcelen', 2425665);

-- Delete
DELIMITER $$
CREATE PROCEDURE DisDelete(
  borrar_id INT
)
BEGIN
DELETE FROM Distriubidores
WHERE Distriubidores.id = borrar_id;
END $$
DELIMITER ;
-- CALL DisDelete(1);

-- --------------------------------------------------------------------------------------------------------

-- MARCAS

-- Create
DELIMITER $$
CREATE PROCEDURE MarcaCreate(
  nuevo_marca VARCHAR(60),
  nuevo_idDistriubidor INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Marcas(
  marca,
  idDistriubidor
)
VALUES(
  nuevo_marca,
  nuevo_idDistriubidor
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call MarcaCreate('Panasonic',1);

-- Read
DELIMITER $$
CREATE PROCEDURE MarcaRead(
  read_marca VARCHAR(60),
  read_idDistriubidor INT
)
BEGIN
SELECT Marcas.marca, Marcas.idDistriubidor
FROM Marcas
WHERE Marcas.marca= read_marca;
END $$
DELIMITER ;
-- CALL MarcaRead('Sony', 7);

-- Update
DELIMITER $$
CREATE PROCEDURE MarcaUpdate(
  actualizar_marca VARCHAR(60),
  actualizar_idDistriubidor INT,
  actualizar_id INT
)
BEGIN
UPDATE Marcas
SET marca = actualizar_compania, idDistriubidor =actualizar_direccion
WHERE Marcas.id = actualizar_id;
END $$
DELIMITER ;
-- Call MarcaUpdate('Huawey', 2, 3);

-- Delete
DELIMITER $$
CREATE PROCEDURE MarcaDelete(
  borrar_id INT
)
BEGIN
DELETE FROM Marcas
WHERE Marcas.id = borrar_id;
END $$
DELIMITER ;
-- CALL MarcaDelete(2);

-- --------------------------------------------------------------------------------------------------------

-- PRODUCTOS

-- Create
DELIMITER $$
CREATE PROCEDURE ProductoCreate(
  nuevo_descripcion VARCHAR(60),
  nuevo_idMarca INT,
  nuevo_idTipoProducto INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Productos(
  descripcion,
  idMarca.
  idTipoProducto
)
VALUES(
  nuevo_descripcion,
  nuevo_idMarca,
  nuevo_idTipoProducto
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call ProductoCreate('Afeitadora',1,1);

-- Read
DELIMITER $$
CREATE PROCEDURE ProductoRead(
  read_descripcion VARCHAR(60),
  read_idMarca INT,
  read_idTipoProducto INT
)
BEGIN
SELECT Productos.descripcion, Productos.idMarca, Productos.idTipoProducto
FROM Productos
WHERE Productos.descripcion=  read_descripcion;
END $$
DELIMITER ;
-- CALL ProductosRead('Desodorante', 4, 3);

-- Update
DELIMITER $$
CREATE PROCEDURE ProductoUpdate(
  actualizar_descripcion VARCHAR(60),
  actualizar_idMarca INT,
  actualizar_idTipoProducto INT,
  actualizar_id INT
)
BEGIN
UPDATE Productos
SET descripcion = actualizar_descripcion, idMarca =actualizar_idMarca, idTipoProducto = actualizar_idTipoProducto
WHERE Productos.id = actualizar_id;
END $$
DELIMITER ;
-- Call MarcaUpdate('Parrilla', 9, 4);

-- Delete
DELIMITER $$
CREATE PROCEDURE ProductoDelete(
  borrar_id INT
)
BEGIN
DELETE FROM Productos
WHERE Productos.id = borrar_id;
END $$
DELIMITER ;
-- CALL ProductoDelete(4);

-- ---------------------------------------------------------------------------------------------------------

-- TipoProducto

-- Create
DELIMITER $$
CREATE PROCEDURE TipoProCreate(
  nuevo_detalle VARCHAR(60),
  nuevo_idDistriubidor INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO TipoProductos(
  detalle,
  idDistriubidor
)
VALUES(
  nuevo_detalle,
  nuevo_idDistriubidor
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call MarcaCreate('Aseo',4);

-- Read
DELIMITER $$
CREATE PROCEDURE TipoProRead(
  read_detalle VARCHAR(60),
  read_idDistriubidor INT
)
BEGIN
SELECT TipoProductos.detalle, TipoProductos.idDistriubidor
FROM TipoProductos
WHERE TipoProductos.detalle= read_detalle;
END $$
DELIMITER ;
-- CALL MarcaRead('Jardineria', 3);

-- Update
DELIMITER $$
CREATE PROCEDURE TipoProUpdate(
  actualizar_detalle VARCHAR(60),
  actualizar_idDistriubidor INT,
  actualizar_id INT
)
BEGIN
UPDATE TipoProductos
SET detalle = actualizar_detalle, idDistriubidor =actualizar_idDistriubidor
WHERE TipoProductos.id = actualizar_id;
END $$
DELIMITER ;
-- Call MarcaUpdate('Plomeria', 5, 3);

-- Delete
DELIMITER $$
CREATE PROCEDURE TipoProDelete(
  borrar_id INT
)
BEGIN
DELETE FROM TipoProductos
WHERE TipoProductos.id = borrar_id;
END $$
DELIMITER ;
-- CALL TipoProDelete(2);