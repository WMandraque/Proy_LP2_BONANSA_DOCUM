
use bd_bonansa2014;

DROP FUNCTION if exists CalcularIdUsuario;
DELIMITER $$
CREATE FUNCTION CalcularIdUsuario()-- -- Retornara el codigo del cliente convertido
Returns CHAR(7)
begin
	Declare cantidadUsuario  INT;
	Declare idUsuarioAumentado INTEGER;
	Declare idUsuarioConvertido Char(7);
	
	Set cantidadUsuario=CONCAT((select count(*) from tb_usuario));
if cantidadUsuario=0 then 
	set idUsuarioConvertido=CONCAT('USU',1);
	return idUsuarioConvertido;
end if;
	set idUsuarioAumentado=cantidadUsuario+1;
	set idUsuarioConvertido=CONCAT('USU',idUsuarioAumentado);
	return idUsuarioConvertido;
end;
$$
Delimiter ;


DROP FUNCTION if exists CalcularIdEmpleado;
DELIMITER $$
CREATE FUNCTION CalcularIdEmpleado()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
	Declare cantidadEmpleado  INT;
	Declare idEmpleadoAumentado INTEGER;
	Declare idEmpleadoConvertido Char(10);
	
	Set cantidadEmpleado=CONCAT((select count(*) from tb_empleado));
if cantidadEmpleado=0 then
	set idEmpleadoConvertido=CONCAT('EMP',1);
	return idEmpleadoConvertido;
end if;
	set idEmpleadoAumentado=cantidadEmpleado+1;
	set idEmpleadoConvertido=CONCAT('EMP', idEmpleadoAumentado);
	return idEmpleadoConvertido;
end;
$$
Delimiter ;

DROP FUNCTION if exists CalcularIdCliente;
DELIMITER $$
CREATE FUNCTION CalcularIdCliente()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
	Declare cantidadCliente  INT;
	Declare idClienteAumentado INTEGER;
	Declare idClienteConvertido Char(10);
	
	Set cantidadCliente=CONCAT((select count(*) from tb_Cliente));
if cantidadCliente=0 then
	set idClienteConvertido=CONCAT('CLI',1);
	return idClienteConvertido;
end if;
	set idClienteAumentado=cantidadCliente+1;
	set idClienteConvertido=CONCAT('CLI', idClienteAumentado);
	return idClienteConvertido;
end;
$$
Delimiter ;

DROP PROCEDURE IF EXISTS validarUsuario;
DELIMITER $$
CREATE PROCEDURE validarUsuario(idUsuario char(7), claveUsuario varchar(30))
begin
      select*from tb_usuario as u where u.idUsuario=idUsuario and u.claveUsuario=claveUsuario;
END$$
Delimiter ;


DROP PROCEDURE IF EXISTS registrarLog;
DELIMITER //
CREATE PROCEDURE registrarLog( usuario VARCHAR(10), descripcion VARCHAR(100), tipo VARCHAR(45))
begin
      insert into tb_logGeneral(usuario, descripcion, tipo, fecha, hora) values(usuario, descripcion, tipo, curdate(), curtime());
END //
Delimiter ;




DROP PROCEDURE IF EXISTS usp_registrarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_registrarEmpleado
(
p_idTipoEmpleado INT,
p_idTipoDocId int,
p_numDocumento char(9),
p_nomEmpleado VARCHAR(100),
p_apepaEmpleado VARCHAR(100),
p_apemaEmpleado VARCHAR(100),
p_sexoEmpleado VARCHAR(1),
p_fecnacEmpleado DATE,
p_domicilioEmpleado VARCHAR(200),
p_ubigeoEmpleado VARCHAR(6),
p_fonoEmpleado VARCHAR(9),
p_celularEmpleado VARCHAR(11),
p_emailEmpleado VARCHAR(100),
p_idBanco INT,
p_numCuentaAhorroEmpleado VARCHAR(30),
p_idAFP INT,
p_numAFPEmpleado VARCHAR(30),
p_fotoEmpleado VARCHAR(10),

-- Usuario quien registra
p_Usuario varchar(10)
)
BEGIN


Declare idEmpleadoAutogenerado Char(10);
SET     idEmpleadoAutogenerado=CalcularIdEmpleado();


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
idEmpleadoAutogenerado, 
p_idTipoEmpleado,
p_idTipoDocId,
p_numDocumento,
p_nomEmpleado,
p_apepaEmpleado,
p_apemaEmpleado,
p_sexoEmpleado,
p_fecnacEmpleado,
p_domicilioEmpleado,
p_ubigeoEmpleado,
p_fonoEmpleado,
p_celularEmpleado,
p_emailEmpleado,
p_idBanco,
p_numCuentaAhorroEmpleado,
p_idAFP,
p_numAFPEmpleado,
p_fotoEmpleado
);
insert into tb_logGeneral(usuario, descripcion, tipo, fecha, hora) values(p_Usuario, CONCAT("Empleado registrado: ",idEmpleadoAutogenerado), "INSERT", curdate(), curtime());
END //
Delimiter ;


