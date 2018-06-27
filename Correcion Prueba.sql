CREATE DATABASE Almacen DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE Almacen;

CREATE TABLE productos (
 id INT NOT NULL AUTO_INCREMENT,
 idTipoProducto INT NOT NULL,
 idMarca INT NOT NULL,
 especificacion VARCHAR(60) NOT NULL,
 disponivilidad BOOLEAN NOT NULL,
 idPrecio INT NOT NULL,
 PRIMARY KEY (id)
 );
 
CREATE TABLE tipoProductos (
 id INT NOT NULL AUTO_INCREMENT,
 tipo VARCHAR(45) NOT NULL,
 PRIMARY KEY (id)
 );
 
CREATE TABLE marcas (
 id INT NOT NULL AUTO_INCREMENT,
 nombreMarca VARCHAR(45) NOT NULL,
 PRIMARY KEY (id)
 );
 
CREATE TABLE distriubidores (
 id INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(45) NOT NULL,
 direccion VARCHAR(60) NOT NULL,
 telefono INT NOT NULL,
 email VARCHAR(45) NOT NULL,
 idMarca INT NOT NULL,
 PRIMARY KEY (id)
 );
 
 CREATE TABLE precios (
 id INT NOT NULL AUTO_INCREMENT,
 idProducto INT NOT NULL,
 precio DECIMAL NOT NULL,
 PRIMARY KEY (id)
 );
 
CREATE TABLE facturas (
 id INT NOT NULL AUTO_INCREMENT,
 idProducto INT NOT NULL,
 idPrecio INT NOT NULL,
 cantidad INT NOT NULL,
 total DECIMAL NOT NULL,
 PRIMARY KEY (id)
 );
 
 CREATE TABLE registroFactura (
 id INT NOT NULL AUTO_INCREMENT,
 idFactura INT NOT NULL,
 fechaFactura DATETIME NOT NULL,
 PRIMARY KEY (id)
 );
 
 ALTER TABLE productos ADD FOREIGN KEY (idTipoProducto) REFERENCES tipoProductos(id);
 ALTER TABLE productos ADD FOREIGN KEY (idMarca) REFERENCES marcas(id);
 ALTER TABLE productos ADD FOREIGN KEY (idPrecio) REFERENCES precios(id);
 ALTER TABLE distriubidores ADD FOREIGN KEY (idMarca) REFERENCES marcas(id);
 ALTER TABLE precios ADD FOREIGN KEY (idProducto) REFERENCES productos(id);
 ALTER TABLE facturas ADD FOREIGN KEY (idProducto) REFERENCES productos(id);
 ALTER TABLE facturas ADD FOREIGN KEY (idPrecio) REFERENCES precios(id);
 ALTER TABLE registroFactura ADD FOREIGN KEY (idFactura) REFERENCES facturas(id);