CREATE OR REPLACE FUNCTION EncontrarIdPieza(p_IdPartida IN NUMBER, p_PosicionX IN VARCHAR2, p_PosicionY IN VARCHAR2, p_IsExistePieza IN NUMBER)
RETURN NUMBER IS
	IdPiezaAct NUMBER := 0;
BEGIN
	--=====================================================
	--	Búsqueda de la pieza por posición X - Y y Id partida
	--=====================================================
	SELECT
			IdPieza
	INTO
			IdPiezaAct
	FROM	
			Pieza
	WHERE
			IdPartida = p_IdPartida
		AND 
			PosicionX = p_PosicionX 
		AND 
			PosicionY = p_PosicionY;

	RETURN IdPiezaAct;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			IF p_IsExistePieza = 1
			THEN
				RETURN 0;
			ELSE
				DBMS_OUTPUT.PUT_LINE('No existe ninguna pieza en la posición: ' || p_PosicionX || p_PosicionY);
			END IF;
END EncontrarIdPieza;
/