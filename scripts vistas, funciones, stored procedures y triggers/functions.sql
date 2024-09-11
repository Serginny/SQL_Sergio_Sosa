-----------------------------

-- sirve para ver que lider anda en contacto con que cliente

DELIMITER //

CREATE FUNCTION F_nombredecliente_idLDobra (param_id_proyecto INT)
RETURNS CHAR(50)

DETERMINISTIC

BEGIN
    DECLARE var CHAR(50);
    SELECT CONCAT(Cliente_proyecto, ' ', id_LD_obra_proyecto) INTO var 
    FROM proyecto 
    WHERE id_proyecto = param_id_proyecto;
    
    RETURN var;
END //

DELIMITER ;

----------------------------
DELIMITER //

CREATE FUNCTION Cantidad_material (l_Descripcion varchar(44))
RETURNS INT

DETERMINISTIC

BEGIN
   DECLARE Cant_var INT;
   SELECT Cant INTO Cant_var
   FROM materiales
   WHERE Descripcion = l_Descripcion;
   RETURN Cant_var;
  
END // 

DELIMITER ;

