# Suma los puntos de cada equipo en cada jornada de cada temporada según la estructura
# del Liga_fin.csv, con las reglas de puntos explicadas en puntos.txt
import fileinput


def ptosAgno(temporada: str) -> int:
    if int(int(temporada.split("-")[0]) < 1975):
        ptos = 2
    else:
        ptos = 3
    return ptos

# Devuelve true sii leido no es un numero seguido o no de un espacio
def esNumero(leido: str) -> bool:
    #print(re.search("[0-9]\s*",leido))
    return(re.match("[0-9]\s*",leido))!=None

def escribirJornada(separada: list, local: int, temporadaActual: str, ptosEquipos: dict) -> (str):
    tempLeida = separada[2]
    if tempLeida != temporadaActual: # cambio de temporada, reseteamos el diccionario
        ptosEquipos.clear()
    
    print(tempLeida, end=";") # temporada
    print(separada[3], end=";") # division
    print(separada[4], end=";") # jornada

    equipo = separada[5+local]
    print(equipo, end=";") # equipo local
    goles = separada[7].split("-")
    nPtos = ptosAgno(tempLeida)
    if int(goles[0+local]) > int(goles[1-local]):
        ptos = nPtos
    elif int(goles[0+local]) < int(goles[1-local]):
        ptos = 0
    else:
        ptos = 1
    if equipo in ptosEquipos:
        ptosViejos = ptosEquipos[equipo]
        ptosEquipos[equipo] = ptosViejos + ptos
    else:
        ptosEquipos[equipo] = ptos
    print(ptosEquipos[equipo])
    return tempLeida # para ir actualizando la temp anterior



ptosEquipos = {} # diccionario con clave=nombreEquipo dato=ptosTemporada
posicionEquipos= {}

temporadaActual = "" # temporada del ultimo dato leido

for line in fileinput.input():
    if not fileinput.isfirstline():
        separada=line[:-1].split(";")
        #Equipo local:
        escribirJornada(separada, 0, temporadaActual, ptosEquipos) # local
        temporadaActual = escribirJornada(separada, 1, temporadaActual,ptosEquipos) # el otro
