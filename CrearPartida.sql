--=====================================================
--	Declaración de variables usadas en el bloque PL/SQL
--=====================================================
DECLARE
	Jugador1  NUMBER;
	Jugador2  NUMBER;
	NombrePartida VARCHAR(100);
BEGIN
	--=====================================================
	--	Selección del Id del jugador número 1
	--=====================================================
	SELECT 
			IdJugador 
	INTO 	Jugador1 
	FROM 	
			Jugador 
	WHERE 
			UPPER(Apodo) = UPPER('&apodo');
	--=====================================================
	--	Selección del Id del jugador número 2
	--=====================================================
	SELECT 
			IdJugador 
	INTO 	Jugador2 
	FROM 
			Jugador 
	WHERE 
			UPPER(Apodo) = UPPER('&apodo');
	--=====================================================
	--	Ingreso del nombre de la partida por parte del usuario
	--=====================================================
	NombrePartida := '&NombrePartida';
	--=====================================================
	--	Ejecución del Stored Procedure
	--=====================================================
	CrearPartida(Jugador1, Jugador2, NombrePartida);
	--=====================================================
	--	Manejo de las excepciones
	--=====================================================
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Uno o ambos jugadoes no están registrados');
			ROLLBACK;
END;
/