--=====================================================
--	Inicio del bloque PL/SQL, declarando las variables a utilizar
--=====================================================
DECLARE
	IdPartidaAct NUMBER := &IdPartida;
BEGIN
	--=====================================================
	--	Ejecución del Stored Procedure
	--=====================================================
	MostrarTablero(IdPartidaAct);
END;
/