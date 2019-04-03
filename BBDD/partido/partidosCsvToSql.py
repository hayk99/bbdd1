import fileinput


for line in fileinput.input():
	campos= line.split(';')
	if int((campos[2].split("-"))[0]) > int("2004"):
		print("INSERT INTO Partido(equipoLocal, equipoVisitante, jornada, golesLocal,golesVisitante) VALUES ('",campos[0],"','",campos[1],"',",campos[2],",'",campos[3],",'",campos[4][:len(campos[4])-1], "');", sep='')
