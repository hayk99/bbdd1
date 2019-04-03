import fileinput


for line in fileinput.input():
	campos= line.split(';')
	print("INSERT INTO Temporada(anyos, liga) VALUES ('",campos[0],"','",campos[1][:len(campos[1])-1], "');", sep='')

