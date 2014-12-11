use bd_bonansa2014;


INSERT INTO tb_estado VALUES ('1', 'ACTIVO'), ('0','INACTIVO');
select*From tb_estado;


INSERT INTO tb_estadoTrabajo VALUES ('1', 'OCUPADO'), ('0','DESOCUPADO');
Select*from tb_estadoTrabajo;

INSERT INTO tb_banco(nomBanco) VALUES ('Sin Asignar'),('Banco Azteca'),('Banco de Credito del Peru'),('Banco de Comercio'), ('Banco de la Nacion'), 
('Banco del Trabajo'),('Banco Falabella'), ('Banco Financiero'), ('BanBif'), ('Banco Ripley'), ('Banco Continental'), 
('Citibank'), ('HSBC'), ('Interbank'), ('ICBC'), ('MiBanco'), ('Scotiabank');
SELECT * FROM tb_banco;




INSERT INTO tb_afp(nomAFP) VALUES ('Sin Asignar'),('AFP Integra'),('AFP Prima'),('AFP Profuturo'),('AFP Habitat'),('AFP Horizonte'),('ONP');
SELECT * FROM tb_afp;


INSERT INTO tb_categorialicencia_conductor VALUES (NULL,'Sin Asignar');
INSERT INTO tb_categorialicencia_conductor VALUES (NULL,'IB');
INSERT INTO tb_categorialicencia_conductor VALUES (NULL,'IIB');
INSERT INTO tb_categorialicencia_conductor VALUES (NULL,'IIIB');
SELECT * FROM tb_categorialicencia_conductor;




INSERT INTO tb_claselicencia_conductor VALUES (NULL,'Sin Asignar');
INSERT INTO tb_claselicencia_conductor VALUES (NULL,'A');
INSERT INTO tb_claselicencia_conductor VALUES (NULL,'B');
INSERT INTO tb_claselicencia_conductor VALUES (NULL,'C');
SELECT * FROM tb_claselicencia_conductor;


INSERT INTO tb_categoriavehiculo (`idCategoriaVeh`, `descCategoriaVeh`) VALUES ('1', 'N1');
INSERT INTO tb_categoriavehiculo (`idCategoriaVeh`, `descCategoriaVeh`) VALUES ('2', 'N2');
INSERT INTO tb_categoriavehiculo (`idCategoriaVeh`, `descCategoriaVeh`) VALUES ('3', 'N3');
select*From tb_categoriavehiculo;



INSERT INTO tb_tipo_cliente(descTipoCliente) values ('JURIDICO'), ('NATURAL'); 
select*From tb_tipo_cliente;

INSERT INTO tb_tipo_empleado(nomCargo) values ('ADMINISTRADOR'), ('REPCECIONISTA'),('CONDUCTOR'),('ESTIBADOR');
SELECT*FROM tb_tipo_empleado;


INSERT INTO tb_tipo_documento_identificacion (descTipoDoc) VALUES ('DNI');
INSERT INTO tb_tipo_documento_identificacion (descTipoDoc) VALUES ('RUC');
SELECT*FROM tb_tipo_documento_identificacion;




INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES(NULL,'Sin Asignar','Sin Asignar');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('00','DOMICILIO FISCAL','DOMICILIO FISCAL');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('01','CASA MATRIZ','C. MATRIZ');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('02','SUCURSAL','SUCURSAL');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('03','AGENCIA','AGENCIA');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('04','LOCAL COMERCIAL O DE SERVICIOS','L. COMERCIAL');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('05','SEDE PRODUCTIVA','S.PRODUCTIVA');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('06','DEPOSITO (ALMACÉN)','DEPOSITO');
INSERT INTO tb_tipoestablecimiento(numSunatTipoEstablec,descTipoEstablec,descWebServiceSunatTipoEstablec) VALUES('07','OFICINA ADMINISTRATIVA','OF.ADMINIST.');
select*From tb_tipoestablecimiento;







