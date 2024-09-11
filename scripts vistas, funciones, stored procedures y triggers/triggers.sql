DROP TRIGGER IF EXISTS new_client;

DELIMITER //

CREATE TRIGGER new_client
AFTER INSERT ON proyecto
FOR EACH ROW
BEGIN
    INSERT INTO nuevo_proyecto (
        id_proyecto, 
        cliente_proyecto, 
        Fecha_de_inicio, 
        Fecha_de_finalizacion, 
        proyecto_descripcion, 
        id_LD_obra_proyecto) 
        VALUES (
        NEW.id_proyecto, 
        NEW.cliente_proyecto, 
        NOW(), 
        NEW.Fecha_de_finalizacion, 
        NEW.proyecto_descripcion, 
        NEW.id_LD_obra_proyecto
    );
END //

DELIMITER ;

INSERT INTO proyecto (
    id_proyecto, 
    cliente_proyecto, 
    Fecha_de_inicio, 
    Fecha_de_finalizacion,
    proyecto_descripcion, 
    id_LD_obra_proyecto) 
    VALUES (
    '38', 
    'Julian Camarillo',
    '2025-06-12', 
    '2027-06-12',
    'PROYECTO MULTIFAMILIAR', 
    '7235'
);



-----------------------------


DELIMITER //

CREATE TRIGGER elim_client
BEFORE DELETE ON proyecto
FOR EACH ROW
BEGIN
    INSERT INTO nuevo_proyecto (
        id_proyecto, 
        cliente_proyecto, 
        Fecha_de_inicio, 
        Fecha_de_finalizacion, 
        proyecto_descripcion, 
        id_LD_obra_proyecto) 
        VALUES (
        OLD.id_proyecto, 
        OLD.cliente_proyecto, 
        NOW(), 
        OLD.Fecha_de_finalizacion, 
        OLD.proyecto_descripcion, 
        OLD.id_LD_obra_proyecto
    );
END //

DELIMITER ;

DELETE FROM proyecto WHERE id_proyecto = 38;
