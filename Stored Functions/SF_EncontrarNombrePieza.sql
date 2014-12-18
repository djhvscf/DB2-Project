CREATE OR REPLACE FUNCTION EncontrarNombrePieza(p_IdPieza IN NUMBER, p_IsExistePieza IN NUMBER)
RETURN VARCHAR2 IS
	NombrePieza VARCHAR2(100);
	WhiteSpace 	VARCHAR2(3) := '   ';
BEGIN
	--=====================================================
	--	Búsqueda de la pieza por posición X - Y y Id partida
	--=====================================================
	SELECT
			Nombre
	INTO
			NombrePieza
	FROM	
			Pieza
	WHERE
			IdPieza = p_IdPieza;

	RETURN NombrePieza;
	--=====================================================
	--	Manejo de las excepciones
	--=====================================================
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			IF p_IsExistePieza = 1
			THEN
				RETURN WhiteSpace;
			ELSE
				DBMS_OUTPUT.PUT_LINE('No existe ninguna pieza con el ID: ' || p_IdPieza);
			END IF;
END EncontrarNombrePieza;
/