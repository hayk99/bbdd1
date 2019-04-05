SELECT * FROM
(SELECT nomEquipo , COUNT(*) AS total
FROM Jornada 
WHERE puesto=1 AND numero=38 AND liga='1ª'
GROUP BY nomEquipo
ORDER BY total DESC)
WHERE rownum=1;