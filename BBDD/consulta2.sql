SELECT DISTINCT A.nomEquipo nombre_Equipos
FROM Jornada A 
JOIN Jornada B ON A.nomEquipo=B.nomEquipo
JOIN Jornada C ON A.nomEquipo=C.nomEquipo
WHERE A.liga='2ª' 
AND B.liga='1ª' AND B.anyos=A.anyos+1
AND C.liga='2ª' AND C.anyos=A.anyos+2
AND A.anyos >= 2005;