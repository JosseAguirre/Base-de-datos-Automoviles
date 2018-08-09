CREATE DATABASE Concesionaria DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE Concesionaria;

CREATE TABLE Clientes (
 id INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(60) NOT NULL,
 apellido VARCHAR(60) NOT NULL,
 idAuto INT NOT NULL,
 PRIMARY KEY (id)
 );

 CREATE TABLE Auto (
 id INT NOT NULL AUTO_INCREMENT,
 marca VARCHAR (45) NOT NULL,
 modelo VARCHAR(45) NOT NULL,
 PRIMARY KEY (id)
 );
 
 CREATE TABLE Placas (
 id INT NOT NULL AUTO_INCREMENT,
 año INT NOT NULL,
 placa VARCHAR (30) NOT NULL,
 idAuto INT NOT NULL,
 PRIMARY KEY (id)
 );
 
CREATE TABLE Ventas (
 id INT NOT NULL AUTO_INCREMENT,
 idCliente INT NOT NULL,
 idAuto INT NOT NULL,
 PRIMARY KEY (id)
 );