INSERT INTO tb_empleado
(
idEmpleado,
idTipoEmpleado, 
idTipoDocId, 
numDocumento, 
nomEmpleado, 
apepaEmpleado, 
apemaEmpleado,
sexoEmpleado, 
fecnacEmpleado, 
domicilioEmpleado, 
ubigeoEmpleado, 
fonoEmpleado, 
celularEmpleado, 
emailEmpleado, 
idBanco, 
numCuentaAhorroEmpleado, 
idAFP, 
numAFPEmpleado, 
fotoEmpleado
)
VALUES 
(
CalcularIdEmpleado(), 
'1', 
'1', 
'47084553', 
'Carlos', 
'Bonilla', 
'Celiz', 
'H', 
'1980/07/08', 
'Los rosales 325', 
'1231', 
'6788767', 
'99887865679', 
'admin@bonansa.com', 
'1', 
'123456789012345678901234567890', 
'1', 
'123456789012345678901234567890',
null
);
INSERT INTO tb_empleado
(
idEmpleado,
idTipoEmpleado, 
idTipoDocId, 
numDocumento, 
nomEmpleado, 
apepaEmpleado, 
apemaEmpleado,
sexoEmpleado, 
fecnacEmpleado, 
domicilioEmpleado, 
ubigeoEmpleado, 
fonoEmpleado, 
celularEmpleado, 
emailEmpleado, 
idBanco, 
numCuentaAhorroEmpleado, 
idAFP, 
numAFPEmpleado, 
fotoEmpleado
)
VALUES 
(
CalcularIdEmpleado(), 
'2', 
'1', 
'47084553', 
'Sebastian', 
'Paraguay', 
'Barzola', 
'H', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'sebastian@bonansa.com', 
'1', 
'123456789012345678901234567890', 
'1', 
'123456789012345678901234567890',
null
);
INSERT INTO tb_empleado
(
idEmpleado,
idTipoEmpleado, 
idTipoDocId, 
numDocumento, 
nomEmpleado, 
apepaEmpleado, 
apemaEmpleado,
sexoEmpleado, 
fecnacEmpleado, 
domicilioEmpleado, 
ubigeoEmpleado, 
fonoEmpleado, 
celularEmpleado, 
emailEmpleado, 
idBanco, 
numCuentaAhorroEmpleado, 
idAFP, 
numAFPEmpleado, 
fotoEmpleado
)
VALUES 
(
CalcularIdEmpleado(), 
'4', 
'1', 
'47084553', 
'Reynaldo', 
'Lazo', 
'Palomino', 
'H', 
'1980/07/08', 
'Tacora 325', 
'1231', 
'6788767', 
'99887865679', 
'renaldo@bonansa.com', 
'1', 
'123456789012345678901234567890', 
'1', 
'123456789012345678901234567890',
null
);
INSERT INTO tb_empleado
(
idEmpleado,
idTipoEmpleado, 
idTipoDocId, 
numDocumento, 
nomEmpleado, 
apepaEmpleado, 
apemaEmpleado,
sexoEmpleado, 
fecnacEmpleado, 
domicilioEmpleado, 
ubigeoEmpleado, 
fonoEmpleado, 
celularEmpleado, 
emailEmpleado, 
idBanco, 
numCuentaAhorroEmpleado, 
idAFP, 
numAFPEmpleado, 
fotoEmpleado
)
VALUES 
(
CalcularIdEmpleado(), 
'3', 
'1', 
'47084553', 
'Jeyser', 
'Suxe', 
'Balbim', 
'H', 
'1980/07/08', 
'Calandrias 234', 
'1231', 
'6788767', 
'99887865679', 
'jeyser@bonansa.com', 
'1', 
'123456789012345678901234567890', 
'1', 
'123456789012345678901234567890',
null
);
insert into tb_empleado_conductor
(
idEmpleado,
licenCondEmpleado,
idClaselic,
idCategorialic
)
VALUES('EMP4', '123456789', '1', '1');

select*from tb_empleado as e inner join tb_tipo_empleado as te
on e.idTipoEmpleado=te.idTipoEmpleado;


INSERT INTO tb_usuario
(
idEmpleado,
idUsuario,
claveUsuario,
idTipoEmpleado
)
values('EMP1', CalcularIdUsuario(), '123456789', '1');
INSERT INTO tb_usuario
(
idEmpleado,
idUsuario,
claveUsuario,
idTipoEmpleado
)
values('EMP2', CalcularIdUsuario(), '123456789', '2');
INSERT INTO tb_usuario
(
idEmpleado,
idUsuario,
claveUsuario,
idTipoEmpleado
)
values('EMP4', CalcularIdUsuario(), '123456789', '3');
SELECT*FROM tb_usuario as u inner join tb_tipo_empleado as e
on u.idTipoEmpleado=e.idTipoEmpleado;


INSERT INTO tb_cliente
(
idCliente,
idTipoCliente,
nomCliente,
apePatCliente,
apeMatCliente,
fecNacCliente,
sexoCliente,
telefonoCliente,
celularCliente,
correoCliente
)
values
(
calcularIdCliente(),
'1',
'Luis',
'Garcia',
'Altamirano',
'1990-12-12',
'M',
'1234567',
'123456789',
'luis@gmail.com'
);
INSERT INTO tb_cliente
(
idCliente,
idTipoCliente,
nomCliente,
apePatCliente,
apeMatCliente,
fecNacCliente,
sexoCliente,
telefonoCliente,
celularCliente,
correoCliente
)
values
(
calcularIdCliente(),
'2',
'Juan',
'Vargas',
'Torres',
'1980-12-12',
'M',
'1234567',
'123456789',
'juan@gmail.com'
);

SELECT c.*, tc.descTipoCliente FROM tb_cliente as c inner join tb_tipo_cliente as tc
on c.idTipoCliente=tc.idTipoCliente;



