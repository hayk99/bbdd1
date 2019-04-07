-- HAYK KOCHARYAN(757715) 
-- ALEJANDRO TERRÓN ÁLVAREZ (761069)
-- JOSÉ MANUEL SÁNCHEZ AQUILUÉ (759267)
WITH tablaTemporal AS
	(SELECT DISTINCT nomEquipo as nomm, anyos
	 FROM Jornada 
	 WHERE liga = '1ª' AND puesto > 17 AND numero > 30
	 ORDER BY anyos
	)
		SELECT DISTINCT j1.nomEquipo, j1.puesto, j1.anyos
		FROM Jornada j1, tablaTemporal
		WHERE j1.numero = 38 AND j1.desciende = '0' 
		  AND j1.nomEquipo=nomm AND liga='1ª'
		GROUP BY j1.nomEquipo, j1.anyos, j1.puesto
		ORDER BY j1.anyos ASC, j1.puesto ASC;
--Equipos que en las ultimas 8 jornadas estuvieron en puestos
--de descenso pero finalmente consiguieron mantenerse en 1ª0
