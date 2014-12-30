DROP DATABASE IF EXISTS bd_bonansa2014;
CREATE DATABASE bd_bonansa2014;
USE bd_bonansa2014;


-- Para eliminar entidades
drop table if exists tb_estado;
CREATE TABLE tb_estado
(
idEstado char(1) primary key,
descEstado VARCHAR(50) NOT NULL
);



drop table if exists tb_estadoTrabajo;
CREATE TABLE tb_estadoTrabajo
(
idEstadoTrabajo char(1) primary key,
descEstado VARCHAR(50) NOT NULL
);

drop table if exists tb_categoriavehiculo;
CREATE  TABLE tb_categoriavehiculo
(
idCategoriaVeh INT AUTO_INCREMENT PRIMARY KEY,
descCategoriaVeh VARCHAR(5) NOT NULL
);

drop table if exists tb_ubigeo;
CREATE TABLE tb_ubigeo
(
codubigeo char(6) primary key,
coddpto int(2),
codprov int(2),
coddist int(2),
nombre varchar(550)
);


drop table if exists tb_tipoestablecimiento;
CREATE TABLE tb_tipoestablecimiento
(
idTipoEstablec INT AUTO_INCREMENT PRIMARY KEY,
numSunatTipoEstablec VARCHAR(2),
descTipoEstablec VARCHAR(30) NOT NULL,
descWebServiceSunatTipoEstablec VARCHAR(30) NOT NULL
);



drop table if exists tb_claselicencia_conductor;
CREATE TABLE tb_claselicencia_conductor
(
idClaselic INT AUTO_INCREMENT PRIMARY KEY,
descClaselic VARCHAR(15) NOT NULL
);

drop table if exists tb_categorialicencia_conductor;
CREATE TABLE tb_categorialicencia_conductor
(
idCategorialic INT AUTO_INCREMENT PRIMARY KEY,
descCategorialic VARCHAR(15) NOT NULL
);

drop table if exists tb_tipo_cliente;
CREATE TABLE tb_tipo_cliente
(
idTipoCliente INT AUTO_INCREMENT PRIMARY KEY,
descTipoCliente VARCHAR(50)
);

drop table if exists tb_tipo_empleado;
CREATE TABLE tb_tipo_empleado
(
idTipoEmpleado INT AUTO_INCREMENT PRIMARY KEY,
nomCargo VARCHAR(50)
);

drop table if exists tb_tipo_documento_identificacion;
CREATE TABLE tb_tipo_documento_identificacion
(
idTipoDocId INT AUTO_INCREMENT primary key, 
descTipoDoc VARCHAR(30) NOT NULL
);



drop table if exists tb_vehiculo;
CREATE TABLE tb_vehiculo
(
idVeh CHAR(7) NOT NULL,
placaVeh CHAR(20) NOT NULL,
idCategoriaVeh INT NOT NULL,
marcaVeh VARCHAR(15) NOT NULL,
modeloVeh VARCHAR(15) NOT NULL,
numAsientosVeh INT NOT NULL,
anhoFabricVeh INT NOT NULL,
numSerieMotorVeh VARCHAR(20) NOT NULL,
largoVeh DECIMAL(6,2) NOT NULL,
anchoVeh DECIMAL(6,2) NOT NULL,
alturaVeh DECIMAL(6,2) NOT NULL,
cargaBrutaVeh DECIMAL(6,2) NOT NULL,
cargaUtilVeh DECIMAL(6,2) NOT NULL,
cargaNetaVeh DECIMAL(6,2) NOT NULL,
fotoVehiculo longblob,
idEstado char(1) DEFAULT 1,
idEstadoTrabajo char(1) DEFAULT 0,
CONSTRAINT fk_tb_tb_vehiculo_tb_estadoTrabajo  FOREIGN KEY (idEstadoTrabajo)      REFERENCES tb_estadoTrabajo(idEstadoTrabajo),
CONSTRAINT fk_tb_vehiculo_tb_estado            FOREIGN KEY (idEstado)             REFERENCES tb_estado(idEstado),
CONSTRAINT fk_tb_vehiculo_tb_categoriavehiculo FOREIGN KEY (idCategoriaVeh)       REFERENCES tb_categoriavehiculo(idCategoriaVeh),
CONSTRAINT pk_tb_vehiculo PRIMARY KEY(idVeh,placaVeh)
);




