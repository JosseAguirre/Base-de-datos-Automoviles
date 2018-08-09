CREATE DATABASE Tienda DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE Tienda;


CREATE TABLE Articulos (
 id INT NOT NULL AUTO_INCREMENT,
 articulo VARCHAR(60) NOT NULL,
 precio DECIMAL NOT NULL,
 stock INT NOT NULL,
 PRIMARY KEY (id)
 );
 
 
 CREATE TABLE Ventas (
 id INT NOT NULL AUTO_INCREMENT,
 CI VARCHAR(10) NOT NULL,
 fecha DATETIME NOT NULL,
 cantidad INT NOT NULL,
 idArticulo INT NOT NULL,
 importe INT,
 PRIMARY KEY (id)
 );
 
 
 INSERT INTO Articulos(articulo, precio, stock) VALUES
 ('teclado',16,10),
 ('mouse',8,10),
 ('monitor',35,10),
 ('VGA',17,10),
 ('DMI',9,10),
 ('Laptop HP',400,10),
 ('Huawei P9',200,10),
 ('Sony Z5',349,10),
 ('Samsung S8',800,10),
 ('IPhone X',1200,10);
