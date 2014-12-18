CREATE OR REPLACE PROCEDURE CrearPieza (p_IdPartida IN NUMBER)
IS
BEGIN
	--=====================================================
	--	Inserción de las piezas de la partida
	--=====================================================
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
			'Peon',
			'2',
			'h',
			'B'
		);
	--=====================================================
	-- 	Piezas negras
	--=====================================================
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
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
			(SELECT COALESCE(MAX(IdPieza),0) FROM Pieza) + 1,
			p_IdPartida,
			'Peon',
			'7',
			'h',
			'N'
		);
	COMMIT;
	--=====================================================
	--	Manejo de las excepciones
	--=====================================================
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error!');
			ROLLBACK;
END;
/