call usp_registrarEmpleado 
( 
'2', 
'1', 
'47084553', 
'Abuelita', 
'changarro', 
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
null,
'USUO1'
);

select*from tb_empleado;
select*from tb_logGeneral;




DROP PROCEDURE IF EXISTS usp_actualizarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_actualizarEmpleado
(
p_idEmpleado char(10),
p_idTipoEmpleado INT,
p_idTipoDocId int,
p_numDocumento char(9),
p_nomEmpleado VARCHAR(100),
p_apepaEmpleado VARCHAR(100),
p_apemaEmpleado VARCHAR(100),
p_sexoEmpleado VARCHAR(1),
p_fecnacEmpleado DATE,
p_domicilioEmpleado VARCHAR(200),
p_ubigeoEmpleado VARCHAR(6),
p_fonoEmpleado VARCHAR(9),
p_celularEmpleado VARCHAR(11),
p_emailEmpleado VARCHAR(100),
p_idBanco INT,
p_numCuentaAhorroEmpleado VARCHAR(30),
p_idAFP INT,
p_numAFPEmpleado VARCHAR(30),
p_fotoEmpleado VARCHAR(10),

-- Usuario quien registra
p_Usuario varchar(10)
)
BEGIN

UPDATE tb_empleado set

idTipoEmpleado=p_idTipoEmpleado, 
idTipoDocId=p_idTipoDocId, 
numDocumento=p_numDocumento, 
nomEmpleado=p_nomEmpleado, 
apepaEmpleado=p_apepaEmpleado, 
apemaEmpleado=p_apemaEmpleado,
sexoEmpleado=p_sexoEmpleado, 
fecnacEmpleado=p_fecnacEmpleado, 
domicilioEmpleado=p_domicilioEmpleado, 
ubigeoEmpleado=p_ubigeoEmpleado, 
fonoEmpleado=p_fonoEmpleado, 
celularEmpleado=p_celularEmpleado, 
emailEmpleado=p_emailEmpleado, 
idBanco=p_idBanco, 
numCuentaAhorroEmpleado=p_numCuentaAhorroEmpleado, 
idAFP=p_idAFP, 
numAFPEmpleado=p_numAFPEmpleado, 
fotoEmpleado=p_fotoEmpleado
where idEmpleado=p_idEmpleado;
insert into tb_logGeneral(usuario, descripcion, tipo, fecha, hora) values(p_Usuario, CONCAT("Empleado actualizado: ",p_idEmpleado), "UPDATE", curdate(), curtime());
END //
Delimiter ;

call usp_actualizarEmpleado 
( 
'EMP17',
'2', 
'1', 
'47084553', 
'NILO', 
'changarro', 
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
null,
'USUO1'
);

select*from tb_empleado;
select*from tb_logGeneral;



DROP PROCEDURE IF EXISTS usp_eliminarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_eliminarEmpleado
(
p_idEmpleado char(10),
-- Usuario quien registra
p_Usuario varchar(10)
)
BEGIN
UPDATE tb_empleado set idEstado=0
where idEmpleado=p_idEmpleado;
insert into tb_logGeneral(usuario, descripcion, tipo, fecha, hora) values(p_Usuario, CONCAT("Empleado eliminado: ",p_idEmpleado), "DELETE", curdate(), curtime());
END //
Delimiter ;


call usp_eliminarEmpleado('XX', 'USU01');

select*from tb_empleado;
select*from tb_logGeneral;


DROP PROCEDURE IF EXISTS usp_registrarCliente;
DELIMITER //
CREATE PROCEDURE usp_registrarCliente
(
p_idTipoCliente INT,
p_nomCliente VARCHAR(60),
p_apePatCliente VARCHAR(60),
p_apeMatCliente VARCHAR(60),
p_fecNacCliente DATE,
p_sexoCliente VARCHAR(1),
p_telefonoCliente VARCHAR(9),
p_celularCliente VARCHAR(11),
p_correoCliente VARCHAR(60),

p_usuario varchar(7)
)
begin
   declare idClienteAuto char(10);
   set     idClienteAuto=CalcularIdCliente();
insert into tb_cliente
(
idCliente,
idTipoCliente,
nomCliente,
apePatCliente,
apeMatCliente,
fecNacCliente ,
sexoCliente,
telefonoCliente,
celularCliente,
correoCliente
)
value(
CalcularIdCliente(),
p_idTipoCliente,
p_nomCliente,
p_apePatCliente,
p_apeMatCliente,
p_fecNacCliente,
p_sexoCliente,
p_telefonoCliente,
p_celularCliente,
p_correoCliente
);
insert into tb_logGeneral(usuario, descripcion, tipo, fecha, hora) values(p_Usuario, CONCAT("Cliente registrado: ",idClienteAuto), "INSERT", curdate(), curtime());
END //
Delimiter ;


call usp_registrarCliente
(
'1',
'Marco',
'Garcia',
'Altamirano',
'1990-12-12',
'M',
'1234567',
'123456789',
'luis@gmail.com',
'USU09'
);

select*from tb_cliente;
select*from tb_logGeneral;

