-- HAYK KOCHARYAN(757715) 
-- ALEJANDRO TERRÓN ÁLVAREZ (761069)
-- JOSÉ MANUEL SÁNCHEZ AQUILUÉ (759267)
WITH tablaTemporal AS 
	(SELECT equipo, COUNT(*)
	FROM Tiene
	GROUP BY equipo
	HAVING COUNT(*) > 1)
		SELECT t1.equipo, t1.estadio
		FROM Tiene t1, tablaTemporal
		WHERE t1.equipo = tablaTemporal.equipo
;
--Equipos que tengan mas de un estadio asignado, sin tener en
--cuenta si juegan o no en él