USE mascotas;

SELECT personas.nombre, mascotas.nombreMascota, personas.id, mascotas.idPersona FROM personas
INNER JOIN mascotas ON mascotas.idPersona = personas.id
WHERE mascotas.idPersona = 5;