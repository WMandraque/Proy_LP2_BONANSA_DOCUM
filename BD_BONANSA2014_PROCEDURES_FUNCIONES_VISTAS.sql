
USE bd_bonansa2014;


DROP FUNCTION if exists CalcularIdVehiculo;
DELIMITER $$
CREATE FUNCTION CalcularIdVehiculo()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
    
	Declare ultimoRegistro char(7);
    Declare numeroCapturado int;
	Declare idVehiculoGenerado Char(7);
	
    -- Capturamos el ultimo registro!!
	Set ultimoRegistro=(select max(idVeh)from tb_vehiculo);

    -- si no existen registros, retornaremos por default un codigo
	if (ultimoRegistro is null) then
    set idVehiculoGenerado='VEH0001';
    return idVehiculoGenerado;
    end if;
    
    -- Si existe algun registro entonces

    -- Separaremos los prefijos de los numeros quedandonos solo con los numeros
    -- SUBSTR(ultimoRegistro, 4) ejemplo: EMP0001 entonces obtendremos:
    -- 0001 que sera transformado en 1 al ser entero
    set numeroCapturado=SUBSTR(ultimoRegistro, 4);
    -- Aumentaremos + 1 , el numero capturado
    set numeroCapturado=numeroCapturado+1;

    -- si el numero aumentado es menor a ....
    if(numeroCapturado<=9) then
        -- concatenaremos 
        set idVehiculoGenerado=CONCAT('VEH000',numeroCapturado);
    return idVehiculoGenerado;

    elseif(numeroCapturado<=99) then
        set idVehiculoGenerado=CONCAT('VEH00',numeroCapturado);
    return idVehiculoGenerado;

    elseif(numeroCapturado<=999) then
        set idVehiculoGenerado=CONCAT('VEH0',numeroCapturado);
    return idVehiculoGenerado;

    else
        set idVehiculoGenerado=CONCAT('VEH',numeroCapturado);
        return idVehiculoGenerado;
    end if;
end;
$$
Delimiter ;


DROP FUNCTION if exists CalcularIdEmpleado;
DELIMITER $$
CREATE FUNCTION CalcularIdEmpleado()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
    
	Declare ultimoRegistro char(7);
    Declare numeroCapturado int;
	Declare idEmpleadoGenerado Char(7);
	
    -- Capturamos el ultimo registro!!
	Set ultimoRegistro=(select max(idEmpleado)from tb_empleado);

    -- si no existen registros, retornaremos por default un codigo
	if (ultimoRegistro is null) then
    set idEmpleadoGenerado='EMP0001';
    return idEmpleadoGenerado;
    end if;
    
    -- Si existe algun registro entonces

    -- Separaremos los prefijos de los numeros quedandonos solo con los numeros
    -- SUBSTR(ultimoRegistro, 4) ejemplo: EMP0001 entonces obtendremos:
    -- 0001 que sera transformado en 1 al ser entero
    set numeroCapturado=SUBSTR(ultimoRegistro, 4);
    -- Aumentaremos + 1 , el numero capturado
    set numeroCapturado=numeroCapturado+1;

    -- si el numero aumentado es menor a ....
    if(numeroCapturado<=9) then
        -- concatenaremos 
        set idEmpleadoGenerado=CONCAT('EMP000',numeroCapturado);
    return idEmpleadoGenerado;

    elseif(numeroCapturado<=99) then
        set idEmpleadoGenerado=CONCAT('EMP00',numeroCapturado);
    return idEmpleadoGenerado;

    elseif(numeroCapturado<=999) then
        set idEmpleadoGenerado=CONCAT('EMP0',numeroCapturado);
    return idEmpleadoGenerado;

    else
        set idEmpleadoGenerado=CONCAT('EMP',numeroCapturado);
        return idEmpleadoGenerado;
    end if;
end;
$$
Delimiter ;


