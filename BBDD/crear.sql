
CREATE TABLE Equipo (
	nombreCorto		VARCHAR(20) PRIMARY KEY,
	nombreOficial		VARCHAR(50) NOT NULL,
	fundacion		NUMBER(4) NOT NULL,
	ciudad			VARCHAR(30) NOT NULL 
);

CREATE TABLE Liga (
	nombre			VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Temporada (
	anyos			NUMBER(4),
	liga			VARCHAR(30),
	CONSTRAINT Temp_k PRIMARY KEY (anyos,liga),
	CONSTRAINT liga	FOREIGN KEY(liga) REFERENCES Liga(nombre) 
);

CREATE TABLE Jornada (
	numero			NUMBER(2) CHECK(numero>0),
	nomEquipo		VARCHAR(20),
	anyos			NUMBER(4),
	liga			VARCHAR(30),
	puntos			NUMBER(3),
	puesto			NUMBER(2),
	asciende		VARCHAR(1) NOT NULL,
	playoff			VARCHAR(1) NOT NULL,
	desciende		VARCHAR(1) NOT NULL,
	champions		VARCHAR(1) NOT NULL,
	europa			VARCHAR(1) NOT NULL,
	CONSTRAINT Jor_k PRIMARY KEY (numero,nomEquipo,anyos,liga),
	CONSTRAINT nom_k FOREIGN KEY(nomEquipo) REFERENCES Equipo(nombreCorto),
	CONSTRAINT Temp_kk FOREIGN KEY(anyos,liga) REFERENCES Temporada(anyos,liga)
);

CREATE TABLE Partido (
	equipoLocal						VARCHAR(20),
	equipoVisitante						VARCHAR(20),
	numero							NUMBER(2),
	equipo							VARCHAR(20),
	anyos							NUMBER(4),
	liga							VARCHAR(30),
	golesLocal						NUMBER(2) NOT NULL CHECK (golesLocal>=0),
	golesVisitante						NUMBER(2) NOT NULL CHECK (golesVisitante>=0),
	CONSTRAINT chk_eq CHECK (equipoLocal!=equipoVisitante),
	CONSTRAINT Par_k PRIMARY KEY (equipoLocal,numero,equipo,anyos,liga),
	CONSTRAINT eql_k FOREIGN KEY(equipoLocal) REFERENCES Equipo(nombreCorto),
	CONSTRAINT eqv_k FOREIGN KEY(equipoVisitante) REFERENCES Equipo(nombreCorto),
	CONSTRAINT mon_k FOREIGN KEY(numero,equipo,anyos,liga) REFERENCES Jornada(numero,nomEquipo,anyos,liga)
);

CREATE TABLE Estadio (
	nombre			VARCHAR(50) PRIMARY KEY,
	inaguracion		NUMBER(4) NOT NULL,
	capacidad		NUMBER(6) CHECK (capacidad>0)
);


CREATE TABLE Tiene (
	estadio			VARCHAR(50),
	equipo			VARCHAR(20),
	CONSTRAINT Tiene_k PRIMARY KEY (equipo,estadio),
	CONSTRAINT eqe_k FOREIGN KEY(equipo) REFERENCES Equipo(nombreCorto),
	CONSTRAINT est_k FOREIGN KEY(estadio) REFERENCES Estadio(nombre)
);





