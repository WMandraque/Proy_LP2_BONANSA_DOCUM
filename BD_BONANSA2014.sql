DROP DATABASE IF EXISTS bd_bonansa2014;
CREATE DATABASE bd_bonansa2014;
USE bd_bonansa2014;


-- Para eliminar entidades
CREATE TABLE tb_estado_entidades
(
idEstado char(1) primary key,
descEstado VARCHAR(50) NOT NULL
);


CREATE  TABLE tb_categoriavehiculo
(
idCategoriaVeh INT AUTO_INCREMENT PRIMARY KEY,
descCategoriaVeh VARCHAR(5) NOT NULL
);



CREATE TABLE tb_banco
(
idBanco INT AUTO_INCREMENT PRIMARY KEY,
nomBanco VARCHAR(50) NOT NULL,
idEstado char(1)
);
alter table tb_banco add foreign key(idEstado)references tb_estado_entidades(idEstado);



CREATE TABLE tb_afp
(
idAFP INT AUTO_INCREMENT PRIMARY KEY,
nomAFP VARCHAR(50) NOT NULL,
idEstado char(1)
);
alter table tb_afp add foreign key(idEstado)references tb_estado_entidades(idEstado);


CREATE TABLE ubigeo
(
codubigeo char(6) primary key,
coddpto int(2),
codprov int(2),
coddist int(2),
nombre varchar(550)
);


