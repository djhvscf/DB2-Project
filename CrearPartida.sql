--=====================================================
--	Declaración de variables usadas en el bloque PL/SQL
--=====================================================
DECLARE
Jugador1  NUMBER;
Jugador2  NUMBER;
IdPartidaNew NUMBER;
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
--	Selección del siguiente Id Partida
--=====================================================
SELECT 
		COALESCE(MAX(IdPartida),0) 
INTO 	IdPartidaNew 
FROM 
		Partida;
--=====================================================
--	Sección de validaciones
--=====================================================
IF IdPartidaNew = 0
THEN
IdPartidaNew := 1;
ELSE
IdPartidaNew := IdPartidaNew + 1;
END IF;
--=====================================================
--	inserción de la nueva partida
--=====================================================
INSERT INTO Partida
(
IdPartida,
Nombre,
FechaCreacion
)
VALUES
(
IdPartidaNew,
'&nombre',
SYSDATE()
);
--=====================================================
--	Inserción de los jugadores pertenecientes a esa partida
--=====================================================
INSERT INTO JugadorPartida
(
IdJugador,
IdPartida
)
VALUES
(
Jugador1,
IdPartidaNew
);
INSERT INTO JugadorPartida
(
IdJugador,
IdPartida
)
VALUES
(
Jugador2,
IdPartidaNew
);
--=====================================================
--	Mensaje de éxito
--=====================================================
DBMS_OUTPUT.PUT_LINE('Partida creada' );
END;
/