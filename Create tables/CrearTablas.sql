--=====================================================
--	Creación de la tabla Jugador
--=====================================================
CREATE TABLE Jugador 
( 
	IdJugador      	NUMBER NOT NULL PRIMARY KEY		,
	Apodo    		VARCHAR2(100) 					
);

--=====================================================
--	Creación de la tabla Partida
--=====================================================
CREATE TABLE Partida
(
	IdPartida		NUMBER NOT NULL PRIMARY KEY		,
	Nombre			VARCHAR2(100)					,
	FechaCreacion	DATE							,
	Turno			NUMBER NOT NULL					,
	IsFinalizada	NUMBER						
);

--=====================================================
--	Creación de la tabla JugadorPartida
--=====================================================
CREATE TABLE JugadorPartida
(
	IdJugador			NUMBER NOT NULL					,
	IdPartida			NUMBER NOT NULL					,
	Color				VARCHAR(50)						,
	IdJugadorGanador	NUMBER							,
	PRIMARY KEY		(IdJugador, IdPartida)
);

--=====================================================
--	Creación de la tabla Pieza
--=====================================================
CREATE TABLE Pieza
(
	IdPieza			NUMBER NOT NULL					,
	IdPartida		NUMBER NOT NULL					,
	Nombre			VARCHAR2(100)					,
	PosicionX		VARCHAR2(3)						,
	PosicionY		VARCHAR2(3)						,
	Color			CHAR(2)							,
	PRIMARY KEY		(IdPieza, IdPartida)
);

--=====================================================
--	Modificación de la tabla Pieza para aregar un CONSTRAINT
--=====================================================
ALTER TABLE Pieza
ADD 
( 
	CONSTRAINT pieza_part_fk
	FOREIGN KEY (IdPartida)
	REFERENCES Partida(IdPartida) 
);