CREATE OR REPLACE PROCEDURE CrearPartida (IdJugador1 IN NUMBER, IdJugador2 IN NUMBER, NombrePartida IN VARCHAR2)
IS
	IdPartidaNew NUMBER;
BEGIN
	--=====================================================
	--	Selección del siguiente Id Partida
	--=====================================================
	SELECT 
			COALESCE(MAX(IdPartida),0) + 1 
	INTO 	IdPartidaNew 
	FROM 
			Partida;
	--=====================================================
	--	Inserción de la nueva partida
	--=====================================================
	INSERT 
		INTO Partida
		(
			IdPartida,
			Nombre,
			FechaCreacion
		)
		VALUES
		(
			IdPartidaNew,
			NombrePartida,
			SYSDATE()
		);
	--=====================================================
	--	Inserción de los jugadores pertenecientes a esa partida
	--=====================================================
	INSERT 
		INTO JugadorPartida
		(
			IdJugador,
			IdPartida
		)
		VALUES
		(
			IdJugador1,
			IdPartidaNew
		);
	INSERT 
		INTO JugadorPartida
		(
			IdJugador,
			IdPartida
		)
		VALUES
		(
			IdJugador2,
			IdPartidaNew
		);
	--=====================================================
	--	Mensaje de éxito
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('Partida creada' );
	EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
		ROLLBACK;
END;
/