-- Empleado padre
drop table if exists tb_empleado;
CREATE TABLE tb_empleado
(
idEmpleado char(7)not null PRIMARY KEY,
idTipoEmpleado INT not null,
numDocumento char(9),
nomEmpleado VARCHAR(100) NOT NULL,
apepaEmpleado VARCHAR(100) NOT NULL,
apemaEmpleado VARCHAR(100) NOT NULL,
sexoEmpleado VARCHAR(1) CHECK(sexoEmpleado IN ('M','F')),
fecnacEmpleado DATE NOT NULL,
domicilioEmpleado VARCHAR(200) NOT NULL,
ubigeoEmpleado VARCHAR(6) NOT NULL,
fonoEmpleado VARCHAR(9),
celularEmpleado VARCHAR(11),
emailEmpleado VARCHAR(100) NOT NULL,
fotoEmpleado longblob,
idEstado char(1) DEFAULT 1,
idEstadoTrabajo char(1) DEFAULT 0,
CONSTRAINT fk_tb_empleado_tb_tipo_empleado                           FOREIGN KEY(idTipoEmpleado)   REFERENCES tb_tipo_empleado (idTipoEmpleado),
CONSTRAINT fk_tb_empleado_tb_estado                                  FOREIGN KEY (idEstado)        REFERENCES tb_estado(idEstado),
CONSTRAINT fk_tb_empleado_tb_estadoTrabajo                           FOREIGN KEY (idEstadoTrabajo) REFERENCES tb_estadoTrabajo(idEstadoTrabajo)
);



-- Empleado hijo
drop table if exists tb_empleado_conductor;
CREATE TABLE tb_empleado_conductor
(
idEmpleado char(7)not null,
licenCondEmpleado CHAR(9) NOT NULL,
idClaselic INT NOT NULL,
idCategorialic INT NOT NULL,
CONSTRAINT fk_tb_empleado_conductor_tb_empleado                    FOREIGN KEY(idEmpleado)     REFERENCES tb_empleado(idEmpleado),
CONSTRAINT pk_tb_empleado_conductor PRIMARY KEY (idEmpleado, licenCondEmpleado),
CONSTRAINT fk_tb_empleado_conductor_tb_claselicencia_conductor     FOREIGN KEY(idClaselic)     REFERENCES tb_claselicencia_conductor(idClaselic),
CONSTRAINT fk_tb_empleado_conductor_tb_categorialicencia_conductor FOREIGN KEY(idCategorialic) REFERENCES tb_categorialicencia_conductor(idCategorialic)
);

drop table if exists tb_usuario;
CREATE TABLE tb_usuario
(
idEmpleado char(7) not null,
clave VARCHAR(30) not null,
idTipoEmpleado int not null,
idEstado char(1) DEFAULT 1,
CONSTRAINT fk_tb_usuario_tb_empleado FOREIGN KEY (idEmpleado) REFERENCES tb_empleado(idEmpleado),
CONSTRAINT pk_tb_usuario PRIMARY KEY(idEmpleado),
CONSTRAINT fk_tb_usuario_tb_tipo_empleado FOREIGN KEY (idTipoEmpleado) REFERENCES tb_tipo_empleado(idTipoEmpleado),
CONSTRAINT fk_tb_usuario_tb_estado_entidades FOREIGN KEY (idEstado) REFERENCES tb_estado(idEstado)
);
-- Cliente padre
drop table if exists tb_cliente;
CREATE TABLE tb_cliente
(
idCliente varchar(7) primary key,
idTipoCliente int not null,
nomCliente VARCHAR(60),
apePatCliente VARCHAR(60),
apeMatCliente VARCHAR(60),
fecNacCliente DATE,
sexoCliente VARCHAR(1) CHECK(sexoCliente IN ('F','M')),
telefonoCliente VARCHAR(9),
celularCliente VARCHAR(11),
correoCliente VARCHAR(60),
numDocumento char(9) not null,
idEstado char(1) DEFAULT 1,
CONSTRAINT fk_tb_cliente_tb_tipo_cliente                FOREIGN KEY(idTipoCliente)     REFERENCES tb_tipo_cliente(idTipoCliente),
CONSTRAINT fk_tb_cliente_tb_estado_entidades            FOREIGN KEY (idEstado)         REFERENCES tb_estado(idEstado)
);




