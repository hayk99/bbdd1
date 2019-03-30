
CREATE TABLE Equipo (
	nombreCorto		VARCHAR(20) PRIMARY KEY,
	nombreOficial		VARCHAR(50),
	fundacion		NUMBER(4),
	ciudad			VARCHAR(30)
);


CREATE TABLE Partido (
	equipoLocal		references Equipo(nombreCorto),
	equipoVisitante		references Equipo(nombreCorto),
	jornada			references Jornada(numero),
	golesLocal		NUMBER(2),
	golesVisitante		NUMBER(2),
	PRIMARY KEY (equipoLocal,jornada)
);

CREATE TABLE Estadio (
	nombre			VARCHAR(50) PRIMARY KEY,
	equipo			REFERENCES Equipo(nombreCorto),
	inaguracion		NUMBER(4),
	capacidad		NUMBER(6)
);


CREATE TABLE Jornada (
	numero			NUMBER(2),
	equipo			references Equipo(nombreCorto),
	temporada		references Temporada(Temp_k),
	puntos			NUMBER(3),
	puesto			NUMBER(2),
	asciende		BIT,
	desciende		BIT,
	champions		BIT,
	PRIMARY KEY (anyo,liga) 
);

CREATE TABLE Temporada (
	anyo			NUMBER(2),
	liga			references Liga(nombre)
	CONSTRAINT Temp_k PRIMARY KEY (anyo,liga)
);

CREATE TABLE Liga (
	nombre			VARCHAR(20) PRIMARY KEY
);

--Creo que hay que dar permisos de usuarix. 
