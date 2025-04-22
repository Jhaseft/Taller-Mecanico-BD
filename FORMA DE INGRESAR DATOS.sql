--FORMA DE INGRESAR DATOS A LA BD , SI NO ENTIENDES ALGUN ATRIBUTO APOYATE CON LOS MODELOS DE POWER DESIGNER
--insertar cliente con su o sus autos 
--Datos
INSERT INTO Cliente VALUES ('76452345', 'María Valencia', '78781234', 'Av. Las Flores 123', 'maria.Valencia@email.com');
--Autos
INSERT INTO Auto VALUES ('8899KGD', '76452345', 'Toyota', 'Rav 4', 'Blanco');
INSERT INTO Auto VALUES ('4120AZQ', '76452345', 'Suzuki', 'Swift', 'Rojo');
INSERT INTO Auto VALUES ('1247ASQ', '76452345', 'Toyota', 'Rav 4', 'Gris');
--Fallas
INSERT INTO Fallas VALUES ('F0001', '8899KGD', 'Frenos', 'Chirrido al frenar', 'Media');
INSERT INTO Fallas VALUES ('F0002', '4120AZQ', 'Motor', 'Pérdida de potencia', 'Alta');
INSERT INTO Fallas VALUES ('F0003', '1247ASQ', 'Suspensión', 'Ruido en baches', 'Baja');
--Diagnosticos 
INSERT INTO Diagnostico VALUES ('D00001', 'F0001', 'Pastillas de freno desgastadas al 80%');
INSERT INTO Diagnostico VALUES ('D00002', 'F0002', 'Filtro de combustible obstruido');
INSERT INTO Diagnostico VALUES ('D00003', 'F0003', 'Amortiguadores traseros gastados');
--Quien hizo los diagnosticos , un empleado puede hacer muchos diagnosticos y un diagnostico puede ser hecho por muchos empleados
INSERT INTO Realiza VALUES ('4', 'D00001');
INSERT INTO Realiza VALUES ('3', 'D00001');
INSERT INTO Realiza VALUES ('11', 'D00002');
INSERT INTO Realiza VALUES ('10', 'D00002');
INSERT INTO Realiza VALUES ('EM19', 'D00002');
INSERT INTO Realiza VALUES ('EM9', 'D00002');
INSERT INTO Realiza VALUES ('EM9', 'D00003');
INSERT INTO Realiza VALUES ('EM19', 'D00003');
INSERT INTO Realiza VALUES ('EM5', 'D00003');
INSERT INTO Realiza VALUES ('EM6', 'D00003');
--Orden De Trabajo
INSERT INTO OrdenDeTrabajo VALUES ('OD001', 'D00001', '2024-05-12', '2024-05-12', 250.00);
INSERT INTO OrdenDeTrabajo VALUES ('OD002', 'D00002', '2024-06-18', '2024-06-18', 180.00);
INSERT INTO OrdenDeTrabajo VALUES ('OD003', 'D00003', '2024-07-22', '2024-07-23', 420.00);
--si quieres que haya en inventario primero lo metes y despues haces referencia al repuesto
INSERT INTO Inventario VALUES ('Inve122', 'Pastillas de freno', 30, 'Duralast');
INSERT INTO Inventario VALUES ('Inve222', 'Filtro de combustible', 100, 'Victor Reinz');
--poner repuestos que usaste poner 0 si no habia en el inventario  y si habia entonces poner su ID de inventario
INSERT INTO Repuestos VALUES ('Repu11', 'Inve122', 'Pastillas de freno', 'T', 1, 250.00);
INSERT INTO Repuestos VALUES ('Repu12', 'Inve222', 'Filtro de combustible', 'T', 1, 45.00);
INSERT INTO Repuestos VALUES ('Repu13', '0', 'Amortiguador trasero', 'C', 1, 480.00);
--Reparaciones realizadas
INSERT INTO Reparacion VALUES ('Repa11', 'OD001', 'Repu11', 'Pastillas cambiadas');
INSERT INTO Reparacion VALUES ('Repa12', 'OD002', 'Repu12', 'Filtro restaurado , obstruccion por metal');
INSERT INTO Reparacion VALUES ('Repa13', 'OD003', 'Repu13', 'amortiguadores cambiados');
--Quien hizo las reaparaciones, un empleado puede hacer muchas reparaciones y una reparacion puede ser hecha por muchos empleados
INSERT INTO Efectua VALUES ('628471', 'Repa11');
INSERT INTO Efectua VALUES ('753429', 'Repa11');
INSERT INTO Efectua VALUES ('942683', 'Repa11');
INSERT INTO Efectua VALUES ('EMP7X9F3Q', 'Repa11');
INSERT INTO Efectua VALUES ('EMPR5T9V2', 'Repa12');
INSERT INTO Efectua VALUES ('EMPV2G8M5', 'Repa12');
INSERT INTO Efectua VALUES ('628471', 'Repa12');
INSERT INTO Efectua VALUES ('EMPW8S4J6', 'Repa13');
INSERT INTO Efectua VALUES ('EMPY4M6D9', 'Repa13');
INSERT INTO Efectua VALUES ('628471', 'Repa13');
