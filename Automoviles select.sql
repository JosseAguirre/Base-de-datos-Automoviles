USE automoviles;
/*TRUNCATE TABLE auto;
DROP TABLE alimentacion;*/
SELECT modelo, año FROM auto;

SELECT casaAutomotriz.casaAutomotriz, auto.modelo, tipoAuto.tipo , alimentacion.alimentacion FROM casaAutomotriz
INNER JOIN auto ON auto.idCasaAutomotriz = casaAutomotriz.id
INNER JOIN alimentacion ON alimentacion.id = auto.idalimentacion
INNER JOIN tipoAuto ON tipoAuto.id = auto.idtipo
WHERE auto.idCasaAutomotriz = 2 AND alimentacion.alimentacion = 'gasolina';

SELECT casaAutomotriz.casaAutomotriz, auto.modelo, tipoAuto.tipo , costoAuto.costo FROM casaAutomotriz
INNER JOIN auto ON auto.idCasaAutomotriz = casaAutomotriz.id
INNER JOIN costoAuto ON costoAuto.idAuto = auto.id
INNER JOIN tipoAuto ON tipoAuto.id = auto.idtipo
WHERE costoAuto.costo < 30000;

SELECT CONCAT(casaAutomotriz.casaAutomotriz,' ',auto.modelo, ' ', tipoAuto.tipo, ' ', auto.año, ' ', alimentacion.alimentacion) AS 'Espesificaciones' FROM auto
INNER JOIN alimentacion ON alimentacion.id = auto.idalimentacion
INNER JOIN casaAutomotriz ON casaAutomotriz.id = auto.idCasaAutomotriz
INNER JOIN tipoAuto ON tipoAuto.id = auto.idtipo
ORDER BY auto.id DESC;

SELECT casaAutomotriz.casaAutomotriz, auto.idCasaAutomotriz FROM casaAutomotriz
INNER JOIN auto ON auto.idCasaAutomotriz = casaAutomotriz.id
GROUP BY auto.idCasaAutomotriz = 2;