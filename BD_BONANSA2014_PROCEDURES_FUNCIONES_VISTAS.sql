
USE bd_bonansa2014;


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

DROP FUNCTION if exists CalcularIdVehiculo;
DELIMITER $$
CREATE FUNCTION CalcularIdVehiculo()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
	Declare cantidadVehiculo  INT;
	Declare idVehiculoAumentado INTEGER;
	Declare idVehiculoConvertido Char(7);
	
	Set cantidadVehiculo=CONCAT((select count(*) from tb_vehiculo));
if cantidadVehiculo=0 then
	set idVehiculoConvertido=CONCAT('VEH',1);
	return idVehiculoConvertido;
end if;
	set idVehiculoAumentado=cantidadVehiculo+1;
	set idVehiculoConvertido=CONCAT('VEH', idVehiculoAumentado);
	return idVehiculoConvertido;
end;
$$
Delimiter ;

DROP PROCEDURE IF EXISTS registrarLog;
DELIMITER //
CREATE PROCEDURE registrarLog( usuario VARCHAR(10), descripcion VARCHAR(100), tipo VARCHAR(45))
begin
      insert into tb_logGeneral(usuario, descripcion, tipo, fecha, hora) values(usuario, descripcion, tipo, curdate(), curtime());
END //
Delimiter ;

DROP PROCEDURE IF EXISTS validarEmpleado;
DELIMITER $$
CREATE PROCEDURE validarEmpleado
(
ip_idEmpleado char(7), 
ip_clave varchar(30),
INOUT op_idEmpleado char(7)
)
begin
      select u.*, e.nomEmpleado, e.apepaEmpleado, e.apemaEmpleado, te.nomCargo from 
      tb_usuario as u inner join tb_empleado as e
      on u.idEmpleado=e.idEmpleado
	  inner join tb_tipo_empleado as te
      on u.idTipoEmpleado=te.idTipoEmpleado
      where u.idEmpleado=ip_idEmpleado and u.clave=ip_clave;

	 set op_idEmpleado=concat((SELECT u.idEmpleado FROM tb_usuario as u where u.idEmpleado=ip_idEmpleado and u.clave=ip_clave));


END$$
Delimiter ;



-- SP Para reistrar vehiculo
DROP PROCEDURE IF EXISTS usp_registrarVehiculo;
DELIMITER $$
CREATE PROCEDURE usp_registrarVehiculo
(
ip_placaVeh CHAR(20),
ip_idCategoriaVeh INT,
ip_marcaVeh VARCHAR(15),
ip_modeloVeh VARCHAR(15),
ip_numAsientosVeh INT,
ip_numPasajerosVeh INT,
ip_anhoFabricVeh INT,
ip_numSerieMotorVeh VARCHAR(20),
ip_largoVeh DECIMAL(6,2),
ip_anchoVeh DECIMAL(6,2),
ip_alturaVeh DECIMAL(6,2),
ip_cargaBrutaVeh DECIMAL(6,2),
ip_cargaUtilVeh DECIMAL(6,2),
ip_cargaNetaVeh DECIMAL(6,2),

-- empleado quien registra
ip_idEmpleado char(7)
)
begin
    
	declare idVehiculoAuto char(7);
    set     idVehiculoAuto=CalcularIdVehiculo();
  
    START TRANSACTION;
		insert into tb_vehiculo
		(
		idVeh,
		placaVeh,
		idCategoriaVeh,
		marcaVeh,
		modeloVeh,
		numAsientosVeh,
		numPasajerosVeh,
		anhoFabricVeh,
		numSerieMotorVeh,
		largoVeh,
		anchoVeh,
		alturaVeh,
		cargaBrutaVeh,
		cargaUtilVeh,
		cargaNetaVeh
		) 
		values
		(
		idVehiculoAuto,
		ip_placaVeh,
		ip_idCategoriaVeh,
		ip_marcaVeh,
		ip_modeloVeh,
		ip_numAsientosVeh,
		ip_numPasajerosVeh,
		ip_anhoFabricVeh,
		ip_numSerieMotorVeh,
		ip_largoVeh,
		ip_anchoVeh,
		ip_alturaVeh,
		ip_cargaBrutaVeh,
		ip_cargaUtilVeh,
		ip_cargaNetaVeh
		);
		call registrarLog(ip_idEmpleado, CONCAT("Vehiculo registrado: ",idVehiculoAuto), "INSERT");
   commit;