drop table if exists tb_cliente_juridico;
CREATE TABLE tb_cliente_juridico
(
idCliente varchar(7)not null,
razSocCliente VARCHAR(70)not null,
ciiuCliente VARCHAR(5)not null,
cargoContacCliente VARCHAR(50)not null,
CONSTRAINT fk_tb_cliente_juridico_tb_cliente                         FOREIGN KEY(idCliente) REFERENCES tb_cliente(idCliente),
CONSTRAINT pk_tb_cliente_juridico PRIMARY KEY(idCliente)
);




drop table if exists tb_direccionescliente;
CREATE TABLE tb_direccionescliente
(
idDirecCliente INT AUTO_INCREMENT PRIMARY KEY,
idCliente varchar(7) NOT NULL,
direcDirecCliente VARCHAR(200) NOT NULL,
codubigeoDirecCliente VARCHAR(6),
idTipoEstablec INT NOT NULL,
FOREIGN KEY (idCliente)      REFERENCES tb_cliente(idCliente),
CONSTRAINT fk_tb_direccionescliente_tb_tipoestablecimiento     FOREIGN KEY (idTipoEstablec) REFERENCES tb_tipoestablecimiento(idTipoEstablec)
);


drop table if exists tb_ordenRecojo;
CREATE TABLE tb_ordenRecojo
(
idOR INT AUTO_INCREMENT PRIMARY KEY,
idCliente char(7)not null,
fechaRecojo date not null,
direccionRecojo varchar(300),
horaRecojo  date not null, 
CONSTRAINT fk_tb_ordenRecojo_tb_cliente FOREIGN KEY(idCliente) REFERENCES tb_cliente(idCliente)
);


drop table if exists tb_equipoVehicular_OrdenRecojo;
CREATE TABLE tb_equipoVehicular_OrdenRecojo
(
idOR INT NOT NULL,
idVeh CHAR(10) NOT NULL,
CONSTRAINT fk_detalle_OrdenRecojo_tb_ordenRecojo FOREIGN KEY(idOR) references tb_OrdenRecojo(idOr),
CONSTRAINT fk_tb_equipoVehicular_OrdenRecojo_tb_vehiculo FOREIGN KEY(idVeh) REFERENCES tb_vehiculo(idVeh),
CONSTRAINT pk_tb_equipoVehicular_OrdenRecojo PRIMARY KEY(idOR, idVeh)
);

drop table if exists tb_equipoPersonal_OrdenRecojo;
CREATE TABLE tb_equipoPersonal_OrdenRecojo
(
idOR INT NOT NULL,
idEmpleado CHAR(10) NOT NULL,
CONSTRAINT fk_tb_equipoPersonal_OrdenRecojo_tb_ordenRecojo FOREIGN KEY(idOR) references tb_OrdenRecojo(idOr),
CONSTRAINT fk_tb_equipoPersonal_OrdenRecojo_tb_empleado    FOREIGN KEY(idEmpleado)     REFERENCES tb_empleado(idEmpleado),
CONSTRAINT pk_tb_equipoPersonal_OrdenRecojo PRIMARY KEY(idOR, idEmpleado)
);



