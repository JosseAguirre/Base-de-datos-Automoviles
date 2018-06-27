CREATE DATABASE Ejemplo DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE Ejemplo;

CREATE TABLE estudiante (
idestudiante INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (45) NOT NULL,
PRIMARY KEY (idestudiante)
);

CREATE TABLE asignaturas (
idasignaturas INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR (45) NOT NULL,
PRIMARY KEY (idasignaturas)
);

CREATE TABLE estudianteAsignaturas (
idestudianteAsignaturas INT NOT NULL AUTO_INCREMENT,
id_Estudiante INT NOT NULL,
id_Asignaturas INT NOT NULL,
PRIMARY KEY (idestudianteAsignaturas)
);

CREATE TABLE cursos (
idcurso INT NOT NULL AUTO_INCREMENT,
curso VARCHAR (45) NOT NULL,
id_Asignatura INT NOT NULL,
PRIMARY KEY (idcurso)
);

ALTER TABLE estudianteAsignaturas ADD FOREIGN KEY (id_Estudiante) REFERENCES estudiante(idestudiante);
ALTER TABLE estudianteAsignaturas ADD FOREIGN KEY (id_Asignaturas) REFERENCES asignaturas(idasignaturas);
ALTER TABLE cursos ADD FOREIGN KEY (id_Asignatura) REFERENCES asignaturas(idasignaturas);

INSERT INTO estudiante (nombre) VALUES
('Erick'),
('Pablo'),
('Arturo'),
('Marco'),
('Josue');

INSERT INTO asignaturas (nombre) VALUES
('Matematicas'),
('Ciencias'),
('Fisica'),
('Quimica'),
('Astronomia');

INSERT INTO estudianteAsignaturas (id_Estudiante, id_Asignaturas) VALUES
(1,5),
(2,1),
(3,2),
(5,1),
(4,3),
(3,4),
(1,2);

SELECT estudiante.nombre AS 'Estudiante', asignaturas.nombre AS 'Asignatura' FROM estudianteAsignaturas
INNER JOIN estudiante ON estudiante.idestudiante = estudianteAsignaturas.id_Estudiante
INNER JOIN asignaturas ON asignaturas.idasignaturas = estudianteAsignaturas.id_Asignaturas
WHERE estudiante.idestudiante = 1