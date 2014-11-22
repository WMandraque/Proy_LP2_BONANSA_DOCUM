DROP DATABASE IF EXISTS bd_bonansa2014;
CREATE DATABASE bd_bonansa2014;
USE bd_bonansa2014;




CREATE TABLE tb_banco
(
idBanco INT AUTO_INCREMENT PRIMARY KEY,
nomBanco VARCHAR(50) NOT NULL
);

CREATE TABLE tb_afp
(
idAFP INT AUTO_INCREMENT PRIMARY KEY,
nomAFP VARCHAR(50)
);

CREATE TABLE ubigeo
(
codubigeo char(6) primary key,
coddpto int(2),
codprov int(2),
coddist int(2),
nombre varchar(550)
);

CREATE  TABLE tb_categoriavehiculo
(
idCategoriaVeh INT AUTO_INCREMENT PRIMARY KEY,
descCategoriaVeh VARCHAR(5) NOT NULL
);



CREATE TABLE tb_claselicencia_conductor
(
idClaselic INT AUTO_INCREMENT PRIMARY KEY,
descClaselic VARCHAR(15) NOT NULL
);

CREATE TABLE tb_categorialicencia_conductor
(
idCategorialic INT AUTO_INCREMENT PRIMARY KEY,
descCategorialic VARCHAR(15) NOT NULL
);

CREATE TABLE tb_cargo_empleado
(
idCargoEmpleado INT AUTO_INCREMENT PRIMARY KEY,
nomCargo VARCHAR(50)
);

-- (Grt, grc, factura)
CREATE TABLE tipodocumento
(
idTipoDoc INT AUTO_INCREMENT primary key, 
descTipoDoc VARCHAR(30) NOT NULL
);


CREATE TABLE tb_usuarios_sistema
(
idUsuario char(10)PRIMARY KEY,
idCargoEmpleado int,
usuUsuario VARCHAR(30),
claveUsuario VARCHAR(30)
);
alter table tb_usuarios_sistema add  FOREIGN KEY(idCargoEmpleado) REFERENCES tb_cargo_empleado(idCargoEmpleado);