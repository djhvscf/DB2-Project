CREATE OR REPLACE FUNCTION EncontrarPiezaColor(p_IdPartida IN NUMBER, p_IdPieza IN NUMBER)
RETURN CHAR IS
	ColorAct CHAR(2);
BEGIN
	--=====================================================
	--	Búsqueda de la pieza por posición X - Y y Id partida
	--=====================================================
	SELECT
			Color
	INTO
			ColorAct
	FROM	
			Pieza
	WHERE
			IdPartida = p_IdPartida
		AND 
			IdPieza = p_IdPieza;

	RETURN ColorAct;
	--=====================================================
	--	Manejo de las excepciones
	--=====================================================
	EXCEPTION
		WHEN NO_DATA_FOUND THEN			
			DBMS_OUTPUT.PUT_LINE('No existe ninguna pieza con el ID: ' || p_IdPieza);
			RETURN '';
			ROLLBACK;
END EncontrarPiezaColor;
/