DROP FUNCTION if exists CalcularIdCliente;
DELIMITER $$
CREATE FUNCTION CalcularIdCliente()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
    
	Declare ultimoRegistro char(7);
    Declare numeroCapturado int;
	Declare idClienteGenerado Char(7);
	
    -- Capturamos el ultimo registro!!
	Set ultimoRegistro=(select max(idCliente)from tb_cliente);

    -- si no existen registros, retornaremos por default un codigo
	if (ultimoRegistro is null) then
    set idClienteGenerado='CLI0001';
    return idClienteGenerado;
    end if;
    
    -- Si existe algun registro entonces

    -- Separaremos los prefijos de los numeros quedandonos solo con los numeros
    -- SUBSTR(ultimoRegistro, 4) ejemplo: EMP0001 entonces obtendremos:
    -- 0001 que sera transformado en 1 al ser entero
    set numeroCapturado=SUBSTR(ultimoRegistro, 4);
    -- Aumentaremos + 1 , el numero capturado
    set numeroCapturado=numeroCapturado+1;

    -- si el numero aumentado es menor a ....
    if(numeroCapturado<=9) then
        -- concatenaremos 
       set idClienteGenerado=CONCAT('CLI000',numeroCapturado);
       return idClienteGenerado;

    elseif(numeroCapturado<=99) then
        set idClienteGenerado=CONCAT('CLI00',numeroCapturado);
    return idClienteGenerado;

    elseif(numeroCapturado<=999) then
        set idClienteGenerado=CONCAT('CLI0',numeroCapturado);
    return idClienteGenerado;

    else
        set idClienteGenerado=CONCAT('CLI',numeroCapturado);
        return idClienteGenerado;
    end if;
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

-- ---------------------------------------------------------------------------------------------->




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
ip_anhoFabricVeh INT,
ip_numSerieMotorVeh VARCHAR(20),
ip_largoVeh DECIMAL(6,2),
ip_anchoVeh DECIMAL(6,2),
ip_alturaVeh DECIMAL(6,2),
ip_cargaBrutaVeh DECIMAL(6,2),
ip_cargaUtilVeh DECIMAL(6,2),
ip_cargaNetaVeh DECIMAL(6,2),
ip_fotoVehiculo longblob,
-- empleado quien registra
ip_idEmpleado char(7)
)
begin
    
	declare idVehiculoAuto char(7);
    set     idVehiculoAuto=CalcularIdVehiculo();
  
		insert into tb_vehiculo
		(
		idVeh,
		placaVeh,
		idCategoriaVeh,
		marcaVeh,
		modeloVeh,
		numAsientosVeh,
		anhoFabricVeh,
		numSerieMotorVeh,
		largoVeh,
		anchoVeh,
		alturaVeh,
		cargaBrutaVeh,
		cargaUtilVeh,
		cargaNetaVeh,
        fotoVehiculo
		) 
		values
		(
		idVehiculoAuto,
		ip_placaVeh,
		ip_idCategoriaVeh,
		ip_marcaVeh,
		ip_modeloVeh,
		ip_numAsientosVeh,
		ip_anhoFabricVeh,
		ip_numSerieMotorVeh,
		ip_largoVeh,
		ip_anchoVeh,
		ip_alturaVeh,
		ip_cargaBrutaVeh,
		ip_cargaUtilVeh,
		ip_cargaNetaVeh,
        ip_fotoVehiculo
		);
		call registrarLog(ip_idEmpleado, CONCAT("Vehiculo registrado: ",idVehiculoAuto), "INSERT");
END$$
Delimiter ;






CALL usp_registrarVehiculo
(
'PERU-F6P-757',
1,
'JMC',
'Carryng CWB',
2,
2007,
'65678965',
5.20,
1.85,
2.95,
3500,
1150,
2350,
null,
'EMP0001'
);

CALL usp_registrarVehiculo
(
'PERU-C8G-921',
1,
'Hyundai',
'H-167',
3,
2011,
'76597564',
4795,
1740,
1965,
3490,
1750,
2350,
null,
'EMP0001'
);

select*from tb_vehiculo;
select*from tb_logGeneral;


