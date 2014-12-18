--=====================================================
--	Inserción de jugadores
--=====================================================
Prompt ******  Jugadores ....
INSERT 
	INTO Jugador
	(
		IdJugador,
		Apodo
	)
	VALUES
	(
		1,
		'Fabricio'
	);
	
INSERT 
	INTO Jugador
	(
		IdJugador,
		Apodo
	)
	VALUES
	(
		2,
		'Pedro'
	);
	
INSERT 
	INTO Jugador
	(
		IdJugador,
		Apodo
	)
	VALUES
	(
		3,
		'Alejandro'
	);
	
INSERT 
	INTO Jugador
	(
		IdJugador,
		Apodo
	)
	VALUES
	(
		4,
		'Guillermo'
	);
--=====================================================
--	Inserción de partidas
--=====================================================
Prompt ******  Partidas ....
INSERT 
	INTO Partida
	(
		IdPartida,
		Nombre,
		FechaCreacion,
		Turno
	)
	VALUES
	(
		1,
		'Partida1',
		SYSDATE,
		0
	);

INSERT 
	INTO Partida
	(
		IdPartida,
		Nombre,
		FechaCreacion,
		Turno
	)
	VALUES
	(
		2,
		'Partida2',
		SYSDATE,
		0
	);
--=====================================================
--	Inserción de Jugadores en cada partida
--=====================================================
Prompt ******  Jugadores en la partida....
INSERT 
	INTO JugadorPartida
	(
		IdJugador,
		IdPartida,
		Color
	)
	VALUES
	(
		1,
		1,
		'Blancas'
	);
	
INSERT 
	INTO JugadorPartida
	(
		IdJugador,
		IdPartida,
		Color
	)
	VALUES
	(
		2,
		1,
		'Negras'
	);
--=====================================================
--	Inserción de piezas
--=====================================================
-- 	Piezas blancas
--=====================================================
Prompt ******  Piezas blancas....
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		1,
		1,
		'Rey',
		'1',
		'e',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		2,
		1,
		'Dama',
		'1',
		'd',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		3,
		1,
		'Torre',
		'1',
		'a',
		'B'
	);

INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		4,
		1,
		'Torre',
		'1',
		'h',
		'B'
	);	
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		5,
		1,
		'Alfil',
		'1',
		'c',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		6,
		1,
		'Alfil',
		'1',
		'f',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		7,
		1,
		'Caballo',
		'1',
		'b',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		8,
		1,
		'Caballo',
		'1',
		'g',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		9,
		1,
		'Peon',
		'2',
		'a',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		10,
		1,
		'Peon',
		'2',
		'b',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		11,
		1,
		'Peon',
		'2',
		'c',
		'B'
	);

INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		12,
		1,
		'Peon',
		'2',
		'd',
		'B'
	);

INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		13,
		1,
		'Peon',
		'2',
		'e',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		14,
		1,
		'Peon',
		'2',
		'f',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		15,
		1,
		'Peon',
		'2',
		'g',
		'B'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		16,
		1,
		'Peon',
		'2',
		'h',
		'B'
	);
--=====================================================
-- 	Piezas negras
--=====================================================
Prompt ******  Piezas negras ....
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		17,
		1,
		'Rey',
		'8',
		'e',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		18,
		1,
		'Dama',
		'8',
		'd',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		19,
		1,
		'Torre',
		'8',
		'a',
		'N'
	);

INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		20,
		1,
		'Torre',
		'8',
		'h',
		'N'
	);	
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		21,
		1,
		'Alfil',
		'8',
		'c',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		22,
		1,
		'Alfil',
		'8',
		'f',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		23,
		1,
		'Caballo',
		'8',
		'b',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		24,
		1,
		'Caballo',
		'8',
		'g',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		25,
		1,
		'Peon',
		'7',
		'a',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		26,
		1,
		'Peon',
		'7',
		'b',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		27,
		1,
		'Peon',
		'7',
		'c',
		'N'
	);

INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		28,
		1,
		'Peon',
		'7',
		'd',
		'N'
	);

INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		29,
		1,
		'Peon',
		'7',
		'e',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		30,
		1,
		'Peon',
		'7',
		'f',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		31,
		1,
		'Peon',
		'7',
		'g',
		'N'
	);
	
INSERT 
	INTO Pieza
	(
		IdPieza,
		IdPartida,
		Nombre,
		PosicionX,
		PosicionY,
		Color
	)
	VALUES
	(
		32,
		1,
		'Peon',
		'7',
		'h',
		'N'
	);