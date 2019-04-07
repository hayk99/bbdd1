SELECT  * FROM (SELECT DISTINCT p.anyos Temp, p.equipoLocal EquipoL, p.equipoVisitante EquipoV, 
				p.golesLocal GolL, p.golesVisitante GolV, p.liga
				FROM Partido p
				JOIN Jornada j ON j.nomEquipo = p.equipoLocal OR j.nomEquipo = p.equipoVisitante
				WHERE j.puesto = 1
				ORDER BY p.golesLocal DESC, p.golesVisitante DESC
				)	
		WHERE ROWNUM < 11;
--TOP 10 EQUIPOS QUE MÁS GOLES HAN MARCADO ESTANDO EN EL PRIMER PUESTO */