CREATE TABLE tb_tipoestablecimiento
(
idTipoEstablec INT AUTO_INCREMENT,
numSunatTipoEstablec VARCHAR(2),
descTipoEstablec VARCHAR(30) NOT NULL,
descWebServiceSunatTipoEstablec VARCHAR(30) NOT NULL,
CONSTRAINT pk_tb_tipoestablecimiento PRIMARY KEY (idTipoEstablec)
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


CREATE TABLE tb_tipo_cliente
(
idTipoCliente INT AUTO_INCREMENT PRIMARY KEY,
descTipoCliente VARCHAR(50)
);


CREATE TABLE tb_tipo_empleado
(
idTipoEmpleado INT AUTO_INCREMENT PRIMARY KEY,
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
idTipoEmpleado int,
usuUsuario VARCHAR(30),
claveUsuario VARCHAR(30),
idEstado char(1)
);
alter table tb_usuarios_sistema add  FOREIGN KEY(idTipoEmpleado) REFERENCES tb_tipo_empleado(idTipoEmpleado);



CREATE TABLE tb_vehiculo(
idVeh VARCHAR(100) PRIMARY KEY,
placaVeh VARCHAR(10) NOT NULL,
idCategoriaVeh INT NOT NULL,
marcaVeh VARCHAR(15) NOT NULL,
modeloVeh VARCHAR(15) NOT NULL,
numAsientosVeh INT NOT NULL,
numPasajerosVeh INT NOT NULL,
anhoFabricVeh INT NOT NULL,
numSerieMotorVeh VARCHAR(20) NOT NULL,
nomFotoVeh VARCHAR(10),
largoVeh DECIMAL NOT NULL,
anchoVeh DECIMAL NOT NULL,
alturaVeh DECIMAL NOT NULL,
cargaBrutaVeh DECIMAL NOT NULL,
cargaUtilVeh DECIMAL NOT NULL,
cargaNetaVeh DECIMAL NOT NULL,
numPolizaSOATVeh VARCHAR(15) NOT NULL,
fecVigenciaInicSOATVeh DATE NOT NULL,
fecVigenciaFinSOATVeh DATE NOT NULL,
numPolizaOM1227Veh VARCHAR(15) NOT NULL,
fecVigenciaInicOM1227Veh DATE NOT NULL,
fecVigenciaFinOM1227Veh DATE NOT NULL,
largoFurgonVeh DECIMAL NOT NULL,
anchoFurgonVeh DECIMAL NOT NULL,
alturaFurgonVeh DECIMAL NOT NULL
);
alter table tb_vehiculo ADD FOREIGN KEY (idCategoriaVeh) REFERENCES tb_categoriavehiculo(idCategoriaVeh);



-- Empleado padre
CREATE TABLE tb_empleado
(
idEmpleado char(10)not null PRIMARY KEY,
idTipoEmpleado INT not null,
dniEmpleado VARCHAR(8) UNIQUE NOT NULL,
nomEmpleado VARCHAR(100) NOT NULL,
apepatEmpleado VARCHAR(100) NOT NULL,
apematEmpleado VARCHAR(100) NOT NULL,
sexoEmpleado VARCHAR(1) CHECK(sexoEmpleado IN ('M','F')),
fecnacEmpleado DATE NOT NULL,
domicilioEmpleado VARCHAR(200) NOT NULL,
ubigeoEmpleado VARCHAR(6) NOT NULL,
telefonoEmpleado VARCHAR(9),
celularEmpleado VARCHAR(11),
correoEmpleado VARCHAR(100) NOT NULL,
codigoSeguroEmpleado VARCHAR(20),
idBanco INT NOT NULL,
numCuentaAhorroEmpleado VARCHAR(30),
idAFP INT NOT NULL,
numAFPEmpleado VARCHAR(30),
nomFotoEmpleado VARCHAR(10),
idEstado char(1)
);
alter table tb_empleado add FOREIGN KEY(idTipoEmpleado)      REFERENCES tb_tipo_empleado (idTipoEmpleado);
alter table tb_empleado add FOREIGN KEY (idAFP)              REFERENCES tb_afp(idAFP);
alter table tb_empleado add FOREIGN KEY (idBanco)            REFERENCES tb_banco(idBanco);
alter table tb_empleado add foreign key(idEstado)            References tb_estado_entidades(idEstado);


-- Empleado hijo
CREATE TABLE tb_empleado_conductor
(
idEmpleado char(10)not null,
licenCondEmpleado VARCHAR(9),
idClaselic INT NOT NULL,
idCategorialic INT NOT NULL
);

alter table tb_empleado_conductor add FOREIGN KEY (idEmpleado)      REFERENCES tb_empleado(idEmpleado);
alter table tb_empleado_conductor add primary key(idEmpleado);
alter table tb_empleado_conductor add FOREIGN KEY (idClaselic)      REFERENCES tb_claselicencia_conductor(idClaselic);
alter table tb_empleado_conductor add FOREIGN KEY (idCategorialic)  REFERENCES tb_categorialicencia_conductor(idCategorialic);




-- Cliente padre
CREATE TABLE tb_cliente
(
idCliente varchar(10) primary key,
idTipoCliente int not null,
nomCliente VARCHAR(60),
apePatCliente VARCHAR(60),
apeMatCliente VARCHAR(60),
fecNacCliente DATE,
sexoCliente VARCHAR(1) CHECK(sexoCliente IN ('F','M')),
telefonoCliente VARCHAR(9),
celularCliente VARCHAR(11),
correoCliente VARCHAR(60)
);
alter table tb_cliente add foreign key(idTipoCliente) References tb_tipo_cliente(idTipoCliente);




CREATE TABLE tb_cliente_natural(
idCliente varchar(10)not null,
dniCliente VARCHAR(8)
);
alter table tb_cliente_natural add FOREIGN KEY (idCliente)      REFERENCES tb_cliente(idCliente);
alter table tb_cliente_natural add primary key(idCliente);




CREATE TABLE tb_cliente_juridico
(
idCliente varchar(10)not null,
rucCliente VARCHAR(11)not null,
razSocCliente VARCHAR(70)not null,
ciiuCliente VARCHAR(5)not null,
cargoContacCliente VARCHAR(50)not null
);
alter table tb_cliente_juridico add FOREIGN KEY (idCliente)      REFERENCES tb_cliente(idCliente);
alter table tb_cliente_juridico add primary key(idCliente);



drop table if exists tb_direccionescliente;
CREATE TABLE tb_direccionescliente
(
idDirecCliente INT AUTO_INCREMENT PRIMARY KEY,
idCliente varchar(10) NOT NULL,
direcDirecCliente VARCHAR(200) NOT NULL,
codubigeoDirecCliente VARCHAR(6),
idTipoEstablec INT NOT NULL
);

ALTER TABLE tb_direccionescliente ADD FOREIGN KEY (idTipoEstablec) REFERENCES tb_tipoestablecimiento(idTipoEstablec);
ALTER TABLE tb_direccionescliente ADD FOREIGN KEY (idCliente)      REFERENCES tb_cliente(idCliente);