import fileinput


for line in fileinput.input():
	campos= line.split(',')
	print("INSERT INTO Estadio(nombre, nomEquipo, inaguracion, capacidad) VALUES ('",campos[0],"','",campos[1],"',",campos[2],",",campos[3][:len(campos[3])-1], ");", sep='')
