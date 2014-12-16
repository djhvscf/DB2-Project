CREATE OR REPLACE FUNCTION EncontrarNombrePieza(p_IdPieza IN NUMBER)
RETURN VARCHAR2 IS
	NombrePieza VARCHAR2(100);
BEGIN
	SELECT
			Nombre
	INTO
			NombrePieza
	FROM	
			Pieza
	WHERE
			IdPieza = p_IdPieza;

	RETURN NombrePieza;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No existe ninguna pieza con el ID: ' || p_IdPieza);
END EncontrarNombrePieza;
/