import fileinput


for line in fileinput.input():
	campos= line.split(';')
	print("INSERT INTO Liga(nombre) VALUES ('",campos[0][:len(campos[0])-1], "');", sep='')
