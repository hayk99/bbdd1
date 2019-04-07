SELECT Partido.anyos, Partido.liga, Partido.equipoLocal, SUM (Partido.golesLocal + Partido.golesVisitante) as suma
FROM Partido
JOIN Jornada ON Jornada.nomEquipo=Partido.equipoLocal 
WHERE  Partido.anyos > 2004 AND Partido.liga = '1ª' AND Jornada.puesto=1
GROUP BY Partido.anyos, Partido.liga, Partido.equipoLocal;



SELECT nomEquipo 
FROM Jornada j
WHERE j.nomEquipo = p.nomEquipo AND j.puesto='1ª'
HAVING = (SELECT p.anyos, p.equipoLocal, SUM (P.golesLocal + P.golesVisitante)
			FROM Partido p
			WHERE p.anyos>2010 AND p.liga ='1ª'
			GROUP BY p.anyos, p.equipoLocal);


SELECT jp.equipoLocal, p.golesLocal
SELECT MAX(SumaGoles)as MaxJornada
FROM (SELECT anyos,liga,numero,SUM(golesLocal+golesVisitante)as SumaGoles
	FROM Partido
	WHERE anyos>2010
	GROUP BY anyos, liga, numero);
);




SELECT t.equipo, COUNT(*) AS numero_Estadios
FROM Tiene t
LEFT JOIN Tiene t2 ON t.estadio=t2.estadio
WHERE t.equipo=t2.equipo 
GROUP BY t.equipo
HAVING COUNT(*) > 1
;



WITH tablaTemporal AS 
	(SELECT equipo, COUNT(*)
	FROM Tiene
	GROUP BY equipo
	HAVING COUNT(*) > 1)
		SELECT t1.equipo, t1.estadio
		FROM Tiene t1, tablaTemporal
		WHERE t1.equipo = tablaTemporal.equipo
;

#EQUIPO Y GOLES EN LOCAL
SELECT DISTINCT p.equipoLocal, p.golesLocal, p.anyos
FROM Partido p
JOIN Jornada j ON j.nomEquipo = p.equipoLocal
WHERE j.puesto = 1 AND j.liga = '1ª'
ORDER BY p.golesLocal DESC, p.anyos DESC
;


/*============================================================*/

SELECT * FROM (SELECT DISTINCT p.equipoLocal, p.golesLocal, p.anyos
				FROM Partido p
				JOIN Jornada j ON j.nomEquipo = p.equipoLocal
				WHERE j.puesto = 1 AND j.liga = '1ª'
				ORDER BY p.golesLocal DESC, p.anyos DESC)	
		WHERE ROWNUM < 4;


/*============================================================*/








WITH tablaTemporal AS
	(SELECT DISTINCT nomEquipo as nomm, anyos
	 FROM Jornada 
	 WHERE LIGA = '1ª' and puesto > 17
	 ORDER BY anyos
	)
		SELECT j1.nomEquipo, j.anyos
		FROM Jornada j1, tablaTemporal
		WHERE j1.numero = 38 AND j1.desciende = '1' 
		  AND j1.nomEquipo=nomm
;







SELECT DISTINCT j.nomEquipo, j.anyos
FROM Jornada j
JOIN Jornada j1 ON j.nomEquipo=j1.nomEquipo
WHERE j.liga = '1ª' AND j.puesto > 17 AND j1.desciende = '1' AND j1.numero=38
ORDER BY j.anyos;