-- SP Para registrar vehiculo
DROP PROCEDURE IF EXISTS usp_actualizarVehiculo;
DELIMITER $$
CREATE PROCEDURE usp_actualizarVehiculo
(
ip_idVeh CHAR(7),
ip_placaVeh CHAR(20),
ip_idCategoriaVeh INT,
ip_marcaVeh VARCHAR(15),
ip_modeloVeh VARCHAR(15),
ip_numAsientosVeh INT,
ip_anhoFabricVeh INT,
ip_numSerieMotorVeh VARCHAR(20),
ip_largoVeh DECIMAL(6,2),
ip_anchoVeh DECIMAL(6,2),
ip_alturaVeh DECIMAL(6,2),
ip_cargaBrutaVeh DECIMAL(6,2),
ip_cargaUtilVeh DECIMAL(6,2),
ip_cargaNetaVeh DECIMAL(6,2),
ip_fotoVehiculo longblob,
ip_idEstado char(1),
ip_idEstadoTrabajo char(1),

-- empleado quien actualiza
ip_idEmpleadoR char(7),

-- define si la columna foto!!
ip_TipoQuery int
)
begin
if ip_TipoQuery =0 then
              update tb_vehiculo set
								
								placaVeh=ip_placaVeh,
								idCategoriaVeh=ip_idCategoriaVeh,
								marcaVeh=ip_marcaVeh,
								modeloVeh=ip_modeloVeh,
								numAsientosVeh=ip_numAsientosVeh,
								anhoFabricVeh=ip_anhoFabricVeh,
								numSerieMotorVeh=ip_numSerieMotorVeh,
								largoVeh=ip_largoVeh,
								anchoVeh=ip_anchoVeh,
								alturaVeh=ip_alturaVeh,
								cargaBrutaVeh=ip_cargaBrutaVeh,
								cargaUtilVeh=ip_cargaUtilVeh,
								cargaNetaVeh=ip_cargaNetaVeh,
								idEstado=ip_idEstado,
								idEstadoTrabajo=ip_idEstadoTrabajo
		      where idVeh=ip_idVeh;
else
              update tb_vehiculo set
								
								placaVeh=ip_placaVeh,
								idCategoriaVeh=ip_idCategoriaVeh,
								marcaVeh=ip_marcaVeh,
								modeloVeh=ip_modeloVeh,
								numAsientosVeh=ip_numAsientosVeh,
								anhoFabricVeh=ip_anhoFabricVeh,
								numSerieMotorVeh=ip_numSerieMotorVeh,
								largoVeh=ip_largoVeh,
								anchoVeh=ip_anchoVeh,
								alturaVeh=ip_alturaVeh,
								cargaBrutaVeh=ip_cargaBrutaVeh,
								cargaUtilVeh=ip_cargaUtilVeh,
								cargaNetaVeh=ip_cargaNetaVeh,
								fotoVehiculo=ip_fotoVehiculo,
								idEstado=ip_idEstado,
								idEstadoTrabajo=ip_idEstadoTrabajo
		      where idVeh=ip_idVeh;
end if;
		call registrarLog(ip_idEmpleadoR, CONCAT("Vehiculo Actualizado: ",ip_idVeh), "UPDATE");
END$$
Delimiter ;


-- SP Para eliminar vehiculo
DROP PROCEDURE IF EXISTS usp_eliminarVehiculo;
DELIMITER $$
CREATE PROCEDURE usp_eliminarVehiculo
(
ip_idVeh CHAR(7),

-- empleado quien elimina
ip_idEmpleadoR char(7)
)
begin
              update tb_vehiculo set
								   idEstado='0'
		      where idVeh=ip_idVeh;

		call registrarLog(ip_idEmpleadoR, CONCAT("Vehiculo Eliminado: ",ip_idVeh), "UPDATE");
END$$
Delimiter ;



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





