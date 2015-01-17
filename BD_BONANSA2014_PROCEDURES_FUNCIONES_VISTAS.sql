
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

-- Generar GRT 
DROP FUNCTION if exists CalcularIdGRT;
DELIMITER $$
CREATE FUNCTION CalcularIdGRT()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
    
	Declare ultimoRegistro char(7);
    Declare numeroCapturado int;
	Declare idGRTGenerado Char(7);
	
    -- Capturamos el ultimo registro!!
	Set ultimoRegistro=(select max(idGRT)from tb_GRT);

    -- si no existen registros, retornaremos por default un codigo
	if (ultimoRegistro is null) then
    set idGRTGenerado='GRT0001';
    return idGRTGenerado;
    end if;
    
    set numeroCapturado=SUBSTR(ultimoRegistro, 4);
    -- Aumentaremos + 1 , el numero capturado
    set numeroCapturado=numeroCapturado+1;

    -- si el numero aumentado es menor a ....
    if(numeroCapturado<=9) then
        -- concatenaremos 
        set idGRTGenerado=CONCAT('GRT000',numeroCapturado);
    return idGRTGenerado;

    elseif(numeroCapturado<=99) then
        set idGRTGenerado=CONCAT('GRT00',numeroCapturado);
    return idGRTGenerado;

    elseif(numeroCapturado<=999) then
        set idGRTGenerado=CONCAT('GRT0',numeroCapturado);
    return idGRTGenerado;

    else
        set idGRTGenerado=CONCAT('GRT',numeroCapturado);
        return idGRTGenerado;
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



DROP FUNCTION if exists CalcularIdOrdenRecojo;
DELIMITER $$
CREATE FUNCTION CalcularIdOrdenRecojo()-- Retornara el codigo del empleado convertido
Returns CHAR(7)
begin
    
	Declare ultimoRegistro char(7);
    Declare numeroCapturado int;
	Declare idORGenerado Char(7);
	
    -- Capturamos el ultimo registro!!
	Set ultimoRegistro=(select max(idOR)from tb_ordenRecojo);

    -- si no existen registros, retornaremos por default un codigo
	if (ultimoRegistro is null) then
    set idORGenerado='SOR0001';
    return idORGenerado;
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
       set idORGenerado=CONCAT('SOR000',numeroCapturado);
       return idORGenerado;

    elseif(numeroCapturado<=99) then
        set idORGenerado=CONCAT('SOR00',numeroCapturado);
    return idORGenerado;

    elseif(idORGenerado<=999) then
        set idORGenerado=CONCAT('SOR0',numeroCapturado);
    return idORGenerado;

    else
        set idORGenerado=CONCAT('SOR',numeroCapturado);
        return idORGenerado;
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

call usp_registrarEmpleado 
( 
'4', 
'47084553', 
'Fernado', 
'Colunga', 
'Soto', 
'M', 
'1970/07/08', 
'Los ruiseñores 325', 
'1231', 
'6788767', 
'99887865679', 
'fernadoC@bonansa.com', 
null,
'EMP0001'
);

