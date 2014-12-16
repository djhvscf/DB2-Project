CREATE OR REPLACE PROCEDURE CrearJugador (p_Apodo IN VARCHAR2)
IS
BEGIN
	--=====================================================
	--	Inserción del nuevo jugador
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
			p_Apodo
		);
	COMMIT;
	--=====================================================
	--	Mensaje de éxito
	--=====================================================
	DBMS_OUTPUT.PUT_LINE('Jugador(a) ' || p_Apodo || ' cread@');
	EXCEPTION
		WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
		ROLLBACK;
END;
/