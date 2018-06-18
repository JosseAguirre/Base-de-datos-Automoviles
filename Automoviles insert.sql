USE automoviles;

INSERT INTO casaAutomotriz (casaAutomotriz) VALUES 
('Mercedez Benz'),
('BMW'),
('Mitsibishi'),
('Audi'),
('Chevrolet');

INSERT INTO tipoAuto (tipo) VALUES 
('sedan'),
('4x4'),
('4x2');

INSERT INTO alimentacion (alimentacion) VALUES
('gasolina'),
('diesel'),
('electrico'),
('hibrido');

INSERT INTO auto (idCasaAutomotriz, modelo, año, idtipo, idalimentacion) VALUES
(1, 'SLK', '2014', 2, 2),
(1, 'CLK-240', '2013', 1, 1),
(1, 'C-500', '2014', 1, 4),
(1, 'C-200', '2015', 1, 3),
(2, 'M6', '2018', 1, 2),
(2, 'Z4', '2015', 1, 1),
(2, 'X4', '2018', 3, 2),
(2, 'X6', '2018', 2, 4),
(3, 'Lancer', '2018', 1, 1),
(3, 'Eclipce', '2017', 1, 1),
(3, 'Montero', '2017', 3, 3),
(3, 'Galant', '2015', 2, 4),
(4, 'A4', '2016', 1, 1),
(4, 'e-Tron', '2017', 1, 3),
(4, 'Quattro', '2015', 3, 2),
(5, 'Blaser', '2017', 2, 2),
(5, 'Thad', '2017', 2, 4),
(5, 'Cruz', '2017', 1, 1),
(5, 'D-Max', '2017', 3, 2);

INSERT INTO costoAuto (idAuto, costo) VALUES
(1, 51500),
(2, 43900),
(3, 67023),
(4, 44747),
(5, 120000),
(6, 72123),
(7, 84500),
(8, 86239),
(9, 43225),
(10, 47336),
(11, 32267),
(12, 27800),
(13, 61758),
(14, 112470),
(15, 53741),
(16, 41500),
(17, 49287),
(18, 35168),
(19, 29990);