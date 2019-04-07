-- HAYK KOCHARYAN(757715) 
-- ALEJANDRO TERRÓN ÁLVAREZ (761069)
-- JOSÉ MANUEL SÁNCHEZ AQUILUÉ (759267)
SELECT p.anyos,p.liga,p.numero,SUM(p.golesLocal+p.golesVisitante) as goles
FROM Partido p
WHERE anyos>2010
GROUP BY p.anyos,p.liga,p.numero
HAVING SUM(p.golesLocal+p.golesVisitante) = (
SELECT MAX(SumaGoles)as MAXPorLiga
FROM (SELECT anyos,liga,numero,SUM(golesLocal+golesVisitante)as SumaGoles
	FROM Partido
	WHERE anyos>2010
	GROUP BY anyos, liga, numero)
);

