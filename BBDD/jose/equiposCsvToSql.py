import fileinput


for line in fileinput.input():
	campos= line.split(',')
	print("INSERT INTO Equipo(nombreCorto, nombreOficial, fundacion, ciudad) VALUES ('",campos[0],"','",campos[1],"',",campos[2],",'",campos[3][:len(campos[3])-2], "');", sep='')
