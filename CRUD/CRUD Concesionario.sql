USE Concesionaria;
-- CLIENTES
-- Create
DELIMITER $$
CREATE PROCEDURE ClienteCreate(
  nuevo_nombre VARCHAR(60),
  nuevo_apellido VARCHAR(60),
  nuevo_idAuto INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Clientes(
  nombre,
  apellido,
  idAuto
)
VALUES(
  nuevo_nombre,
  nuevo_apellido,
  nuevo_idAuto
);
SET ultimoID = last_insert_id();
END$$
DELIMITER ;

 -- CALL ClienteCreate('Hugo','Yunta',7);

-- Read
DELIMITER $$
CREATE PROCEDURE ClienteRead(
  read_nombre VARCHAR(60),
  read_apellido VARCHAR(60)
)
BEGIN
SELECT Clientes.nombre, Clientes.apellido
FROM Clientes
WHERE Clientes.nombre = read_nombre AND Clientes.apellido = read_apellido;
END $$
DELIMITER ;

-- CALL ClienteRead('Marco', 'Torres');

-- Update
DELIMITER $$
CREATE PROCEDURE ClienteUpdate(
  actualizar_nombre VARCHAR(60),
  actualizar_apellido VARCHAR(60),
  actualizar_idAuto INT,
  actualizar_id INT
)
BEGIN
UPDATE Clientes
SET nombre = actualizar_nombre, apellido = actualizar_apellido, idAuto = actualizar_idAuto
WHERE Clientes.id = actualizar_id;
END $$
DELIMITER ;
-- Call ClienteUpdate('Marco', 'Torres', 5, 1);

-- Delete
DELIMITER $$
CREATE PROCEDURE ClienteDelete(
  borrar_id INT
)
BEGIN
DELETE FROM Clientes
WHERE Clientes.id = borrar_id;
END $$
DELIMITER ;
-- CALL ClienteDelete(2);
-- -------------------------------------------------------------------------------------------------------------
-- AUTOS

-- Create
DELIMITER $$
CREATE PROCEDURE AutoCreate(
  nuevo_marca VARCHAR(60),
  nuevo_modelo VARCHAR(60),
  OUT ultimoID INT
)
BEGIN
INSERT INTO Auto(
  marca,
  modelo
)
VALUES(
  nuevo_marca,
  nuevo_modelo
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call AutoCreate('Volvo','X8');

-- Read
DELIMITER $$
CREATE PROCEDURE AutoRead(
  read_marca VARCHAR(60),
  read_modelo VARCHAR(60)
)
BEGIN
SELECT Auto.marca, Auto.modelo
FROM Auto
WHERE Auto.marca = read_marca AND Auto.modelo = read_modelo;
END $$
DELIMITER ;
-- CALL AutoRead('Volvo', 'X8');

-- Update
DELIMITER $$
CREATE PROCEDURE AutoUpdate(
  actualizar_marca VARCHAR(60),
  actualizar_modelo VARCHAR(60),
  actualizar_idAuto INT
)
BEGIN
UPDATE Auto
SET marca = actualizar_marca, modelo = actualizar_modelo
WHERE Auto.id = actualizar_idAuto;
END $$
DELIMITER ;
-- Call AutoUpdate('Chevrolet', 'Cruz', 5);

-- Delete
DELIMITER $$
CREATE PROCEDURE AutoDelete(
  borrar_idAuto INT
)
BEGIN
DELETE FROM Auto
WHERE Auto.id = borrar_idAuto;
END $$
DELIMITER ;
-- CALL AutoDelete(1);

-- ------------------------------------------------------------------------------------------------------
-- PLACAS

-- Create
DELIMITER $$
CREATE PROCEDURE PlacaCreate(
  nuevo_año INT,
  nuevo_placa VARCHAR(60),
  nuevo_idAuto INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Placas(
  año,
  placa,
  idAuto
)
VALUES(
  nuevo_año,
  nuevo_placa,
  nuevo_idAuto
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call PlacaCreate(2018,'PLB-7887',1);

-- Read
DELIMITER $$
CREATE PROCEDURE PlacaRead(
  read_placa VARCHAR(60),
  read_idAuto INT
)
BEGIN
SELECT Placas.placa, Placas.idAuto
FROM Placas
WHERE Placas.placa = read_placa AND Placas.idAuto = read_idAuto ;
END $$
DELIMITER ;
-- CALL PlacaRead('PBL-6687', 1	);

-- Update
DELIMITER $$
CREATE PROCEDURE PlacaUpdate(
  actualizar_año INT,
  actualizar_placa VARCHAR(60),
  actualizar_idAuto INT
)
BEGIN
UPDATE Placas
SET año = actualizar_año, placa = actualizar_placa
WHERE Placas.id = actualizar_idAuto;
END $$
DELIMITER ;
-- Call AutoUpdate(2015, 'MHT-2456', 2);

-- Delete
DELIMITER $$
CREATE PROCEDURE PlacaDelete(
  borrar_idPlaca INT
)
BEGIN
DELETE FROM Placas
WHERE Placas.id = borrar_idPlaca;
END $$
DELIMITER ;
-- CALL PlacaDelete(3);

-- --------------------------------------------------------------------------------------------------------
-- VENTAS

-- Create
DELIMITER $$
CREATE PROCEDURE VentaCreate(
  nuevo_idCliente INT,
  nuevo_idAuto INT,
  OUT ultimoID INT
)
BEGIN
INSERT INTO Placas(
  idCliente,
  idAuto
)
VALUES(
  nuevo_idCliente,
  nuevo_idAuto
);
SET ultimoID = last_insert_id();
END $$
DELIMITER ;
-- Call VentaCreate(2,1);

-- Read
DELIMITER $$
CREATE PROCEDURE VentaRead(
  read_idCliente INT,
  read_idAuto INT
)
BEGIN
SELECT Ventas.idCliente, Ventas.idAuto
FROM Ventas
WHERE Ventas.idCliente = read_idCliente AND Ventas.idAuto = read_idAuto ;
END $$
DELIMITER ;
-- CALL VentaRead(1, 1);

-- Update
DELIMITER $$
CREATE PROCEDURE VentaUpdate(
  actualizar_idCliente INT,
  actualizar_idAuto INT,
  actualizar_id INT
)
BEGIN
UPDATE Ventas
SET idCliente = actualizar_idCliente, idAuto = actualizar_idAuto
WHERE Ventas.id = actualizar_id;
END $$
DELIMITER ;
-- Call VentaUpdate(1, 1, 2);

-- Delete
DELIMITER $$
CREATE PROCEDURE VentaDelete(
  borrar_idVenta INT
)
BEGIN
DELETE FROM Ventas
WHERE Ventas.id = borrar_idVenta;
END $$
DELIMITER ;
-- CALL VentaDelete(1);