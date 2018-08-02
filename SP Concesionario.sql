USE Concesionaria;

CREATE PROCEDURE ClienteCreacion(
  nuevo_nombre VARCHAR(60),
  nuevo_apellido VARCHAR(60),
  nuevo_idAuto INT
)

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

CALL ClienteCreacion('MeLa','PelasConCanela',1)