END$$
Delimiter ;



CALL usp_registrarVehiculo
(
'PERU-B1L-949',
1,
'Hyundai',
'H100',
2,
2,
2005,
'13425684',
7,
2.30,
3.48,
3510,
1645,
1865,
'EMP1'
);

CALL usp_registrarVehiculo
(
'PERU-F6P-757',
1,
'Jmc',
'Carryng CWB',
2,
2,
2007,
'65678965',
5.20,
1.85,
2.95,
3500,
1150,
2350,
'EMP1'
);

CALL usp_registrarVehiculo
(
'PERU-C8G-921',
1,
'Hyundai',
'H-167',
3,
3,
2011,
'76597564',
4795,
1740,
1965,
3490,
1750,
2350,
'EMP1'
);

select*from tb_vehiculo;
select*from tb_logGeneral;



DROP PROCEDURE IF EXISTS usp_registrarUsuario;
DELIMITER $$
CREATE PROCEDURE usp_registrarUsuario
(
ip_idEmpleado char(7),
ip_clave VARCHAR(30),
ip_idTipoEmpleado int
)
begin
	insert into tb_usuario
	(
	idEmpleado,
	clave,
	idTipoEmpleado
	) 
	values(
	ip_idEmpleado,
	ip_clave,
	ip_idTipoEmpleado
	);
END$$
Delimiter ;







DROP PROCEDURE IF EXISTS usp_registrarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_registrarEmpleado
(
ip_idTipoEmpleado int,
ip_idTipoDocId int,
ip_numDocumento char(9),
ip_nomEmpleado VARCHAR(100),
ip_apepaEmpleado VARCHAR(100),
ip_apemaEmpleado VARCHAR(100),
ip_sexoEmpleado  CHAR(1),
ip_fecnacEmpleado DATE,
ip_domicilioEmpleado VARCHAR(200),
ip_ubigeoEmpleado VARCHAR(6),
ip_fonoEmpleado VARCHAR(9),
ip_celularEmpleado VARCHAR(11),
ip_emailEmpleado VARCHAR(100),
ip_fotoEmpleado VARCHAR(10),

-- Empleado quien lo registra
ip_idEmpleado char(7)
)
BEGIN
		Declare idEmpleadoAutogenerado Char(10);
		SET     idEmpleadoAutogenerado=CalcularIdEmpleado();

	START transaction;
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
		fotoEmpleado
		)
		VALUES 
		(
		idEmpleadoAutogenerado, 
		ip_idTipoEmpleado,
		ip_idTipoDocId,
		ip_numDocumento,
		ip_nomEmpleado,
		ip_apepaEmpleado,
		ip_apemaEmpleado,
		ip_sexoEmpleado,
		ip_fecnacEmpleado,
		ip_domicilioEmpleado,
		ip_ubigeoEmpleado,
		ip_fonoEmpleado,
		ip_celularEmpleado,
		ip_emailEmpleado,
		ip_fotoEmpleado
		);
		call registrarLog(ip_idEmpleado, CONCAT("Empleado registrado: ",idEmpleadoAutogenerado), "INSERT");
	COMMIT;
END //
Delimiter ;