DROP PROCEDURE IF EXISTS usp_registrarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_registrarEmpleado
(
ip_idTipoEmpleado int,
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
ip_fotoEmpleado longblob,

-- Empleado quien lo registra
ip_idEmpleadoR char(7)
)
BEGIN
		Declare idEmpleadoAutogenerado Char(10);
		SET     idEmpleadoAutogenerado=CalcularIdEmpleado();
		INSERT INTO tb_empleado
		(
		idEmpleado,
		idTipoEmpleado, 
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
		call registrarLog(ip_idEmpleadoR , CONCAT("Empleado registrado: ",idEmpleadoAutogenerado), "INSERT");
END //
Delimiter ;


DROP PROCEDURE IF EXISTS usp_registrarEmpleadoConductor;
DELIMITER //
CREATE PROCEDURE usp_registrarEmpleadoConductor
(
ip_idTipoEmpleado int,
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
ip_fotoEmpleado longblob,
-- parametros de empleado chofer
ip_licenCondEmpleado CHAR(9),
ip_idClaselic int,
ip_idCategorialic int,


-- Empleado quien lo registra
ip_idEmpleadoR  char(7)
)
BEGIN
		Declare idEmpleadoAutogenerado Char(7);
		SET     idEmpleadoAutogenerado=CalcularIdEmpleado();

		INSERT INTO tb_empleado
		(
		idEmpleado,
		idTipoEmpleado, 
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
		CALL registrarLog(ip_idEmpleadoR , CONCAT("Empleado registrado: ",idEmpleadoAutogenerado), "INSERT");
END //
Delimiter ;



select*from tb_empleado;
call usp_registrarEmpleado 
( 
'1', 
'47084553', 
'Carlos', 
'Bonilla', 
'Heliz', 
'M', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'bonilla@bonansa.com', 
null,
'ADMI'
);
select*from tb_empleado;


call usp_registrarEmpleado 
( 
'2', 
'47084553', 
'Tarja', 
'Paraguay', 
'Barzola', 
'F', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'tarja@bonansa.com', 
null,
'EMP0001'
);

call usp_registrarEmpleadoConductor 
( 
'3', 
'47084553', 
'Reynaldo', 
'Palomino', 
'Lazo', 
'M', 
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
'EMP0001'
);


call usp_registrarEmpleado 
( 
'4', 
'47084553', 
'Ricardo', 
'Lazo', 
'Lazo', 
'M', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'99887865679', 
'ricardo@bonansa.com', 
null,
'EMP0001'
);



select*from tb_empleado as e inner join tb_tipo_Empleado as te
on e.idtipoEmpleado=te.idtipoEmpleado;
select*from tb_empleado_conductor;
select*from tb_logGeneral;

select*from tb_empleado as e
inner join tb_empleado_conductor as ec
on e.idEmpleado=ec.idEmpleado
where e.idEmpleado="EMP0003";



DROP PROCEDURE IF EXISTS usp_actualizarEmpleado;
DELIMITER //
CREATE PROCEDURE usp_actualizarEmpleado
(
ip_idEmpleado char(10),
ip_numDocumento char(9),
ip_nomEmpleado VARCHAR(100),
ip_apepaEmpleado VARCHAR(100),
ip_apemaEmpleado VARCHAR(100),
ip_sexoEmpleado CHAR(1),
ip_fecnacEmpleado DATE,
ip_domicilioEmpleado VARCHAR(200),
ip_ubigeoEmpleado CHAR(6),
ip_fonoEmpleado CHAR(9),
ip_celularEmpleado VARCHAR(11),
ip_emailEmpleado VARCHAR(100),
ip_fotoEmpleado longblob,
ip_idEstadoTrabajo char(1),
ip_idEstado char(1),

-- Usuario quien registra
ip_idEmpleadoR char(7),

-- Tipo de query "Foto"
ip_TipoQuery int
)
BEGIN
	if ip_TipoQuery =0 then
				UPDATE tb_empleado set 
						numDocumento=ip_numDocumento,
						nomEmpleado=ip_nomEmpleado,
						apepaEmpleado=ip_apepaEmpleado,
						apemaEmpleado=ip_apemaEmpleado,
						sexoEmpleado=ip_sexoEmpleado,
						fecnacEmpleado=ip_fecnacEmpleado,
						domicilioEmpleado=ip_domicilioEmpleado,
						ubigeoEmpleado=ip_ubigeoEmpleado,
						fonoEmpleado=ip_fonoEmpleado,
						celularEmpleado=ip_celularEmpleado,
						emailEmpleado=ip_emailEmpleado,
						idEstado=ip_idEstado,
						idEstadoTrabajo=ip_idEstadoTrabajo
				where idEmpleado=ip_idEmpleado;
	else
				UPDATE tb_empleado set 
								numDocumento=ip_numDocumento,
								nomEmpleado=ip_nomEmpleado,
								apepaEmpleado=ip_apepaEmpleado,
								apemaEmpleado=ip_apemaEmpleado,
								sexoEmpleado=ip_sexoEmpleado,
								fecnacEmpleado=ip_fecnacEmpleado,
								domicilioEmpleado=ip_domicilioEmpleado,
								ubigeoEmpleado=ip_ubigeoEmpleado,
								fonoEmpleado=ip_fonoEmpleado,
								celularEmpleado=ip_celularEmpleado,
								emailEmpleado=ip_emailEmpleado,
								fotoEmpleado=ip_fotoEmpleado,
								idEstado=ip_idEstado,
								idEstadoTrabajo=ip_idEstadoTrabajo
			  where idEmpleado=ip_idEmpleado;
	end if;

	CALL registrarLog(ip_idEmpleadoR, CONCAT("Empleado actualizado: ",ip_idEmpleado), "UPDATE");
END //
Delimiter ;

DROP PROCEDURE IF EXISTS usp_actualizarEmpleadoConductor;
DELIMITER //
CREATE PROCEDURE usp_actualizarEmpleadoConductor
(
ip_idEmpleado char(7),
ip_numDocumento char(9),
ip_nomEmpleado VARCHAR(100),
ip_apepaEmpleado VARCHAR(100),
ip_apemaEmpleado VARCHAR(100),
ip_sexoEmpleado CHAR(1),
ip_fecnacEmpleado DATE,
ip_domicilioEmpleado VARCHAR(200),
ip_ubigeoEmpleado CHAR(6),
ip_fonoEmpleado CHAR(9),
ip_celularEmpleado VARCHAR(11),
ip_emailEmpleado VARCHAR(100),
ip_fotoEmpleado longblob,
ip_licenCondEmpleado CHAR(9),
ip_idClaselic INT,
ip_idCategorialic INT,
ip_idEstadoTrabajo char(1),
ip_idEstado char(1),

-- Usuario quien registra
ip_idEmpleadoR char(7),

-- Tipo de query "Foto"
ip_TipoQuery int
)
BEGIN
    declare x char(7);
    set x=ip_idEmpleadoR;
	if ip_TipoQuery =0 then
				UPDATE tb_empleado set 
						numDocumento=ip_numDocumento,
						nomEmpleado=ip_nomEmpleado,
						apepaEmpleado=ip_apepaEmpleado,
						apemaEmpleado=ip_apemaEmpleado,
						sexoEmpleado=ip_sexoEmpleado,
						fecnacEmpleado=ip_fecnacEmpleado,
						domicilioEmpleado=ip_domicilioEmpleado,
						ubigeoEmpleado=ip_ubigeoEmpleado,
						fonoEmpleado=ip_fonoEmpleado,
						celularEmpleado=ip_celularEmpleado,
						emailEmpleado=ip_emailEmpleado,
						idEstado=ip_idEstado,
						idEstadoTrabajo=ip_idEstadoTrabajo
				where idEmpleado=ip_idEmpleado;
	else
				UPDATE tb_empleado set 
								numDocumento=ip_numDocumento,
								nomEmpleado=ip_nomEmpleado,
								apepaEmpleado=ip_apepaEmpleado,
								apemaEmpleado=ip_apemaEmpleado,
								sexoEmpleado=ip_sexoEmpleado,
								fecnacEmpleado=ip_fecnacEmpleado,
								domicilioEmpleado=ip_domicilioEmpleado,
								ubigeoEmpleado=ip_ubigeoEmpleado,
								fonoEmpleado=ip_fonoEmpleado,
								celularEmpleado=ip_celularEmpleado,
								emailEmpleado=ip_emailEmpleado,
								fotoEmpleado=ip_fotoEmpleado,
								idEstado=ip_idEstado,
								idEstadoTrabajo=ip_idEstadoTrabajo
			  where idEmpleado=ip_idEmpleado;
	end if;
   UPDATE tb_empleado_conductor set 
					licenCondEmpleado=ip_licenCondEmpleado,
					idClaselic=ip_idClaselic,
					idCategorialic=ip_idCategorialic
				where idEmpleado=ip_idEmpleado;
	CALL registrarLog(ip_idEmpleadoR, CONCAT("Empleado actualizado: ",x), "UPDATE");
END //
Delimiter ;



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


call usp_eliminarEmpleado('EMP0003', 'EMP0001');

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
ip_numDocumento char(9),

-- parametros para el cliente juridico
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
		correoCliente,
        numDocumento
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
		ip_correoCliente,
		ip_numDocumento
		);
		insert into tb_cliente_juridico
		(
		idCliente,
		razSocCliente,
		ciiuCliente,
		cargoContacCliente
		)
		values (
		idClienteAuto,
		ip_razSocCliente,
		ip_ciiuCliente,
		ip_cargoContacCliente
		);
        set op_idCliente=idClienteAuto;
		CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente registrado: ",idClienteAuto), "INSERT");
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
			correoCliente,
			numDocumento
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
			ip_correoCliente,
			ip_numDocumento
			);
			-- establecemos valor al parametro de salida
			set  op_idCliente=CONCAT(idClienteAuto);
			CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente registrado: ",idClienteAuto), "INSERT");
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
'123456',
'Razon social',
'12345',
'UI',
'EMP0001',
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
'123456789',
'EMP0001',
@salida
);
select @salida;

