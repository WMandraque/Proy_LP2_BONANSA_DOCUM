
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

call validarUsuario('USU1','123456789');

