SELECT nomEquipo
FROM Jornada
WHERE puesto=1 AND numero=38 AND liga='1ª'
GROUP BY nomEquipo
HAVING COUNT(*) =  (SELECT MAX(COUNT(*)) AS total
					FROM Jornada 
					WHERE puesto=1 AND numero=38 AND liga='1ª'
					GROUP BY nomEquipo);