select*from tb_cliente as c inner join tb_tipo_cliente as tc
on c.idTipoCliente=tc.idtipoCliente;
select*from tb_logGeneral as lg;




call usp_registrarUsuario('EMP0001', '123', 1);
call usp_registrarUsuario('EMP0002', '123', 2);
call usp_registrarUsuario('EMP0003', '123', 3);
select*from tb_usuario;

call validarEmpleado('EMP0001', '123', @salida);
select @salida;


select*from tb_vehiculo;


-- Vistas
DROP VIEW IF EXISTS vistaListaVehiculos;
CREATE VIEW vistaListaVehiculos 
as
(
select 
v.idVeh, 
v.placaVeh, 
cv.descCategoriaVeh, 
v.marcaVeh, 
v.modeloVeh, 
v.numAsientosVeh, 
v.anhoFabricVeh,
et.descEstado as estadoTrabajo,
e.descEstado as Estado
from tb_vehiculo as v 
inner join 
tb_categoriavehiculo as cv
on v.idCategoriaVeh=cv.idCategoriaVeh
inner join
tb_estado as e
on v.idEstado=e.idEstado
inner join tb_estadoTrabajo as et
on v.idEstadoTrabajo=et.idEstadoTrabajo
);

select*from vistaListaVehiculos;


-- Vista para listar empleados
DROP VIEW IF EXISTS vistaListaEmpleados;
CREATE VIEW vistaListaEmpleados 
as
(
select 
e.idEmpleado,
te.nomCargo,
e.nomEmpleado,
e.apepaEmpleado,
e.apemaEmpleado,
e.fonoEmpleado,
e.celularEmpleado,
e.emailEmpleado,
et.descEstado,
es.descEstado as estado
from tb_empleado as e
inner join 
tb_tipo_empleado as te
on e.idTipoEmpleado=te.idTipoEmpleado
inner join tb_estadoTrabajo as et
on e.idEstadoTrabajo=et.idEstadoTrabajo
inner join tb_estado as es
on e.idEstado=es.idEstado
order by e.idEmpleado
);

select*From vistaListaEmpleados;
