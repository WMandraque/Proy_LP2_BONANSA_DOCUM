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






