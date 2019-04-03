
CREATE TABLE Equipo (
	nombreCorto		VARCHAR(20) PRIMARY KEY,
	nombreOficial		VARCHAR(50),
	fundacion		NUMBER(4),
	ciudad			VARCHAR(30)
);

CREATE TABLE Liga (
	nombre			VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Temporada (
	anyos			VARCHAR(9),
	liga			VARCHAR(30) ,
	CONSTRAINT Temp_k PRIMARY KEY (anyos,liga),
	CONSTRAINT liga	FOREIGN KEY(liga) REFERENCES Liga(nombre) 
);

CREATE TABLE Jornada (
	numero			NUMBER(2),
	nomEquipo		VARCHAR(20),
	anyos			VARCHAR(9),
	liga			VARCHAR(30),
	puntos			NUMBER(3),
	puesto			NUMBER(2),
	asciende		VARCHAR(1),
	playoff			VARCHAR(1),
	desciende		VARCHAR(1),
	champions		VARCHAR(1),
	europa			VARCHAR(1),
	CONSTRAINT Jor_k PRIMARY KEY (numero,nomEquipo,anyos,liga),
	CONSTRAINT nom_k FOREIGN KEY(nomEquipo) REFERENCES Equipo(nombreCorto),
	CONSTRAINT Temp_kk FOREIGN KEY(anyos,liga) REFERENCES Temporada(anyos,liga)
);

CREATE TABLE Partido (
	equipoLocal						VARCHAR(20),
	equipoVisitante						VARCHAR(20),
	numero							NUMBER(2),
	equipo							VARCHAR(20),
	anyos							VARCHAR(9),
	liga							VARCHAR(30),
	golesLocal						NUMBER(2),
	golesVisitante						NUMBER(2),
	CONSTRAINT Par_k PRIMARY KEY (equipoLocal,numero,equipo,anyos,liga),
	CONSTRAINT eql_k FOREIGN KEY(equipoLocal) REFERENCES Equipo(nombreCorto),
	CONSTRAINT eqv_k FOREIGN KEY(equipoVisitante) REFERENCES Equipo(nombreCorto),
	CONSTRAINT mon_k FOREIGN KEY(numero,equipo,anyos,liga) REFERENCES Jornada(numero,nomEquipo,anyos,liga)
);

CREATE TABLE Estadio (
	nombre			VARCHAR(50) PRIMARY KEY,
	nomEquipo		REFERENCES Equipo(nombreCorto),
	inaguracion		NUMBER(4),
	capacidad		NUMBER(6)
);






