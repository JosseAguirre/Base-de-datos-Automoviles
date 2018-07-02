CREATE DATABASE mascotas DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

Use mascotas;

CREATE TABLE personas(
id INT NOT NULL auto_increment,
nombre VARCHAR(25) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE mascotas(
id INT NOT NULL auto_increment,
nombreMascota VARCHAR(25) NOT NULL,
idPersona INT NOT NULL,
PRIMARY KEY(id)
);