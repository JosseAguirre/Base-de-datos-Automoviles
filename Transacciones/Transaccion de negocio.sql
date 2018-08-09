USE Tienda;
DELIMITER $$
CREATE PROCEDURE Agregar_venta(
	CI VARCHAR(10),
    IDARTICULO INT,
    CANTIDAD INT
) 
BEGIN
		DECLARE PUnitario INT;
		START TRANSACTION;
        SELECT PUnitario = precio FROM Articulos WHERE articulos.id = IDARTICULO;
        
        INSERT INTO Ventas (CI, fecha, cantidad, idArticulo, importe) VALUES
        (CI, NOW( ),CANTIDAD, IDARTICULO, PUnitario * CANTIDAD);
        
        UPDATE Articulos SET stock = stock - CANTIDAD WHERE Articulos.id = IDARTICULO;
        COMMIT;
         
		ROLLBACK;
    
END $$
DELIMITER ;

CALL Agregar_venta('1752718896',9,5);