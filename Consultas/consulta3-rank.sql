WITH rank_goles AS (
SELECT anyos,liga,numero
,SUM(golesLocal+golesVisitante)as SumaGoles
, RANK() OVER(ORDER BY SUM(golesLocal+golesVisitante) DESC) goles_rank
	FROM Partido
	WHERE anyos>2010
	GROUP BY anyos, liga, numero
)
SELECT p.anyos,p.liga,p.numero,SUM(p.golesLocal+p.golesVisitante) as goles
FROM Partido p
WHERE anyos>2010
GROUP BY p.anyos,p.liga,p.numero
HAVING SUM(p.golesLocal+p.golesVisitante) = (
SELECT 
  DISTINCT SumaGoles
FROM 
 rank_goles 
WHERE
 goles_rank = 1
);