drop table if exists tb_detalle_ordenRecojo;
CREATE TABLE tb_detalle_ordenRecojo
(
idOR INT NOT NULL,
numCodGR VARCHAR(30) NOT NULL,
numCodFT VARCHAR(30) NOT NULL,
descripcion varchar(200) NOT NULL,
CONSTRAINT fk_detalle_OrdenRecojo FOREIGN KEY(idOR) references tb_OrdenRecojo(idOr),
CONSTRAINT pk_tb_detalle_ordenRecojo PRIMARY KEY(idOR, numCodGR, numCodFT )
);



drop table if exists tb_GRT;
CREATE TABLE tb_GRT
(
idGRT INT PRIMARY KEY AUTO_INCREMENT,
fecInicioTraslado DATE,
idCliRemitente varchar(7) NOT NULL,
direcCliRemitente varchar(200) not null,
nomCliDestinatario varchar(100) not null,
apepaCliDestinatario varchar(100) not null,
apemaCliDestinatario varchar(100) not null,
idTipoDocId INT not null,
numDocCliDestinatario char(50) not null,
direcClienteDestinatario varchar(200) not null,
CONSTRAINT fk_tb_GRT_tb_cliente  FOREIGN KEY (idCliRemitente) REFERENCES tb_cliente(idCliente),
CONSTRAINT fk_tb_GRT_idTipoDocId FOREIGN KEY (idTipoDocId)    REFERENCES tb_tipo_documento_identificacion(idTipoDocId)
);

drop table if exists tb_GRT_equipoVehiculo;
create table tb_GRT_equipoVehiculo
(
idGRT INT NOT NULL,
idVeh CHAR(7) NOT NULL,
placaVeh CHAR(10) NOT NULL,
CONSTRAINT fk_tb_GRT_equipoVehiculo_tb_GRT FOREIGN KEY(idGRT)                      REFERENCES tb_GRT(idGRT),
CONSTRAINT fk_tb_GRT_equipoVehiculo_tb_equipoVehiculo FOREIGN KEY(idVeh,placaVeh)        REFERENCES tb_vehiculo(idVeh,placaVeh)
);


drop table if exists tb_GRT_equipoPersonal;
create table tb_GRT_equipoPersonal
(
idGRT INT NOT NULL,
idEmpleado CHAR(7) NOT NULL,
CONSTRAINT fk_tb_GRT_equipoPersonal_tb_GRT FOREIGN KEY(idGRT) REFERENCES tb_GRT(idGRT),
CONSTRAINT fk_tb_GRT_equipoPersonal_tb_empleado FOREIGN KEY(idEmpleado) REFERENCES tb_empleado(idEmpleado)
);


drop table if exists tb_detalle_GRT;
CREATE TABLE tb_detalle_GRT
(
idGRT INT,
numCodGR VARCHAR(30),
numCodFT VARCHAR(30),
descTraslado VARCHAR(30),
cantidad INT,
unidadMedida VARCHAR(30),
pesoKg DECIMAL(18,6),
fecMinEntrega DATE,
fecMaxEntrega DATE,
CONSTRAINT fk_tb_detalle_GRT_tb_GRT  FOREIGN KEY (idGRT) REFERENCES tb_GRT(idGRT),
CONSTRAINT pk_detalle_GRT PRIMARY KEY(idGRT, numCodGR, numCodFT)
);

drop table if exists tb_logGeneral;
CREATE  TABLE tb_logGeneral
(
  codigo INT NOT NULL AUTO_INCREMENT ,
  usuario VARCHAR(45) NOT NULL ,
  descripcion VARCHAR(100) NOT NULL ,
  tipo VARCHAR(45) NOT NULL ,
  fecha DATE NOT NULL ,
  hora TIME NOT NULL ,
  PRIMARY KEY (codigo) 
);