DROP PROCEDURE IF EXISTS usp_registrarEmpleadoConductor;
DELIMITER //
CREATE PROCEDURE usp_registrarEmpleadoConductor
(
ip_idTipoEmpleado int,
ip_idTipoDocId int,
ip_numDocumento char(9),
ip_nomEmpleado VARCHAR(100),
ip_apepaEmpleado VARCHAR(100),
ip_apemaEmpleado VARCHAR(100),
ip_sexoEmpleado  CHAR(1),
ip_fecnacEmpleado DATE,
ip_domicilioEmpleado VARCHAR(200),
ip_ubigeoEmpleado VARCHAR(6),
ip_fonoEmpleado VARCHAR(9),
ip_celularEmpleado VARCHAR(11),
ip_emailEmpleado VARCHAR(100),
ip_fotoEmpleado VARCHAR(10),

-- parametros de empleado chofer
ip_licenCondEmpleado CHAR(9),
ip_idClaselic int,
ip_idCategorialic int,

-- Empleado quien lo registra
ip_idEmpleado char(7)
)
BEGIN
		Declare idEmpleadoAutogenerado Char(7);
		SET     idEmpleadoAutogenerado=CalcularIdEmpleado();

	START transaction;
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
		fotoEmpleado
		)
		VALUES 
		(
		idEmpleadoAutogenerado, 
		ip_idTipoEmpleado,
		ip_idTipoDocId,
		ip_numDocumento,
		ip_nomEmpleado,
		ip_apepaEmpleado,
		ip_apemaEmpleado,
		ip_sexoEmpleado,
		ip_fecnacEmpleado,
		ip_domicilioEmpleado,
		ip_ubigeoEmpleado,
		ip_fonoEmpleado,
		ip_celularEmpleado,
		ip_emailEmpleado,
		ip_fotoEmpleado
		);
		INSERT INTO tb_empleado_conductor
		(
		idEmpleado,
		licenCondEmpleado,
		idClaselic,
		idCategorialic
		)
		VALUES 
		(
		idEmpleadoAutogenerado,
		ip_licenCondEmpleado,
		ip_idClaselic,
		ip_idCategorialic
		);
		CALL registrarLog(ip_idEmpleado, CONCAT("Empleado registrado: ",idEmpleadoAutogenerado), "INSERT");
	COMMIT;
END //
Delimiter ;


call usp_registrarEmpleado 
( 
'1', 
'1', 
'47084553', 
'Carlos', 
'Bonilla', 
'Heliz', 
'H', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'bonilla@bonansa.com', 
null,
'ADMI'
);



call usp_registrarEmpleado 
( 
'2', 
'1', 
'47084553', 
'Tarja', 
'Paraguay', 
'Barzola', 
'M', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'tarja@bonansa.com', 
null,
'EMP1'
);

call usp_registrarEmpleadoConductor 
( 
'3', 
'1', 
'47084553', 
'Reynaldo', 
'Palomino', 
'Lazo', 
'H', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'reynaldo@bonansa.com', 
null,
'123456789',
1,
1,
'EMP1'
);



call usp_registrarEmpleado 
( 
'4', 
'1', 
'47084553', 
'Ricardo', 
'Lazo', 
'Lazo', 
'H', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'ricardo@bonansa.com', 
null,
'EMP1'
);

select*from tb_empleado as e inner join tb_tipo_Empleado as te
on e.idtipoEmpleado=te.idtipoEmpleado;
select*from tb_empleado_conductor;
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
p_fotoEmpleado VARCHAR(10),

-- Usuario quien registra
ip_idEmpleadoR char(7)
)
BEGIN
	START transaction;
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
		fotoEmpleado=p_fotoEmpleado
		where idEmpleado=p_idEmpleado;
		CALL registrarLog(ip_idEmpleadoR, CONCAT("Empleado actualizado: ",p_idEmpleado), "UPDATE");
	COMMIT;
END //
Delimiter ;

call usp_actualizarEmpleado 
( 
'EMP3',
'4', 
'1', 
'47084553', 
'Ricardito', 
'Maziel', 
'Lazo', 
'H', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'ricardo@bonansa.com', 
null,
'EMP1'
);

select*from tb_empleado;
select*from tb_logGeneral;



DROP PROCEDURE IF EXISTS usp_eliminarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_eliminarEmpleado
(
ip_idEmpleado char(7),
-- Usuario quien registra
ip_idEmpleadoR char(7)
)
BEGIN
	START transaction;
		UPDATE tb_empleado set idEstado=0
		  where idEmpleado=ip_idEmpleado;
		CALL registrarLog(ip_idEmpleadoR, CONCAT("Empleado eliminado: ",ip_idEmpleado), "DELETE");
	COMMIT;
END //
Delimiter ;


call usp_eliminarEmpleado('EMP3', 'EMP1');

select*from tb_empleado;
select*from tb_logGeneral;


