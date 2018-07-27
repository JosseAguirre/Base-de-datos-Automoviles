USE Recuperacion;
-- Pregunta 1  contar numero total de alumnos
-- 1= estudiantes, 2= profesores, 3= empleados, 4= proveedor
SELECT COUNT(personas.id) FROM personas
WHERE personas.idRol = 1;

-- pregunta 2 listado alumnos por curso
SELECT personas.nombre, personas.apellido, cursos.nivel FROM alumnosCursos
INNER JOIN personas ON personas.id = alumnosCursos.idPersona
INNER JOIN cursos on cursos.id = alumnosCursos.idCurso
WHERE personas.idRol = 1 AND cursos.nivel = 'A';

-- pregunta 3 Cuadro de honor del parcial3 (notas mayores de 91) 
SELECT personas.nombre, personas.apellido, notas.calificacion FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
WHERE notas.calificacion > 91 AND personas.idRol = 1;

-- pregunta 4 Aplazados por materia

SELECT personas.nombre, personas.apellido, notas.calificacion, materias.descripcion FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
INNER JOIN materias ON materias.id = notas.idMaterias
WHERE notas.calificacion < 70 AND materias.id = 1;

-- preunta5 Aplazados por curso

SELECT personas.nombre, personas.apellido, notas.calificacion, materias.descripcion, cursos.nivel FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
INNER JOIN materias ON materias.id = notas.idMaterias
WHERE notas.calificacion < 70 AND cursos.nivel = 'A';

-- pregunta6 Mejores 10 promedios de todo el sistema para asignarles becas
SELECT personas.nombre, personas.apellido, AVG(notas.calificacion) FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
GROUP BY personas.nombre, personas.apellido, notas.calificacion
ORDER BY AVG(notas.calificacion) DESC LIMIT 10 OFFSET 0;

-- pregunta7 Materias por maestros

SELECT personas.nombre, personas.apellido, materias.descripcion FROM personas
INNER JOIN docenteMaterias ON docenteMaterias.idPersona = personas.id
INNER JOIN materias ON materias.id = docenteMaterias.idMateria
WHERE personas.idRol = 2;

-- pregunta8 Contar cuantas materias por maestros.

SELECT personas.nombre, personas.apellido, COUNT(materias.descripcion) FROM personas
INNER JOIN docenteMaterias ON docenteMaterias.idPersona = personas.id
INNER JOIN materias ON materias.id = docenteMaterias.idMateria
WHERE personas.idRol = 2
GROUP BY personas.nombre, personas.apellido;

-- pregunta9 Calcular el promedio anual de todas las notas.
SELECT AVG(notas.calificacion) FROM notas;

-- pregunta10 Calcular el promedio por sexo
SELECT  generos.tipo, AVG(notas.calificacion) FROM personas
INNER JOIN generos ON generos.id = personas.idGenero
INNER JOIN notas ON notas.idPersona = personas.id
GROUP BY personas.idGenero
ORDER BY generos.tipo, AVG(notas.calificacion) DESC;

-- pregunta11 Alumnos a los que no se les ha asignado ninguna nota.
SELECT personas.nombre, personas.apellido, notas.calificacion FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
WHERE notas.calificacion IS NULL AND personas.idRol = 1;

-- pregunta12 Maestros a los que no se les ha asignado ninguna materia.
SELECT personas.nombre, personas.apellido FROM personas
INNER JOIN docenteMaterias ON docenteMaterias.idPersona = personas.id
INNER JOIN materias ON materias.id = docenteMaterias.idMateria
WHERE docenteMaterias.idMateria IS NULL AND personas.idRol = 2;

-- pregunta13 Ver el historial de un alumno X
SELECT personas.nombre, personas.apellido, generos.tipo, roles.cargo, estados.descripcion AS 'estado', materias.descripcion AS 'materias', notas.calificacion FROM personas
INNER JOIN generos ON generos.id = personas.idGenero
INNER JOIN roles ON roles.id = personas.idRol
INNER JOIN estados ON estados.id = personas.idEstado
INNER JOIN notas ON notas.idPersona = personas.id
INNER JOIN materias ON materias.id = notas.idMateria
WHERE personas.nombre = 'Antonio' AND personas.apellido = 'Sucre';

-- pregunta14 Ver la nota más alta del año.

SELECT MAX(notas.calificacion) FROM notas;

-- pregunta15 Ver la nota más baja del año.

SELECT MIN(notas.calificacion) FROM notas;

-- pregunta16 Alumnos que pierden derecho a Primera Recuperación (promedio < 40)

SELECT personas.nombre, personas.apellido, notas.calificacion, materias.descripcion FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
INNER JOIN materias ON materias.id = notas.idMateria
WHERE notas.calificacion < 40;

-- pregunta17 Materias por curso

SELECT materias.descripcion, cursos.nivel FROM materiasCurso
INNER JOIN materias ON matrias.id = materiasCurso.idMateria
INNER JOIN cursos ON cursos.id = materiasCurso.idCurso
WHERE cursos.nivel= 'A';

-- pregunta18 Cuantos alumnos van a Recuperación

SELECT personas.nombre, personas.apellido, notas.calificacion, materias.descripcion FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
INNER JOIN materias ON materias.id = notas.idMateria
WHERE notas.calificacion < 60;

