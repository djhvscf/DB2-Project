--=====================================================
--	Declaración de variables usadas en el bloque PL/SQL
--=====================================================
DECLARE
	Jugador1  NUMBER;
	Jugador2  NUMBER;
	NombrePartida VARCHAR(100);
BEGIN
	--=====================================================
	--	Selección del nombre del jugador número 1
	--=====================================================
	SELECT 
			IdJugador 
	INTO 	Jugador1 
	FROM 	
			Jugador 
	WHERE 
			UPPER(Apodo) = UPPER('&apodo');
	--=====================================================
	--	Selección del nombre del jugador número 2
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
END;
/