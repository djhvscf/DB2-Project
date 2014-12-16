--=====================================================
--	Inicio del bloque PL/SQL, declarando las variables a utilizar
--=====================================================
DECLARE
	Partida 			NUMBER 		:= &partida;
	PosicionOrigenNum 	VARCHAR2(1) := '&PosicionOrigenX';
	PosicionOrigenLet 	VARCHAR2(1) := '&PosicionOrigenY';
	PosicionDestinoNum 	VARCHAR2(1) := '&PosicionDestinoX';
	PosicionDestinoLet 	VARCHAR2(1) := '&PosicionDestinoY';
BEGIN
	--=====================================================
	--	Ejecución del Stored Procedure
	--=====================================================
	MoverPieza(Partida, PosicionOrigenNum, PosicionOrigenLet, PosicionDestinoNum, PosicionDestinoLet);
END;
/