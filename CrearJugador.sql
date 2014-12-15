--=====================================================
--	Inicio del bloque PL/SQL, declarando las variables a utilizar
--=====================================================
DECLARE
	Apodo VARCHAR2(100) := '';
BEGIN
	--=====================================================
	--	Linea para que el usuario ingrese el nombre del nuevojugador
	--=====================================================
	Apodo := '&Apodo';
	--=====================================================
	--	Ejecución del Stored Procedure
	--=====================================================
	CrearJugador(Apodo);
END;
/