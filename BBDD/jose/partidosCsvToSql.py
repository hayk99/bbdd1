import fileinput


for line in fileinput.input():
	campos= line.split(',')
	if int((campos[4].split("-"))[0]) > int("2004"):
		print("INSERT INTO Partido(equipoLocal, equipoVisitante, numero,equipo,anyos,liga, golesLocal,golesVisitante) VALUES ('",campos[0],"','",campos[1],"',",campos[2],",'",campos[3],"','",campos[4],"','",campos[5],"',",campos[6],",",campos[7][:len(campos[7])-1], ");", sep='')


