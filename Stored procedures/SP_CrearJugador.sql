CREATE OR REPLACE PROCEDURE CrearJugador (Apodo IN VARCHAR2)
IS
BEGIN
	--=====================================================
	--	inserción del nuevo jugador
	--=====================================================
	INSERT 
		INTO Jugador
		(
			IdJugador,
			Apodo
		)
		VALUES
		(
			(SELECT COALESCE(MAX(IdJugador),0) FROM Jugador) + 1,
			Apodo
		);
	--=====================================================
	--	Mensaje de éxito
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('Jugador(a) ' || Apodo || ' cread@');
	EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
		ROLLBACK;
END;
/