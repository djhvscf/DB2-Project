--=====================================================
--	Inicio del bloque PL/SQL
--=====================================================
DECLARE
	CURSOR 
		Jugadores 	IS
			SELECT 
					IdJugador, 
					Apodo
			FROM 
					Jugador;
	Id				NUMBER;
	Apodo 			VARCHAR2(100);
	CantPartidas	NUMBER;
BEGIN
--=====================================================
--	Inicio del cursor en un LOOP
--=====================================================
FOR Player IN Jugadores
LOOP 
--=====================================================
--	Separador entre los registros a mostrar
--=====================================================
DBMS_OUTPUT.PUT_LINE('-----------------');
--=====================================================
--	Se obtiene la información de cada jugador en el cursor
--=====================================================
SELECT 
		IdJugador,
		Apodo
INTO
		Id,
		Apodo
FROM
		Jugador
WHERe
		IdJugador = Player.IdJugador;
--=====================================================
--	Se obtiene la partidas jugadas por el jugador actualmente en el ciclo
--=====================================================	
SELECT
		COUNT(1)
INTO 
		CantPartidas
FROM
		JugadorPartida
WHERE
		IdJugador = Player.IdJugador;
--=====================================================
--	Mensaje con la información del jugador
--=====================================================
DBMS_OUTPUT.PUT_LINE('Id único: ' || Id );
DBMS_OUTPUT.PUT_LINE('Apodp: ' || Apodo);
DBMS_OUTPUT.PUT_LINE('Cantidad de partidas jugadas: ' || CantPartidas);

EXCEPTION
		WHEN 
			NO_DATA_FOUND 
		THEN
			DBMS_OUTPUT.PUT_LINE('Id único: ' || Id );
			DBMS_OUTPUT.PUT_LINE('Apodp: ' || Apodo);
			DBMS_OUTPUT.PUT_LINE('Cantidad de partidas jugadas: 0');
	   CONTINUE;
END; 

END LOOP;
END;
/