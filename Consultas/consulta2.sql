-- HAYK KOCHARYAN(757715) 
-- ALEJANDRO TERRÓN ÁLVAREZ (761069)
-- JOSÉ MANUEL SÁNCHEZ AQUILUÉ (759267)
SELECT DISTINCT A.nomEquipo as nombre_del_equipo, A.anyos as ano_en_2, B.anyos as ano_en_1, C.anyos as vuelve_a_2--, B.liga, C.liga, A.anyos, B.anyos, C.anyos 
FROM Jornada A 
JOIN Jornada B ON A.nomEquipo=B.nomEquipo
JOIN Jornada C ON A.nomEquipo=C.nomEquipo
WHERE A.liga='2ª' 
AND B.liga='1ª' AND B.anyos=A.anyos+1
AND C.liga='2ª' AND C.anyos=A.anyos+2
AND A.anyos > 2004
ORDER BY A.anyos;