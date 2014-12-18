CREATE OR REPLACE PROCEDURE MostrarTablero (p_IdPartida IN NUMBER)
IS
	Color				VARCHAR2(50);
	JugadoresPartida	VARCHAR2(100);	
	JugadorColor		VARCHAR2(500);
	Piezas 				VARCHAR2(6000);
	TurnoPart			NUMBER;
	ColorAct			VARCHAR2(50);
	IsFinalizadaPart	NUMBER;	
	MensajeMueveFin		VARCHAR2(100);
	TYPE Columnas 		IS VARRAY(8) OF VARCHAR2(10);	
	TYPE Filas 			IS VARRAY(8) OF VARCHAR2(10);
	Cols 	Columnas;
	Lines 	Filas;
	Total 	NUMBER;
	CURSOR 
		Jugadores 	IS
			SELECT 
					j.IdJugador, 
					j.Apodo
			FROM 
					Jugador j
			JOIN
					JugadorPartida jp
				ON	jp.IdJugador = j.IdJugador
			WHERE	
					jp.IdPartida = p_IdPartida;
BEGIN
	FOR Player IN Jugadores
	LOOP 
		--=====================================================
		--	Búsqueda del nombre del jugador
		--=====================================================
		SELECT 
				Apodo
		INTO
				JugadoresPartida
		FROM
				Jugador
		WHERE
				IdJugador = Player.IdJugador;
		--=====================================================
		--	Búsqueda del color
		--=====================================================
		SELECT
				Color
		INTO
				Color
		FROM 	JugadorPartida
		WHERE 	IdPartida = p_IdPartida
			AND IdJugador = Player.IdJugador;
		--=====================================================
		--	Concatenación de la información de los jugadores de la partida
		--=====================================================
		JugadorColor := JugadorColor || Color || ': ' || JugadoresPartida || '       ';
	END LOOP;
	--=====================================================
	--	Selección del siguiente turno
	--=====================================================
	SELECT 
			Turno 
	INTO 	
			TurnoPart 
	FROM 	
			Partida 
	WHERE 	IdPartida = p_IdPartida;
	
	IF TurnoPart = 0
	THEN
		ColorAct := 'Negras';
	ELSE
		ColorAct := 'Blancas';
	END IF;	
	--=====================================================
	--	Se verifica si la partida ya fue finalizada
	--=====================================================
	SELECT 
			IsFinalizada
	INTO
			IsFinalizadaPart
	FROM
			Partida
	WHERE 	IdPartida = p_IdPartida;	
	
	IF IsFinalizadaPart = 1
	THEN
		MensajeMueveFin := 'Partida finalizada';
	ELSE
		MensajeMueveFin := '      Mueven:' || ColorAct;
	END IF;
	--=====================================================
	--	Separador entre los registros a mostrar
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
	--=====================================================
	--	Mensaje con la información de los jugadores de la partida
	--=====================================================
	DBMS_OUTPUT.PUT_LINE(JugadorColor || MensajeMueveFin);
	--=====================================================
	--	Se muestra el tablero
	--=====================================================
	--	Se inicializan los arreglos que contienen las filas y columnas
	--=====================================================
	Cols 	:= Columnas('a', 'b', 'c', 'd', 'e', 'f','g','h');
	Lines 	:= Filas ('1','2','3','4','5','6','7','8');
	Total 	:= Cols.count;
	--=====================================================
	--	Inicio de impresión del tablero en consola
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('___________________________________');
	--=====================================================
	--	Ciclo de las filas
	--=====================================================
	FOR i in 1 .. Total LOOP
		Piezas := '';
		Piezas := i || ' | ';
		--=====================================================
		--	Ciclo de las columnas
		--=====================================================
		FOR j IN 1 .. Total LOOP
			Piezas := Piezas || LPAD(RPAD(SUBSTR(EncontrarNombrePieza(EncontrarIdPieza(p_IdPartida, lines(i), Cols(j), 1), 1), 0, 1)  || ' | ',4),4);
		END LOOP;
		--=====================================================
		--	Impresión de las piezas en la fila actual del ciclo
		DBMS_OUTPUT.PUT_LINE(Piezas);
		DBMS_OUTPUT.PUT_LINE('__|___|___|___|___|___|___|___|___|');
	END LOOP;
	--=====================================================
	--	Impresión de las columnas para referencia
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('__|_A___B___C___D___E___F___G___H_|');
END;
/