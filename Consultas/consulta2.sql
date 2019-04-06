SELECT DISTINCT A.nomEquipo, A.liga, B.liga, C.liga, A.anyos, B.anyos, C.anyos
FROM Jornada A 
JOIN Jornada B ON A.nomEquipo=B.nomEquipo
JOIN Jornada C ON A.nomEquipo=C.nomEquipo
WHERE A.liga='2B*' 
AND B.liga='1B*' AND B.anyos=A.anyos+1
AND C.liga='2B*' AND C.anyos=A.anyos+2
AND A.anyos IN (SELECT DISTINCT anyos
			FROM Jornada
			WHERE anyos > 
			(SELECT MAX(anyos)
			FROM Jornada) - 10);