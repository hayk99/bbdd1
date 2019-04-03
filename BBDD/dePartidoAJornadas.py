import fileinput

def ptosAgno(temporada: str) -> int:
    if int(int(temporada.split("-")[0]) < 1995):
        ptos = 2
    else:
        ptos = 3
    return ptos
puntos={}
posicion={}
primeraJor= True 
divisionActual=""
jornadaActual="1"
temporadaActual=""
for line in fileinput.input():
	if not fileinput.isfirstline():
		campos= line.split(';')
		#print(campos[5])
		jornadaLeida=campos[2]
		divisionLeida=campos[1]
		temporadaLeida=campos[0]
		if jornadaLeida != jornadaActual and temporadaActual!="Promocion 1ª/2ª":
			lista= posicion.items()
			lista= sorted(lista,key=lambda x: x[1], reverse=True)
			#print(lista)
			for i in range(0,len(lista)):
				lista[i]= lista[i][0]
			#print(lista)
			for key in puntos:
				pos=lista.index(key)
				pos+=1
				asciende= (divisionActual=="2ª" and pos<=2)
				playoff= (divisionActual=="2ª" and pos<=6 and pos>=3)
				desciende= ((divisionActual=="1ª" and pos>=18) or (divisionActual=="2º" and pos>=19))
				champions= (divisionActual=="1ª" and pos<=4)
				europa= (divisionActual=="1ª" and pos<=6 and pos>=5)
				print(jornadaActual, key,temporadaActual+divisionActual,puntos[key],pos,asciende,playoff,desciende,champions,europa, sep=";")
			jornadaActual= jornadaLeida
			primeraJor= False
		if temporadaLeida != temporadaActual:
			temporadaActual=temporadaLeida
		if divisionLeida != divisionActual:
			puntos={}
			posicion={}
			primeraJor= True
			divisionActual=divisionLeida
		if primeraJor:
			puntos[campos[3]]= 0
			puntos[campos[4]]= 0
			posicion[campos[3]]= 0
			posicion[campos[4]]= 0
		gol= campos[5].split('-')
		if(gol[0]>gol[1]):
			puntos[campos[3]]+=ptosAgno(temporadaActual)
			posicion[campos[3]]+= ptosAgno(temporadaActual) *1000
		elif (gol[0]<gol[1]):
			puntos[campos[4]]+=ptosAgno(temporadaActual)
			posicion[campos[4]]+= ptosAgno(temporadaActual) *1000
		else:
			puntos[campos[3]]+=1
			posicion[campos[3]]+= 1000
			puntos[campos[4]]+=1
			posicion[campos[4]]+= 1000
		posicion[campos[3]]+= (int(gol[0]) - int(gol[1]))
		posicion[campos[4]]+= (int(gol[1]) - int(gol[0])) 			