DROP PROCEDURE IF EXISTS usp_registrarClienteJuridico;
DELIMITER //
CREATE PROCEDURE usp_registrarClienteJuridico
(

-- parametros para el cliente
ip_idTipoCliente INT,
ip_nomCliente VARCHAR(60),
ip_apePatCliente VARCHAR(60),
ip_apeMatCliente VARCHAR(60),
ip_fecNacCliente DATE,
ip_sexoCliente VARCHAR(1),
ip_telefonoCliente VARCHAR(9),
ip_celularCliente VARCHAR(11),
ip_correoCliente VARCHAR(60),

-- parametros para el cliente juridico
ip_idTipoDocId int,
ip_rucCliente VARCHAR(11),
ip_razSocCliente VARCHAR(70),
ip_ciiuCliente VARCHAR(5),
ip_cargoContacCliente VARCHAR(50),

-- empleado quien registra
ip_idEmpleadoR char(7),

-- parametro de salida
INOUT op_idCliente char(7)
)
begin
		declare idClienteAuto char(7);
		set     idClienteAuto=CalcularIdCliente();
	START TRANSACTION;
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
		idClienteAuto,
		ip_idTipoCliente,
		ip_nomCliente,
		ip_apePatCliente,
		ip_apeMatCliente,
		ip_fecNacCliente,
		ip_sexoCliente,
		ip_telefonoCliente,
		ip_celularCliente,
		ip_correoCliente
		);
		insert into tb_cliente_juridico
		(
		idCliente,
		idTipoDocId,
		rucCliente,
		razSocCliente,
		ciiuCliente,
		cargoContacCliente
		)
		values (
		idClienteAuto,
		ip_idTipoDocId,
		ip_rucCliente,
		ip_razSocCliente,
		ip_ciiuCliente,
		ip_cargoContacCliente
		);
        set op_idCliente=concat(idClienteAuto);
		CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente registrado: ",idClienteAuto), "INSERT");
	commit;
END //
Delimiter ;


DROP PROCEDURE IF EXISTS usp_registrarClienteNatural;
DELIMITER //
CREATE PROCEDURE usp_registrarClienteNatural
(
-- parametros del cliente
ip_idTipoCliente INT,
ip_nomCliente VARCHAR(60),
ip_apePatCliente VARCHAR(60),
ip_apeMatCliente VARCHAR(60),
ip_fecNacCliente DATE,
ip_sexoCliente VARCHAR(1),
ip_telefonoCliente VARCHAR(9),
ip_celularCliente VARCHAR(11),
ip_correoCliente VARCHAR(60),

-- parametros del cliente natural
ip_idTipoDocId int,
ip_numDocumento char(9),

-- empleado quien registra
ip_idEmpleadoR varchar(7),

-- paramtro de salida
inout op_idCliente char(7)
)
begin
		 -- variable que almacena el id autogenerado
		   declare idClienteAuto char(7);
		   set     idClienteAuto=CalcularIdCliente();

	START TRANSACTION;
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
		idClienteAuto,
		ip_idTipoCliente,
		ip_nomCliente,
		ip_apePatCliente,
		ip_apeMatCliente,
		ip_fecNacCliente,
		ip_sexoCliente,
		ip_telefonoCliente,
		ip_celularCliente,
		ip_correoCliente
		);
		insert into tb_cliente_Natural
		(
		idCliente,
		idTipoDocId,
		numDocumento
		)
		values (
		idClienteAuto,
		ip_idTipoDocId,
		ip_numDocumento
		);
         
		-- establecemos valor al parametro de salida
		set  op_idCliente=CONCAT(idClienteAuto);
		CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente registrado: ",idClienteAuto), "INSERT");
	commit;
END //
Delimiter ;


call usp_registrarClienteJuridico
(
'1',
'Marco',
'Garcia',
'Altamirano',
'1990-12-12',
'M',
'1234567',
'123456789',
'marco@gmail.com',
'2',
'12345678900',
'Razon social',
'12345',
'UI',
'EMP1',
@salida
);

delimiter ; 
call usp_registrarClienteNatural
(
'2',
'Joel',
'Sulca',
'Gamboa',
'1990-12-12',
'M',
'1234567',
'123456789',
'joel@gmail.com',
'1',
'123456789',
'EMP1',
@salida
);
select @salida;

select*from tb_cliente as c inner join tb_tipo_cliente as tc
on c.idTipoCliente=tc.idtipoCliente;
select*from tb_cliente_juridico;
select*from tb_cliente_natural;
select*from tb_logGeneral as lg;




call usp_registrarUsuario('EMP1', '123', 1);
call usp_registrarUsuario('EMP2', '123', 2);
call usp_registrarUsuario('EMP3', '123', 3);
select*from tb_usuario;

call validarEmpleado('EMP1', '123', @salida);
select @salida;




