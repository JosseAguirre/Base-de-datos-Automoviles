CREATE DATABASE Empresa DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE Empresa;

CREATE TABLE Empresas (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(60) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Ubicacion (
id INT NOT NULL AUTO_INCREMENT,
direccion VARCHAR(60) NOT NULL,
idEmpresa INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Departamentos (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(60) NOT NULL,
funcion VARCHAR(60) NOT NULL,
idEmpresa INT NOT NULL,
idAdministracion INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE SubDepartamentos (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(60) NOT NULL,
funcion VARCHAR(60) NOT NULL,
idDepartamento INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Administracion (
id INT NOT NULL AUTO_INCREMENT,
idEmpresa INT NOT NULL,
idDepartamento INT NOT NULL,
PRIMARY KEY (id)
);

ALTER TABLE Ubicacion ADD FOREIGN KEY (idEmpresa) REFERENCES Empresas(id);
ALTER TABLE Departamentos ADD FOREIGN KEY (idEmpresa) REFERENCES Empresas(id);
ALTER TABLE Departamentos ADD FOREIGN KEY (idAdministracion) REFERENCES Administracion(id);
ALTER TABLE SubDepartamentos ADD FOREIGN KEY (idDepartamento) REFERENCES Departamentos(id);
ALTER TABLE Administracion ADD FOREIGN KEY (idEmpresa) REFERENCES Empresas(id);
ALTER TABLE Administracion ADD FOREIGN KEY (idDepartamento) REFERENCES Departamentos(id);
-- Tabla la cual almacena todo los aspectos de las tablas superiores
CREATE TABLE GerarquiaEmpresarial (
id INT NOT NULL AUTO_INCREMENT,
idEmpresa INT NOT NULL,
idUbicacion INT NOT NULL,
idDepartamento INT NOT NULL,
idSubDepartamento INT NOT NULL,
idAdministracion INT NOT NULL,
PRIMARY KEY (id)
);
ALTER TABLE GerarquiaEmpresarial ADD FOREIGN KEY (idEmpresa) REFERENCES Empresas(id);
ALTER TABLE GerarquiaEmpresarial ADD FOREIGN KEY (idUbicacion) REFERENCES Ubicacion(id);
ALTER TABLE GerarquiaEmpresarial ADD FOREIGN KEY (idDepartamento) REFERENCES Departamentos(id);
ALTER TABLE GerarquiaEmpresarial ADD FOREIGN KEY (idSubDepartamento) REFERENCES SubDepartamentos(id);
ALTER TABLE GerarquiaEmpresarial ADD FOREIGN KEY (idAdministracion) REFERENCES Administracion(id);