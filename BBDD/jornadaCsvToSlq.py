import fileinput


for line in fileinput.input():
	campos= line.split(';')
	if int((campos[2].split("-"))[0]) > int("2004"):
		print("INSERT INTO Jornada(numero, equipo, temporada, puntos,puesto,asciende,playoff,desciende,champions,europa) VALUES ('",campos[0],"','",campos[1],"',",campos[2],",'",campos[3],",'",campos[4],",'",campos[5],",'",campos[6],",'",campos[7],",'",campos[8],",'",campos[9][:len(campos[4])-1], "');", sep='')