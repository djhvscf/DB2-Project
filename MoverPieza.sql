--=====================================================
--	Inicio del bloque PL/SQL, declarando las variables a utilizar
--=====================================================
DECLARE
	Partida 			NUMBER 		:= &partida;
	PosicionOrigenNum 	VARCHAR2(1) := '&PosicionOrigenX';
	PosicionOrigenLet 	VARCHAR2(1) := '&PosicionOrigenY';
	PosicionDestinoNum 	VARCHAR2(1) := '&PosicionDestinoX';
	PosicionDestinoLet 	VARCHAR2(1) := '&PosicionDestinoY';
	IsFinalizadaPart	NUMBER;
BEGIN
	--=====================================================
	--	Validación si la partida está finalizada
	--=====================================================
	SELECT
			IsFinalizada
	INTO
			IsFinalizadaPart
	FROM
			Partida
	WHERE
			IdPartida = Partida;
			
	IF IsFinalizadaPart = 1 
	THEN
		DBMS_OUTPUT.PUT_LINE('La partida ' || Partida || ' ya está finalizada');
	ELSE
		--=====================================================
		--	Ejecución del Stored Procedure
		--=====================================================
		MoverPieza(Partida, PosicionOrigenNum, PosicionOrigenLet, PosicionDestinoNum, PosicionDestinoLet);
	END IF;
END;
/