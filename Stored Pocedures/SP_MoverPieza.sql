CREATE OR REPLACE PROCEDURE MoverPieza (p_IdPartida IN NUMBER, p_PosicionOrigenNum IN VARCHAR2, p_PosicionOrigenLet IN VARCHAR2, 
										p_PosicionDestinoNum IN VARCHAR2, p_PosicionDestinoLet IN VARCHAR2)
IS
	NombrePieza 	VARCHAR2(100);
	IdPiezaAct		NUMBER := 0;
	IdPiezaExiste 	NUMBER := 0;
	PosicionOcupada	EXCEPTION;
BEGIN
	--=====================================================
	--	Búsqueda de una pieza en la posición solicitada
	--=====================================================
	IdPiezaExiste := EncontrarIdPieza(p_IdPartida, p_PosicionDestinoNum, p_PosicionDestinoLet, 1);
	IF IdPiezaExiste > 0
	THEN
		RAISE PosicionOcupada;
	END IF;
	--=====================================================
	--	Búsqueda de la pieza por posición X - Y
	--=====================================================
	--	Ejecución de Stored Functions
	--=====================================================
	IdPiezaAct := EncontrarIdPieza(p_IdPartida, p_PosicionOrigenNum, p_PosicionOrigenLet, 0);
	NombrePieza := EncontrarNombrePieza(IdPiezaAct);
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
	COMMIT;
	--=====================================================
	--	Mensaje de éxito
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('Moviendo la pieza: ' || NombrePieza || ' ' || UPPER(p_PosicionOrigenNum) || UPPER(p_PosicionOrigenLet) || '-' || UPPER(p_PosicionDestinoNum) || UPPER(p_PosicionDestinoLet));
	--=====================================================
	--	Manejo de excepciones
	--=====================================================
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No existe ninguna pieza en la posición: ' || UPPER(p_PosicionOrigenNum) || UPPER(p_PosicionOrigenLet));
			ROLLBACK;
		WHEN PosicionOcupada THEN
			DBMS_OUTPUT.PUT_LINE('Ya existe la pieza ' || EncontrarNombrePieza(IdPiezaExiste) ||' en la posición: ' || UPPER(p_PosicionDestinoNum) || '-' || UPPER(p_PosicionDestinoLet));
			ROLLBACK;
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
			ROLLBACK;
END;
/