call usp_registrarEmpleado 
( 
'4', 
'47084553', 
'Eugenio', 
'Derbez', 
'Cuando', 
'M', 
'1989/07/08', 
'Los rosales 123', 
'1231', 
'6788767', 
'99887865679', 
'ederbez@bonansa.com', 
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

call usp_registrarEmpleadoConductor 
( 
'3', 
'47084553', 
'Angel', 
'David', 
'Revilla', 
'M', 
'1980/07/08', 
'Imperial 325', 
'1231', 
'6788767', 
'966759235', 
'angelDavid@bonansa.com', 
null,
'123456789',
1,
1,
'EMP0001'
);

call usp_registrarEmpleadoConductor 
( 
'3', 
'47084553', 
'German', 
'Mattz', 
'Garmendia', 
'M', 
'1980/07/08', 
'chavin 325', 
'1231', 
'6788767', 
'966759235', 
'germanG@bonansa.com', 
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
	declare x char(7);
    set x=ip_idEmpleadoR;
		  UPDATE tb_empleado set idEstado=0
		  where idEmpleado=ip_idEmpleado;
		  CALL registrarLog(x, CONCAT("Empleado eliminado: ",ip_idEmpleado), "DELETE");

END //
Delimiter ;


call usp_eliminarEmpleado('EMP0003', 'EMP0001');

select*from tb_empleado;
select*from tb_logGeneral;


-- ---------------------------------------------------------
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


DROP PROCEDURE IF EXISTS usp_actualizarClienteNatural;
DELIMITER //
CREATE PROCEDURE usp_actualizarClienteNatural
(
ip_idCliente char(7),
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
ip_idEstado char(1),

-- empleado quien registra
ip_idEmpleadoR varchar(7)
)
begin
			update tb_cliente set
								nomCliente=ip_nomCliente,
								apePatCliente=ip_apePatCliente,
								apeMatCliente=ip_apeMatCliente,
								fecNacCliente=ip_fecNacCliente,
								sexoCliente=ip_sexoCliente,
								telefonoCliente=ip_telefonoCliente,
								celularCliente=ip_celularCliente,
								correoCliente=ip_correoCliente,
								numDocumento=ip_numDocumento,
                                idEstado=ip_idEstado

			where idCliente=ip_idCliente;
			CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente actualizado: ",ip_idCliente), "UPDATE");
END //
Delimiter ;

DROP PROCEDURE IF EXISTS usp_actualizarClienteJuridico;
DELIMITER //
CREATE PROCEDURE usp_actualizarClienteJuridico
(
ip_idCliente char(7),
ip_nomCliente VARCHAR(60),
ip_apePatCliente VARCHAR(60),
ip_apeMatCliente VARCHAR(60),
ip_fecNacCliente DATE,
ip_sexoCliente VARCHAR(1),
ip_telefonoCliente VARCHAR(9),
ip_celularCliente VARCHAR(11),
ip_correoCliente VARCHAR(60),
ip_numDocumento char(9),
ip_idEstado char(1),

-- parametros del cliente juridico
ip_razSocCliente VARCHAR(70),
ip_ciiuCliente VARCHAR(5),
ip_cargoContacCliente VARCHAR(50),

-- empleado quien registra
ip_idEmpleadoR varchar(7)
)
begin
			update tb_cliente set
								nomCliente=ip_nomCliente,
								apePatCliente=ip_apePatCliente,
								apeMatCliente=ip_apeMatCliente,
								fecNacCliente=ip_fecNacCliente,
								sexoCliente=ip_sexoCliente,
								telefonoCliente=ip_telefonoCliente,
								celularCliente=ip_celularCliente,
								correoCliente=ip_correoCliente,
								numDocumento=ip_numDocumento,
                                idEstado=ip_idEstado

			where idCliente=ip_idCliente;

			update tb_cliente_juridico set
						razSocCliente=ip_razSocCliente,
						ciiuCliente=ip_ciiuCliente,
						cargoContacCliente=ip_cargoContacCliente
			where idCliente=ip_idCliente;

			CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente actualizado: ",ip_idCliente), "UPDATE");
END //
Delimiter ;


DROP PROCEDURE IF EXISTS usp_eliminarCliente;
DELIMITER //
CREATE PROCEDURE usp_eliminarCliente
(
ip_idCliente char(7),

-- empleado quien elimina
ip_idEmpleadoR char(7)
)
begin
		 

			update tb_cliente set
                                idEstado='0'

			where idCliente=ip_idCliente;
			CALL registrarLog(ip_idEmpleadoR, CONCAT("Cliente eliminado: ",ip_idCliente), "DELETE");
END //
Delimiter ;


DROP PROCEDURE IF EXISTS usp_registrarDireccionesCliente;
DELIMITER //
CREATE PROCEDURE usp_registrarDireccionesCliente
(
-- parametros del cliente

ip_idCliente varchar(7),
ip_direcDirecCliente VARCHAR(200),
ip_codubigeoDirecCliente VARCHAR(6),
ip_idTipoEstablec INT
)
begin
			insert into tb_direccionescliente
			(
			idCliente,
			direcDirecCliente,
			codubigeoDirecCliente,
			idTipoEstablec
			)
             value
			(
			ip_idCliente,
			ip_direcDirecCliente,
			ip_codubigeoDirecCliente,
			ip_idTipoEstablec
			);
END //
Delimiter ;

select*from tb_direccionescliente;
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

call usp_registrarClienteJuridico
(
'1',
'Jose',
'Falcon',
'Herrera',
'1978-12-12',
'M',
'1234567',
'123456789',
'josef@gmail.com',
'123456',
'DROPESAC',
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
call usp_registrarClienteNatural
(
'2',
'Debora',
'Sulca',
'Gamboa',
'1976-12-12',
'F',
'1234567',
'123456789',
'dsulca@gmail.com',
'123456789',
'EMP0001',
@salida
);
select @salida;

CALL usp_registrarDireccionesCliente('CLI0001','Calandrias 234','020105','1');
CALL usp_registrarDireccionesCliente('CLI0001','Las lomas 325','020112','1');
CALL usp_registrarDireccionesCliente('CLI0002','Ollantay 56','020504','1');
CALL usp_registrarDireccionesCliente('CLI0002','Siempre viva 123','030702','1');
CALL usp_registrarDireccionesCliente('CLI0003','ciudad gotica 23','160210','1');
CALL usp_registrarDireccionesCliente('CLI0003','Los rosales 122','190101','1');
CALL usp_registrarDireccionesCliente('CLI0004','Los girasoles 34','200607','1');
CALL usp_registrarDireccionesCliente('CLI0004','Chavin 325','211210','1');

select*from tb_cliente as c inner join tb_tipo_cliente as tc
on c.idTipoCliente=tc.idtipoCliente;
select*from tb_logGeneral as lg;

select*from tb_cliente_juridico;

-- -------------------------------------------

DROP PROCEDURE IF EXISTS usp_registrarUsuario;
DELIMITER $$
CREATE PROCEDURE usp_registrarUsuario
(
ip_idEmpleado char(7),
ip_clave VARCHAR(30),
ip_idRol CHAR(1),

ip_idEmpleadoR CHAR(7)
)
begin
		insert into tb_usuario
		(
		idEmpleado,
		clave,
		idRol
		) 
		values(
				ip_idEmpleado,
				ip_clave,
				ip_idRol
		);
call registrarLog(ip_idEmpleadoR, CONCAT("Usuario registrado: ",ip_idEmpleado), "INSERT");
END$$
Delimiter ;



call usp_registrarUsuario('EMP0001', '123', 1, '1');
call usp_registrarUsuario('EMP0002', '123', 2, '1');
call usp_registrarUsuario('EMP0004', '123', 3, '1');
call usp_registrarUsuario('EMP0005', '123', 3, '1');
select*from tb_usuario;

-- ------------------------------------------------

DROP PROCEDURE IF EXISTS usp_actualizarUsuario;
DELIMITER $$
CREATE PROCEDURE usp_actualizarUsuario
(
ip_idEmpleado char(7),
ip_clave VARCHAR(30),
ip_idRol CHAR(1),
ip_idEstado CHAR(1),

ip_idEmpleadoR CHAR(7)
)
begin
	UPDATE tb_usuario SET
							clave=ip_clave,
							idRol=ip_idRol, 
							idEstado=ip_idEstado 
    WHERE   idEmpleado=ip_idEmpleado;
call registrarLog(ip_idEmpleadoR, CONCAT("Usuario actualizado: ",ip_idEmpleado), "UPDATE");
END$$
Delimiter ;



-- ----------------------------------------------
DROP PROCEDURE IF EXISTS usp_eliminarUsuario;
DELIMITER $$
CREATE PROCEDURE usp_eliminarUsuario
(
ip_idEmpleado char(7),

ip_idEmpleadoR CHAR(7)
)
begin
	UPDATE tb_usuario SET
							idEstado='0' 
    WHERE   idEmpleado=ip_idEmpleado;
call registrarLog(ip_idEmpleadoR, CONCAT("Usuario eliminado: ",ip_idEmpleado), "DELETE");
END$$
Delimiter ;


-- ----------------------------------------------
DROP PROCEDURE IF EXISTS usp_buscarUsuario;
DELIMITER $$
CREATE PROCEDURE usp_buscarUsuario
(
ip_idEmpleado char(7)
)
begin
	SELECT*FROM tb_usuario WHERE idEmpleado=ip_idEmpleado;
END$$
Delimiter ;

CALL usp_buscarUsuario('EMP0001');
-- -----------------------------------------------



DROP PROCEDURE IF EXISTS usp_validarUsuario;
DELIMITER $$
CREATE PROCEDURE usp_validarUsuario
(
ip_idEmpleado char(7), 
ip_clave varchar(30),
INOUT op_idEmpleado char(7)
)
BEGIN
      select 
           u.idEmpleado,
           u.clave,
           r.descRol, 
           es.descEstado,
           e.nomEmpleado,
           e.apepaEmpleado, 
           e.apemaEmpleado
	  from tb_usuario as u 
      inner join tb_empleado as e
      on u.idEmpleado=e.idEmpleado
	  inner join tb_rol as r
      on u.idRol=r.idRol
      inner join tb_estado as es
      on u.idEstado=es.idEstado
      where u.idEmpleado=ip_idEmpleado and u.clave=ip_clave;

	 set op_idEmpleado=concat((SELECT u.idEmpleado FROM tb_usuario as u where u.idEmpleado=ip_idEmpleado and u.clave=ip_clave));


END$$
Delimiter ;





call usp_validarUsuario('EMP0001', '123', @salida);
select @salida;











-- ----------------------------------------------------------




DROP PROCEDURE IF EXISTS usp_registrarOrdenRecojo;
DELIMITER $$
CREATE PROCEDURE usp_registrarOrdenRecojo
(
ip_idCliente CHAR(7),
ip_direccionRecojo varchar(300),
ip_fechaRecojo DATE,
ip_horaRecojo  TIME,
-- Parametro del empleado quien registra orden de recojo
ip_idEmpleadoR CHAR(7),

-- Parametro a retornar
INOUT op_idSOR char(7)
)
BEGIN

		   declare idSORAuto char(7);
		   set     idSORAuto=CalcularIdOrdenRecojo();
		   insert into tb_ordenRecojo
			(
			idOR,
			idCliente,
			direccionRecojo,
			fechaRecojo,
			horaRecojo
			) 
			values(
            idSORAuto,
			ip_idCliente,
			ip_direccionRecojo,
			ip_fechaRecojo,
			ip_horaRecojo
			);
		   
           SET op_idSOR=idSORAuto;
	       call registrarLog(ip_idEmpleadoR, CONCAT("SOR Registrado: ",idSORAuto), "INSERT");

END$$
Delimiter ;


Select *from tb_ordenRecojo;

DROP PROCEDURE IF EXISTS usp_registrarEquipoVehicularOrdenRecojo;
DELIMITER $$
CREATE PROCEDURE usp_registrarEquipoVehicularOrdenRecojo
(
ip_idOR CHAR(7),
ip_idVeh CHAR(7)
)
BEGIN
		   insert into tb_equipoVehicular_OrdenRecojo
			(
			idOR,
			idVeh
			) 
			values
            (
			ip_idOR,
			ip_idVeh
			);
		    -- Cambiar de estado al vehiculo como ocupado
            update tb_vehiculo set idEstadoTrabajo='1' where idVeh=ip_idVeh;
END$$
Delimiter ;

SELECT*FROM tb_equipoVehicular_OrdenRecojo;


DROP PROCEDURE IF EXISTS usp_registrarEquipoPersonalOrdenRecojo;
DELIMITER $$
CREATE PROCEDURE usp_registrarEquipoPersonalOrdenRecojo
(
ip_idOR CHAR(7),
ip_idEmpleado CHAR(7)
)
BEGIN
		   insert into tb_equipoPersonal_OrdenRecojo
			(
			idOR,
			idEmpleado
			) 
			values
            (
			ip_idOR,
			ip_idEmpleado
			);

		    -- Cambiar de estado al personal como ocupado
            update tb_empleado set idEstadoTrabajo='1' where idEmpleado=ip_idEmpleado;
END$$
Delimiter ;


SELECT*FROM tb_equipoPersonal_OrdenRecojo;



DROP PROCEDURE IF EXISTS usp_detalleOrdenRecojo;
DELIMITER $$
CREATE PROCEDURE usp_detalleOrdenRecojo
(
ip_idOR CHAR(7),
ip_descripcionTraslado VARCHAR(200),
ip_cantidad INT,
ip_idTipoUnidadMedida INT,
ip_PesokG DECIMAL(6,2)
)
BEGIN
		   insert into tb_detalle_ordenRecojo
			(
			idOR,
			descripcionTraslado,
            cantidad,
			idTipoUnidadMedida,
			PesokG
			) 
			values
            (
			ip_idOR,
			ip_descripcionTraslado,
            ip_cantidad, 
			ip_idTipoUnidadMedida,
			ip_PesokG
			);
END$$
Delimiter ;







-- GRT


DROP PROCEDURE IF EXISTS usp_registrarGRT;
DELIMITER $$
CREATE PROCEDURE usp_registrarGRT
(
ip_idEmpleado CHAR(7),
ip_idVeh CHAR(7),
ip_fecInicioTraslado DATE,
ip_idCliRemitente char(7),
ip_direcCliRemitente varchar(200),
ip_nomCliDestinatario varchar(100),
ip_apepaCliDestinatario varchar(100),
ip_apemaCliDestinatario varchar(100),
ip_idTipoDocId INT,
ip_numDocCliDestinatario char(50),
ip_direcClienteDestinatario varchar(200),
ip_fechaMinTraslado DATE,
ip_fechaMaxTraslado DATE,

-- Parametro del empleado quien registra GRT
ip_idEmpleadoR CHAR(7),

-- Parametro para cambiar de estado a la tabla tb_OrdenRecojo
ip_idSOR CHAR(7),

-- Parametro a retornar
INOUT op_idGRT char(7)
)
BEGIN

		   declare idGRTAuto char(7);
		   set     idGRTAuto=CalcularIdGRT();
		   insert into tb_GRT
			(
			idGRT,
			idEmpleado,
			idVeh,
			fecInicioTraslado,
			idCliRemitente,
			direcCliRemitente,
			nomCliDestinatario,
			apepaCliDestinatario,
			apemaCliDestinatario,
			idTipoDocId,
			numDocCliDestinatario,
			direcClienteDestinatario,
			fechaMinTraslado,
			fechaMaxTraslado
			) 
			values
            (
			idGRTAuto,
			ip_idEmpleado,
			ip_idVeh,
			ip_fecInicioTraslado,
			ip_idCliRemitente,
			ip_direcCliRemitente,
			ip_nomCliDestinatario,
			ip_apepaCliDestinatario,
			ip_apemaCliDestinatario,
			ip_idTipoDocId,
			ip_numDocCliDestinatario,
			ip_direcClienteDestinatario,
			ip_fechaMinTraslado,
			ip_fechaMaxTraslado
			);
		   
           update tb_ordenRecojo set idEstadoOr='1' where idOR=ip_idSOR;
           SET op_idGRT=idGRTAuto;
	       call registrarLog(ip_idEmpleadoR, CONCAT("GRT Registrado: ",idGRTAuto), "INSERT");

END$$
Delimiter ;

select*from tB_GRT;
select*from tb_detalle_GRT;


DROP PROCEDURE IF EXISTS usp_registrarDGRT;
DELIMITER $$
CREATE PROCEDURE usp_registrarDGRT
(
ip_idGRT CHAR(7),
ip_numCodGR VARCHAR(30),
ip_numCodFT VARCHAR(30),
ip_descTraslado VARCHAR(30),
ip_cantidad INT,
ip_idTipoUnidadMedida INT,
ip_pesoKg DECIMAL(18,6)
)
BEGIN

		
		   insert into tb_detalle_GRT
			(
			idGRT,
			numCodGR,
			numCodFT,
			descTraslado,
			cantidad,
			idTipoUnidadMedida,
			pesoKg
			) 
			values
            (
			ip_idGRT,
			ip_numCodGR,
			ip_numCodFT,
			ip_descTraslado,
			ip_cantidad,
			ip_idTipoUnidadMedida,
			ip_pesoKg
			);
END$$
Delimiter ;

-- ----

DROP VIEW IF EXISTS vistaBuscarSOR;
CREATE VIEW vistaBuscarSOR
AS
( 
select
sor.idOR,
sor.idCliente,
sor.direccionRecojo,
concat(c.nomCliente," ",c.apePatCliente," ",c.apeMatCliente),
tc.idTipoCliente,
c.numDocumento,
epo.idEmpleado,
ec.licenCondEmpleado,
evo.idVeh,
v.placaVeh,
sor.idEstadoOR
from tb_ordenRecojo as sor
inner join tb_cliente as c
on c.idCliente=sor.idCliente
inner join tb_tipo_cliente as tc
on c.idTipoCliente=tc.idTipoCliente
inner join tb_equipoPersonal_OrdenRecojo as epo
on sor.idOR=epo.idOR
inner join tb_empleado_conductor as ec
on epo.idEmpleado=ec.idEmpleado
inner join tb_equipoVehicular_OrdenRecojo as evo
on sor.idOR=evo.idOR
inner join tb_vehiculo as v
on evo.idVeh=v.idVeh
group by sor.idOR
);
SELECT*FROM vistaBuscarSOR where idEstadoOR='0';
-- where sor.idOR=?

DROP VIEW IF EXISTS vistaBuscarEquipoPersonal;
CREATE VIEW vistaBuscarEquipoPersonal
AS
(
select
epor.idOR,
epor.idEmpleado,
e.idTipoEmpleado,
te.nomCargo,
e.nomEmpleado,
e.apepaEmpleado,
e.apemaEmpleado
from tb_equipoPersonal_OrdenRecojo epor
inner join tb_empleado as e
on epor.idEmpleado=e.idEmpleado
inner join tb_tipo_empleado as te
on e.idTipoEmpleado=te.idTipoEmpleado
where e.idTipoEmpleado!=3
);
SELECT*FROM vistaBuscarEquipoPersonal;


-- ----------
DROP VIEW IF EXISTS vistaListaGRT;
CREATE VIEW vistaListaGRT
AS( 
Select 
grt.idGRT,
grt.idEmpleado,
ec.licenCondEmpleado,
grt.idVeh,
v.placaVeh,

grt.idCliRemitente,
grt.direcCliRemitente,
c.nomCliente,
c.apePatCliente, 
c.apeMatCliente, 
c.idTipoCliente,
tc.descTipoCliente, 
c.numDocumento,

grt.nomCliDestinatario,
grt.apepaCliDestinatario,
grt.apemaCliDestinatario,
grt.idTipoDocId,
tdi.descTipoDoc,

grt.numDocCliDestinatario,
grt.direcClienteDestinatario,

grt.fechaMinTraslado,
grt.fechaMaxTraslado,
grt.idEstadoGRT,
egrt.descEstadoGRT

from tb_GRT as grt
inner join tb_cliente as c 
on grt.idCliRemitente=c.idCliente
inner join tb_tipo_cliente as tc
on c.idTipoCliente=tc.idTipoCliente
inner join tb_tipo_documento_identificacion tdi
on grt.idTipoDocId=tdi.idTipoDocId
inner join tb_empleado_conductor as ec
on ec.idEmpleado=grt.idEmpleado
inner join tb_vehiculo as v
on grt.idVeh=v.idVeh
inner join tb_estadoGRT as egrt
on grt.idEstadoGRT=egrt.idEstadoGRT
group by grt.idGRT
);

SELECT*FROM vistaListaGRT where idEmpleado='EMP0005';
SELECT*fROM TB_GRT;
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
select*From vistaListaVehiculos where Estado!='INACTIVO' AND estadoTrabajo!='OCUPADO';

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
select*From vistaListaEmpleados where estado!='INACTIVO' AND descEstado!='OCUPADO' && nomCargo!='ADMINISTRADOR'&& nomCargo!='RECEPCIONISTA';
-- Vista para listar empleados
DROP VIEW IF EXISTS vistaListaClientes;
CREATE VIEW vistaListaClientes
AS
(
SELECT
c.idCliente,
tc.descTipoCliente,
c.nomCliente,
c.apePatCliente,
c.apeMatCliente,
c.telefonoCliente,
c.celularCliente,
c.correoCliente,
e.descEstado
FROM tb_cliente as c
inner join
tb_tipo_cliente as tc
on c.idTipoCliente=tc.idTipoCliente
inner join
tb_estado as e
on c.idEstado=e.idEstado
order by c.idCliente asc
); 

SELECT*FROM vistaListaClientes;

-- -----------------------------------------------------

-- vista para listarUsuarios
DROP VIEW IF EXISTS vistaListaUsuarios;
CREATE VIEW vistaListaUsuarios
AS
(
SELECT
u.idEmpleado,
u.clave,
r.descRol,
e.descEstado
FROM tb_usuario as u
inner join
tb_rol as r
on u.idRol=r.idRol
inner join
tb_estado as e
on u.idEstado=e.idEstado
order by u.idEmpleado asc
); 

SELECT*FROM vistaListaUsuarios;

-- ----------------------------------------------------

DROP VIEW IF EXISTS vistaListaOrdenRecojos;
CREATE VIEW vistaListaOrdenRecojos
AS
(
SELECT
sor.idOR,
sor.idCliente,
sor.direccionRecojo,
sor.fechaRecojo,
sor.horaRecojo,
eor.descEstadoOR,
por.idEmpleado,
sor.idEstadoOR
FROM tb_ordenRecojo as sor
inner join tb_detalle_ordenRecojo as dsor
on sor.idOR=dsor.idOR
inner join tb_equipoPersonal_OrdenRecojo as por
on sor.idOR=por.idOR
inner join tb_empleado as e
on por.idEmpleado=e.idEmpleado
inner join tb_estadoOR as eor
on sor.idEstadoOR=eor.idEstadoOR
where e.idTipoEmpleado=3
group by sor.idOR
); 

SELECT*FROM vistaListaOrdenRecojos where idEmpleado='EMP0004' and idEstadoOR='0';
SELECT*FROM tb_detalle_ordenRecojo;





