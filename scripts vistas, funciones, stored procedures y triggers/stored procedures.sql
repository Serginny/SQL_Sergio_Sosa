DELIMITER //

CREATE PROCEDURE Ordenar_materiales_por_campo(IN campo VARCHAR(44), IN tipo_ordenamiento ENUM('ASC','DESC'))
BEGIN
    IF campo <> '' THEN
        SET @Ordenar = CONCAT(' ORDER BY ', campo);
    ELSE
        SET @Ordenar = '';
    END IF;

    IF tipo_ordenamiento <> '' THEN
        SET @tipo = CONCAT(' ', tipo_ordenamiento);
    ELSE
        SET @tipo = '';
    END IF;
    SET @clausula = CONCAT('SELECT id_material, Descripcion, id_Vend_Material, Precio, Marca, Cant FROM materiales', @Ordenar, @tipo);
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
    DEALLOCATE PREPARE ejecutarSQL;
END //

DELIMITER ;

CALL Ordenar_materiales_por_campo('Precio', 'ASC');

------------------------------------------------

DELIMITER //

CREATE PROCEDURE AumentarPrecioMaterial(
    IN idmaterial INT,
    IN porcentaje_aumento DECIMAL(5, 2)
)
BEGIN
    UPDATE materiales
    SET Precio = Precio * (1 + porcentaje_aumento / 100)
    WHERE id_material = idmaterial;
END //

DELIMITER ;

CALL AumentarPrecioMaterial(3, 15);