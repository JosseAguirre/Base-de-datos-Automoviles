DELIMITER $$
CREATE PROCEDURE cursorTest (
) BEGIN
  DECLARE v_name VARCHAR(120);
  DECLARE v_time BIGINT;
  DECLARE v_penalty1 BIGINT;
  DECLARE v_penalty2 BIGINT;
  DECLARE fin INTEGER DEFAULT 0;

  DECLARE runners_cursor CURSOR FOR 
    SELECT Name, Time, Penalty1, Penalty2 FROM Runners;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

  OPEN runners_cursor;
  get_runners: LOOP
    FETCH runners_cursor INTO v_name, v_time, v_penalty1, v_penalty2;
    IF fin = 1 THEN
       LEAVE get_runners;
    END IF;

  SELECT v_name, v_time, v_penalty1, v_penalty2;

  END LOOP get_runners;

  CLOSE runners_cursor;
END$$
DELIMITER ;

DELIMITER ;
DROP PROCEDURE IF EXISTS `micursor`;;
CREATE PROCEDURE `micursor`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE uid integer;
DECLARE newdate integer;
DECLARE c1 cursor for SELECT id,timestamp from employers ORDER BY id ASC;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;
open c1;
c1_loop: LOOP
fetch c1 into uid,newdate;
        IF `done` THEN LEAVE c1_loop; END IF; 
        UPDATE calendar SET timestamp = newdate  WHERE id=uid;
END LOOP c1_loop;
CLOSE c1;
END ;
DELIMITER ;

DELIMITER $$
CREATE FUNCTION calculate_runner_points (
  In_time BIGINT,
  In_penalty1 BIGINT,
  In_penalty2 BIGINT
) RETURNS BIGINT
BEGIN
  DECLARE points BIGINT;
  
  SET points = 500 - In_time - In_penalty1*5 - In_penalty2*3;
  
  RETURN points;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE simple_loop ( ) 
BEGIN
  DECLARE counter BIGINT DEFAULT 0;
  
  my_loop: LOOP
    SET counter=counter+1;

    IF counter=10 THEN
      LEAVE my_loop;
    END IF;

    SELECT counter;

  END LOOP my_loop;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cargar_imagen (
) BEGIN
  DECLARE i_idimagen BIGINT;
  DECLARE v_imagen VARCHAR(250);
  DECLARE findelbucle INTEGER DEFAULT 0;
 
  DECLARE cursor_elidimagen CURSOR FOR 
    SELECT imagen,id_producto FROM imagenes ;
 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET findelbucle=1;
--  DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;
 
  OPEN cursor_elidimagen;
  bucle: LOOP
    FETCH cursor_elidimagen INTO v_imagen,i_idimagen;
    IF findelbucle = 1 THEN
       LEAVE bucle;
    END IF;
 
  UPDATE oc_product SET image= v_imagen WHERE model=i_idimagen;
 
  END LOOP bucle;
 
  CLOSE cursor_elidimagen;
END$$
DELIMITER ;