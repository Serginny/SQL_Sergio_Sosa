INSERT INTO `lider_de_obra` (`ID_LD_obra`, `Nombre_LD_obra`) VALUES
(3324, 'JOEL DORIAN'),
(3325, 'VICTOR MUÑO'),
(4324, 'JAVIER MARI'),
(7235, 'RICHARD MOR');

INSERT INTO `proyecto`(`id_proyecto`, `Cliente_proyecto`, `Fecha_de_inicio`, `Fecha_de_finalizacion`, `proyecto_descripcion`, `id_LD_obra_proyecto`) VALUES 
('25','JOSE RODRIGUEZ','2022-01-09','2023-06-16','PROYECTO UNIFAMILIAR',"3325"),
('26','DANIEL SOSA','2020-05-07','2024-07-02','PROYECTO MULTIFAMILIAR',"4324"),
('27','MANUEL MADRID','2023-01-09','2024-06-16','PROYECTO UNIFAMILIAR',"3324"),
('1010','JOSE RODRIGUEZ','2022-01-09','2023-06-16','PROYECTO cafe',"7235");


INSERT INTO `albañil`(`id_albañil`, `Albañil_nombre`, `id_albañil_proyecto`, `Localidad_albañil`, `Dia_de_contrato`, `Hora_de_contrato`, `id_albañil_LD_obra`) VALUES 
('1115','JOSE HERNANDEZ','25','LIMA','2022-06-17','16:00','3325'),
('1432','LUIS BARRIOS','27','CALI','2022-07-22','12:00','3324'),
('1918','ANDRES FERNANDEZ','26','CARACAS','2024-01-15','11:00','4324'),
('1286','ARMANDO CASAS','26','BOGOTA','2022-02-23','15:00','4324'),
('1481','DANIEL YAÑEZ','26','CIUDAD DE MEXICO','2023-01-15','11:00','4324'),
('1321','MARIO CASTILLO','25','CARACAS','2019-20-11','11:00','3325'),
('1465','DAVID CUESTA','1010','OAXACA','2021-01-23','11:00','7235'),
('1913','JULIAN CASTAÑEDA','26','MADRID','2021-01-16','11:00','4324'),
('1681','ZUKE IGLESIAS','1010','MARACAIBO','2021-07-08','11:00','7235');

INSERT INTO `especialidad`(`id_especialidad`, `Nombre_especialidad`, `id_Albañil_especialidad`) VALUES 
('A6425','Soldador','1115'),
('A6425','Soldador','1321'),
('A6425','Soldador','1465'),
('A6478','Electricista','1432'),
('A6478','Electricista','1286'),
('A6478','Electricista','1681'),
('A6521','Fontanero','1918'),
('A6521','Fontanero','1321');

INSERT INTO `vendedores`(`id_Vend`,`Localizacion_Vend`, `Vend_name`, `Vend_telefono`, `id_LD_obra_compra`) VALUES 
("1319","Francisco", "Cemento","39188368","3325"), 
('1421',"Francisco", "Arena","41544048","3325"),
("8412","Francisco", "Grava","25887090","3325"),
("4563","Francisco", "Acero","19806480","3325"),
("1236","Francisco", "Ladrillos","62822115","3324"),
("7896","Francisco", "Bloques de hormigón","60035530","3325"),
("4569","Lucía", "Yeso","26334702","3324"),
("4785","Lucía", "Cerámicas","13962931","3324"),
("5896","Lucía", "Pintura","85771847","3324"),
("6985","Lucía", "Madera","34714987","4324" ),
("4587","Lucía", "Paneles de yeso","97016560","4324" ),
("4785","Sebastián", "Lana de vidrio","10537596","4324"),
("9845","Sebastián", "Poliestireno expandido","73058210","4324" ),
("6521","Sebastián", "Impermeabilizantes","95941477","4324"),
("3252","Alejandro", "Clavos y tornillos","12510173","4324"),
("3254","Alejandro", "Cinta métrica y niveles","68704822","4324"),
("4532","Alejandro", "Tuberías PVC","73960793","4324" ),
("9820","Alejandro", "Tuberías cobre","17085768" , "7235"),
("6210","Javier", "Mallas electrosoldadas","50001314","7235"),
("1282","Javier", "Mármol y granito","64795022","7235"),
("7852","Javier", "Vidrio","25137972","7235"),
("7825","Javier", "Hormigón decorativo","45962931","7235");

INSERT INTO `materiales` (`id_material`, `Descripcion`, `id_Vend_Material`, `Precio`, `Marca`, `Cant`) VALUES
(1, 'Cemento', 1319, '9203.7', 'ConstructoMax', '320'),
(2, 'Arena', 1421, '5091', 'ConstructoMax', '122'),
(3, 'Grava', 8412, '1664', 'ConstructoMax', '151'),
(4, 'Acero', 4563, '2082', 'ConstructoMax', '525'),
(5, 'Ladrillos', 1236, '9684', 'ConstructoMax', '250'),
(6, 'Bloques de hormigón', 7896, '5873', 'ConstructoMax', '320'),
(7, 'Yeso', 4569, '5800', 'FortiBlock', '122'),
(8, 'Cerámicas', 4785, '8400', 'FortiBlock', '151'),
(9, 'Pintura', 5896, '7200', 'FortiBlock', '525'),
(10, 'Madera', 6985, '5900', 'FortiBlock', '125'),
(11, 'Paneles de yeso', 4587, '3700', 'FortiBlock', '130'),
(12, 'Lana de vidrio', 4785, '2800', 'EdificaPro', '630'),
(13, 'Poliestireno expandido', 9845, '73058210', 'EdificaPro', '175'),
(14, 'Impermeabilizantes', 6521, '9080', 'EdificaPro', '140'),
(15, 'Clavos y tornillos', 3252, '5300', 'Solidara', '200'),
(16, 'Cinta métrica y niveles', 3254, '4800', 'Solidara', '322'),
(17, 'Tuberías PVC', 4532, '9880', 'Solidara', '450'),
(18, 'Tuberías cobre', 9820, '6125', 'Solidara', '315'),
(19, 'Mallas electrosoldadas', 6210, '6850', 'Arquitec Solutions', '265'),
(20, 'Mármol y granito', 1282, '9000', 'Arquitec Solutions', '425'),
(21, 'Vidrio', 7852, '8000', 'Arquitec Solutions', '500'),
(22, 'Hormigón decorativo', 7825, '7000', 'Arquitec Solutions', '550');

