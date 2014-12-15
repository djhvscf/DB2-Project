--=====================================================
--	Inicio del bloque PL/SQL, declarando las variables a utilizar
--=====================================================
DECLARE
	IdJugador NUMBER := 0;
BEGIN
	--=====================================================
	--	Linea para que el usuario ingrese el Id del jugador
	--	Opcioones:
	--	0:	Todos los jugadores
	--	IdJugador:	Id del jugador específico del que se desea ver la información
	--=====================================================
	IdJugador := &IdJugador;
	--=====================================================
	--	Ejecución del Stored Procedure
	--=====================================================
	EstadisticaJugador(IdJugador);
END;
/