-- pregunta 19 Cuantos alumnos van a Recuperación por Materia.
SELECT materias.descripcion, COUNT(personas.id) FROM personas
INNER JOIN notas ON notas.idPersona = personas.id
INNER JOIN materias ON materias.id = notas.idMateria
WHERE notas.calificacion < 40
GROUP BY materias.descripcion;

-- pregunta20 Alumnos Repitentes
SELECT personas.nombre, personas.apellido, alumnosRepeticion.repite FROM alumnosRepeticion
INNER JOIN personas ON personas.id = alumnosRepeticion.idPersona
WHERE personas.idRol =2 AND alumnosRepeticion.repite = true;

-- pregunta21 Sumar cuanto ha cobrado cada empleado.

SELECT personas.nombre, personas.apellido, cobros.cantidad FROM cobros
INNER JOIN personas ON personas.id = cobros.idPersona
WHERE personas.idRol = 3;

-- pregunta22 Sumar Todos los Cobros realizados.

SELECT SUM(cobros.cantidad) FROM cobros;

-- pregunta23 Sumar los Cobros por Concepto.

SELECT conceptos.descripcion, SUM(cobros.total) FROM cobros
INNER JOIN conceptos ON conceptos.id = cobros.idConcepto
WHERE cobros.idConcepto = 1
GROUP BY conceptos.descripcion;

-- pregunta24 Contar cuantos cobros se han hecho.

SELECT COUNT(cobros.id) FROM cobros;

-- pregunta 26 Ver el Estado de cuenta de un alumno.

SELECT cobros.id, personas.nombre, personas.apellido, cobros.fecha, cobros.cantidad FROM cobros
INNER JOIN personas ON personas.id = cobros.idPersona
WHERE personas.idRol = 2 AND personas.nombre = 'Antonio' AND personas.apellido = 'Sucre';

-- pregunta26 Contar cuantos empleados hay.

SELECT personas.nombre, personas.apellido, roles.cargo FROM personas
INNER JOIN roles ON roles.id = personas.idRol
WHERE personas.idRol = 3;

-- pregunta27 Alumnos que no han realizado ningún pago.

SELECT personas.nombre, personas.apellido, pagos.cantidad FROM pagos
INNER JOIN personas ON personas.id = pagos.idPersona
WHERE (pagos.fecha) IS NULL AND personas.idRol = 2;

-- pregunta28 Contar cuantos productos hay en la tienda.

SELECT COUNT(productos.id) FROM productos;

-- pregunta29 Calcular la Inversión Total hecha en la tienda escolar.

SELECT SUM(productos.precio) FROM productos;

-- pregunta30 Ver los artículos por proveedor.

SELECT proveedores.nombreEmpresa, articulos.descripcion FROM articuloProveedores
INNER JOIN proveedores ON proveedores.id = articuloProveedores.idProveedor
INNER JOIN articulos ON articulos.id = articuloProveedores.idArticulo
WHERE proveedores.id = 1;

-- pregunta31 Cuánto Dinero se le ha pagado a cada proveedor.

SELECT proveedores.nombreEmpresa, pagos.fecha, pagos.cantidad FROM pagos
INNER JOIN personas ON personas.id = pagos.idPersona
INNER JOIN proveedores ON proveedores.idPersona = personas.id
WHERE personas.idRol = 4;

-- pregunta32 Cuantos proveedores tenemos

SELECT COUNT(proveedores.id) FROM proveedores;

-- pregunta33 Total Vendido

SELECT SUM(facturas.total) FROM facturas;

-- pregunta34 Ventas por factura

SELECT facturas.id, COUNT(ventas.id) FROM facturas
INNER JOIN ventas ON ventas.idFactura = facturas.id
WHERE facturas.id = 1;

-- pregunta35 Total ventas por factura

SELECT ventas.idFactura, ventas.idProducto, productos.precio, facturas.total FROM facturas
INNER JOIN ventas ON ventas.idFactura = facturas.id
INNER JOIN productos ON productos.id = ventas.idProducto
WHERE facturas.id = 1;

-- preunta36 Total impuesto cobrado.

SELECT SUM(facturas.impuesto) FROM facturas;

-- pregunta37 Total impuesto cobrado por factura.

SELECT facturas.id, facturas.impuesto FROM facturas;

-- pregunta38 Productos que no han tenido movimiento.

SELECT productos.id, productos.descripcion FROM ventas
INNER JOIN productos ON productos.id = ventas.idProducto
WHERE productos.id != ventas.idProducto;

-- pregunta39 Ver la factura más alta

SELECT facturas.id, facturas.total FROM facturas
ORDER BY facturas.total DESC LIMIT 1 OFFSET 0;

-- pregunta40 Ver una factura x completa.

SELECT facturas.id, personas.nombre, personas.apellido, productos.id, productos.descripcion, facturas.impuesto, facturas.total, facturas.fecha FROM facturas
INNER JOIN personas ON personas.id = facturas.idPersona
INNER JOIN ventas ON ventas.idFactura = facturas.id
INNER JOIN productos ON productos.id = ventas.idProducto
WHERE facturas.id = 1;
