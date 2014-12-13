--=====================================================
--	Inicio del bloque PL/SQL
--=====================================================
DECLARE
BEGIN
--=====================================================
--	inserción del nuevo jugador
--=====================================================
INSERT INTO Jugador
(
IdJugador,
Apodo
)
VALUES
(
(SELECT COALESCE(MAX(IdJugador),0) FROM Jugador) + 1,
'&apodo'
);
--=====================================================
--	Mensaje de éxito
--=====================================================
DBMS_OUTPUT.PUT_LINE('Jugador creado' );
END;
/