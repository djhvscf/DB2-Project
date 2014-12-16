CREATE OR REPLACE PROCEDURE CrearPartida (p_IdJugador1 IN NUMBER, p_IdJugador2 IN NUMBER, p_NombrePartida IN VARCHAR2)
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
			p_NombrePartida,
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
			p_IdJugador1,
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
			p_IdJugador2,
			IdPartidaNew
		);
	
	CrearPieza(IdPartidaNew);
	COMMIT;
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