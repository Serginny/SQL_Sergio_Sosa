CREATE VIEW Trabajadores_de_obra AS 
SELECT
  Albañil_nombre,
  a.id_proyecto,
  Dia_de_contrato,
  Hora_de_contrato,
  a.id_LD_obra_proyecto,
  a.Fecha_de_finalizacion
    FROM albañil
    JOIN proyecto AS a
    ON a.id_proyecto = id_albañil_proyecto;

CREATE VIEW Compras AS
SELECT
   id_Material,
   Descripcion,
   Precio,
   Marca,
   b.id_LD_obra_compra,
   b.Localizacion_vend
   FROM Materiales
   JOIN vendedores as b;

CREATE VIEW Especialidad_en_proyecto AS
SELECT
   id_albañil,
   Albañil_nombre,
   c.Nombre_especialidad,
   a.id_proyecto,
   a.Cliente_proyecto,
   id_albañil_LD_obra
   FROM albañil
   JOIN especialidad as c
   ON id_Albañil_especialidad = id_albañil
   JOIN proyecto AS a
   ON a.id_proyecto = id_albañil_proyecto;
