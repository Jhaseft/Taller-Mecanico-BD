/*Mostrar nombres y teléfono(s) de los usuarios o clientes que trajeron a
reparación autos de marca Suzuki y que se apersonaron a nuestra empresa el
primer trimestre del presente año, y que realizaron una reparación de motor y
cuyo costo total excedió los 2000 Bs.*/
USE [AUTO TECH];
GO
--INNER JOIN: Muestra solo las filas que tienen coincidencias en ambas tablas.
--JOIN : Esto devuelve solo las filas que tienen coincidencias en ambas tablas.
SELECT C.NOMBRE_CLIENTE, c.TELEFONO_CLIENTE FROM dbo.CLIENTE C
JOIN AUTO A ON C.CI = A.CI 
JOIN FALLAS F ON F.PLACA = A.PLACA
JOIN DIAGNOSTICO D ON F.ID_FALLA = D.ID_FALLA
JOIN ORDENDETRABAJO O ON O.ID_DIAGNOSTICO = D.ID_DIAGNOSTICO
AND MARCA = 'SUZUKI' 
AND NOMBRE_FALLA = 'MOTOR'
AND COSTO_TOTAL > 2000
AND FECHA_INGRESO_AUTO < '2025-04-01'
AND FECHA_INGRESO_AUTO > '2024-12-30'


/*Mostrar el ranking de los 5 mejores clientes que trajeron a reparar sus autos
entre 2024 y 2025, el ranking debe incluir nombre del cliente, cuantas veces
trajo a reparar el mismo o más autos en el periodo requerido, y el promedio de
pagos totales que realizo.*/
USE [AUTO TECH];
GO

SELECT TOP 5 C.CI, C.NOMBRE_CLIENTE, COUNT(*) AS CANTIDAD_DE_VECES_QUE_VINO, AVG(COSTO_TOTAL) AS PROMEDIO_DE_PAGOS
FROM CLIENTE C
JOIN AUTO A ON A.CI = C.CI
JOIN FALLAS F ON F.PLACA = A.PLACA
JOIN DIAGNOSTICO D ON D.ID_FALLA = F.ID_FALLA
JOIN ORDENDETRABAJO O ON O.ID_DIAGNOSTICO = D.ID_DIAGNOSTICO
AND YEAR(FECHA_INGRESO_AUTO) < 2026 AND YEAR(FECHA_INGRESO_AUTO) > 2023
GROUP BY C.CI, C.NOMBRE_CLIENTE
ORDER BY PROMEDIO_DE_PAGOS DESC
GO


/*Mostrar el mecánico o mecánicos que repararon el auto Toyota Rav 4, de año
2020 de color plomo y con placa 3246BBT, el mes de febrero, las reparaciones
que se realizaron, la fecha de ingreso, la fecha de salida y el costo parcial y total
que implico.*/
USE [AUTO TECH];
GO

SELECT EM.ID_EMPLEADO,
EM.NOMBRE_EMPLEADO,
R.DESCRIPCION_REPARACION,
O.FECHA_INGRESO_AUTO,
O.FECHA_EGRESO_AUTO,
RE.DESCRIPCION_REPUESTO,
O.COSTO_TOTAL,
RE.CANTIDAD,
RE.COSTO_UNITARIO,
RE.DETALLE_REPUESTO_T_O_C_
FROM EMPLEADO EM
JOIN EFECTUA EF ON EF.ID_EMPLEADO = EM.ID_EMPLEADO
JOIN REPARACION R ON EF.ID_REPARACION = R.ID_REPARACION
JOIN REPUESTOS RE ON RE.ID_REPUESTOS = R.ID_REPUESTOS
JOIN ORDENDETRABAJO O ON O.ID_DIAGNOSTICO = R.ID_ORDEN
JOIN DIAGNOSTICO D ON D.ID_DIAGNOSTICO = O.ID_DIAGNOSTICO
JOIN FALLAS F ON F.ID_FALLA = D.ID_FALLA
JOIN AUTO A ON A.PLACA = F.PLACA
JOIN CLIENTE C ON C.CI = A.CI
WHERE A.MARCA = 'SUZUKI' 
AND A.MODELO = '2020'
AND A.COLOR = 'Negro'
AND A.PLACA = '7412GYT'
AND O.FECHA_INGRESO_AUTO < '2025-03-26'
AND FECHA_EGRESO_AUTO > '2025-01-28'
GO


/*Mostrar los datos más importantes de los empleados que trabajaron en el
turno uno, la segunda quincena de marzo del presente año, y que atendieron
a clientes que pagaron más de 5000 Bs y que pagaron en efectivo.*/
USE [AUTO TECH];
GO

SELECT EM.ID_EMPLEADO,
EM.NOMBRE_EMPLEADO,
EM.TELEFONO_EMPLEADO,
EM.TIPO_DE_EMPLEADO
FROM EMPLEADO EM
JOIN EFECTUA EF ON EF.ID_EMPLEADO = EM.ID_EMPLEADO
JOIN REPARACION R ON R.ID_REPARACION = EF.ID_REPARACION
JOIN ORDENDETRABAJO O ON O.ID_ORDEN = R.ID_ORDEN
WHERE O.COSTO_TOTAL > 4000 
AND HORA_DE_INGRESO BETWEEN '06:00:00' AND '14:00:00'
AND FECHA_INGRESO_AUTO BETWEEN '2015-03-16' AND '2025-03-31'
GROUP BY EM.ID_EMPLEADO, EM.NOMBRE_EMPLEADO, EM.TELEFONO_EMPLEADO, EM.TIPO_DE_EMPLEADO
GO