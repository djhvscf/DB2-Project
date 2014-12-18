CREATE OR REPLACE PROCEDURE EstadisticaJugador (p_IdJugador IN NUMBER)
IS
	CURSOR 
		Jugadores 	IS
			SELECT 
					IdJugador, 
					Apodo
			FROM 
					Jugador
			WHERE	
					(IdJugador = p_IdJugador) --Si el IdJugador pasado por parámetro es válido se utiliza esta condición
				OR
					(IdJugador = IdJugador AND p_IdJugador = 0); --	Si el IdJugador pasado por parámetro es inválido se utiliza esta condición
	Id				NUMBER;
	Apodo 			VARCHAR2(100);
	CantPartidas	NUMBER;
	CantPartidasGan	NUMBER;
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
		WHERE
				IdJugador = Player.IdJugador;
		--=====================================================
		--	Se obtiene las partidas jugadas por el jugador actualmente en el ciclo
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
		--	Se obtiene las partidas ganas por el jugador actualmente en el ciclo
		--=====================================================
		SELECT
				COUNT(1)
		INTO 
				CantPartidasGan
		FROM
				JugadorPartida
		WHERE
				IdJugadorGanador = Player.IdJugador;		
		--=====================================================
		--	Mensaje con la información del jugador
		--=====================================================
		DBMS_OUTPUT.PUT_LINE('Identificador: ' || Id );
		DBMS_OUTPUT.PUT_LINE('Apodo: ' || Apodo);
		DBMS_OUTPUT.PUT_LINE('Cantidad de partidas jugadas: ' || CantPartidas);
		DBMS_OUTPUT.PUT_LINE('Cantidad de partidas ganadas: ' || CantPartidasGan);
	END LOOP;
	--=====================================================
	--	Manejo de las excepciones
	--=====================================================
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
			ROLLBACK;
END;
/