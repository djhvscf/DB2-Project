CREATE OR REPLACE PROCEDURE MoverPieza (p_IdPartida IN NUMBER, p_PosicionOrigenNum IN VARCHAR2, p_PosicionOrigenLet IN VARCHAR2, 
										p_PosicionDestinoNum IN VARCHAR2, p_PosicionDestinoLet IN VARCHAR2)
IS
	NombrePieza 		VARCHAR2(100);
	NombrePiezaEliminar	VARCHAR2(100);
	IdJugadorGanadorAct	NUMBER;
	IdPiezaAct			NUMBER := 0;
	IdPiezaExiste 		NUMBER := 0;
	TurnoAct			NUMBER;	
	TurnoSig			NUMBER;
	ColorAct			CHAR(2);
	ColorPiezaExiste	CHAR(2);	
	ColorPiezaComplete	VARCHAR2(100);
	Rey					VARCHAR2(100) := 'Rey';
	PosicionOcupada		EXCEPTION;
BEGIN
	--=====================================================
	--	Selección del turno actual
	--=====================================================
	SELECT 
			Turno 
	INTO 
			TurnoAct 
	FROM 
			Partida 
	WHERE 	IdPartida = p_IdPartida;
	
	IF TurnoAct = 0
	THEN
		ColorAct := 'B';
		TurnoSig := 1;
	ELSE
		ColorAct := 'N';
		TurnoSig := 0;
	END IF;
	--=====================================================
	--	Búsqueda de una pieza en la posición solicitada
	--=====================================================
	IdPiezaExiste := EncontrarIdPieza(p_IdPartida, p_PosicionDestinoNum, p_PosicionDestinoLet, 1);
	IF IdPiezaExiste > 0
	THEN
		--=====================================================
		--	Se obtiene el colo de la pieza
		--=====================================================
		ColorPiezaExiste := EncontrarPiezaColor(p_IdPartida, IdPiezaExiste);
		--=====================================================
		--	Si el color de la pieza en la posición destino es igual al de la pieza que se desea mover
		--=====================================================
		IF ColorPiezaExiste = ColorAct
		THEN
			RAISE PosicionOcupada;
		ELSE
			--=====================================================
			--	Se obtiene el nombre de la pieza
			--=====================================================
			NombrePiezaEliminar := EncontrarNombrePieza(IdPiezaExiste, 0);
			--=====================================================
			--	Se elimina la pieza 'comida'
			--=====================================================
			DELETE 
				FROM 
						Pieza 
				WHERE 	IdPieza = IdPiezaExiste 
					AND IdPartida = p_IdPartida;					
			--=====================================================
			--	Si la pieza es Rey, se termina la partida
			--=====================================================
			IF NombrePiezaEliminar = Rey
			THEN
				--=====================================================
				--	Se obtiene el color del jugador que acaba de mover
				--=====================================================
				IF ColorPiezaExiste = 'N'
				THEN
					ColorPiezaComplete := 'Negras';
				ELSE
					ColorPiezaComplete := 'Blancas';
				END IF;
				--=====================================================
				--	Se obtiene el IdJugador del jugador ganador
				--=====================================================
				SELECT 
						IdJugador 
				INTO 	
						IdJugadorGanadorAct 
				FROM 	
						JugadorPartida 
				WHERE IdPartida = p_IdPartida 
					AND Color = ColorPiezaComplete;
				--=====================================================
				--	Se actualiza la partida a Finalizada
				--=====================================================
				UPDATE
						Partida
				SET		IsFinalizada     = 1
				WHERE	IdPartida = p_IdPartida;
				--=====================================================
				--	Se actualiza el jugador ganador de la partida
				--=====================================================
				UPDATE
						JugadorPartida
				SET		IdJugadorGanador = IdJugadorGanadorAct
				WHERE	IdPartida = p_IdPartida
					AND	IdJugador = IdJugadorGanadorAct;
				--=====================================================
				--	Actualización de la posición de la pieza que 'comió'
				--=====================================================
				IdPiezaAct := EncontrarIdPieza(p_IdPartida, p_PosicionOrigenNum, p_PosicionOrigenLet, 0);
				NombrePieza := EncontrarNombrePieza(IdPiezaAct, 0);
				--=====================================================
				--	Actualización de la posición de la pieza
				--=====================================================
				UPDATE 
						Pieza
				SET 	PosicionX = p_PosicionDestinoNum,
						PosicionY = p_PosicionDestinoLet
				WHERE 	IdPartida = p_IdPartida
					AND
						IdPieza = IdPiezaAct;
				--=====================================================
				--	Mensajes de éxito
				--=====================================================
				DBMS_OUTPUT.PUT_LINE('Pieza: ' || NombrePiezaEliminar || ' - Color: ' || ColorPiezaExiste || ' eliminada');
				DBMS_OUTPUT.PUT_LINE('Partida finalizada');
				COMMIT;
				RETURN;
			END IF;
		END IF;
	END IF;
	--=====================================================
	--	Búsqueda de la pieza por posición X - Y
	--=====================================================
	--	Ejecución de Stored Functions
	--=====================================================
	IdPiezaAct := EncontrarIdPieza(p_IdPartida, p_PosicionOrigenNum, p_PosicionOrigenLet, 0);
	NombrePieza := EncontrarNombrePieza(IdPiezaAct, 0);
	--=====================================================
	--	Actualización de la posición de la pieza
	--=====================================================
	UPDATE 
			Pieza
	SET 	PosicionX = p_PosicionDestinoNum,
			PosicionY = p_PosicionDestinoLet
	WHERE 	IdPartida = p_IdPartida
		AND
			IdPieza = IdPiezaAct;
	--=====================================================
	--	Actualización del turno de la partida
	--=====================================================
	UPDATE
			Partida
	SET		Turno = TurnoSig
	WHERE	IdPartida = p_IdPartida;
	
	COMMIT;
	--=====================================================
	--	Mensaje de éxito
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('Moviendo la pieza: ' || NombrePieza || ' ' || UPPER(p_PosicionOrigenNum) || UPPER(p_PosicionOrigenLet) || '-' || UPPER(p_PosicionDestinoNum) || UPPER(p_PosicionDestinoLet));
	--=====================================================
	--	Manejo de las excepciones
	--=====================================================
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No existe ninguna pieza en la posición: ' || UPPER(p_PosicionOrigenNum) || UPPER(p_PosicionOrigenLet));
			ROLLBACK;
		WHEN PosicionOcupada THEN
			DBMS_OUTPUT.PUT_LINE('Ya existe la pieza ' || EncontrarNombrePieza(IdPiezaExiste, 0) ||' en la posición: ' || UPPER(p_PosicionDestinoNum) || '-' || UPPER(p_PosicionDestinoLet));
			ROLLBACK;
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
			ROLLBACK;
END;
/