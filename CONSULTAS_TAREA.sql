select c.nombre_cliente,c.telefono_cliente  from CLIENTE c,AUTO a,FALLAS f, DIAGNOSTICO d,ORDENDETRABAJO o
where c.CI=a.CI and a.PLACA=f.PLACA and f.ID_Falla=d.ID_Falla and d.id_diagnostico=o.id_diagnostico and marca='SUZUKI'and nombre_falla='Motor' 
and COSTO_TOTAL>2000 and FECHA_INGRESO_AUTO<'2025-04-1' and FECHA_INGRESO_AUTO>'2024-12-30'


select TOP 5 c.CI,c.NOMBRE_CLIENTE,count(*)as cantidad_De_veces_que_vino,avg(COSTO_TOTAL)as promedio_de_pagos from CLIENTE c,AUTO a,FALLAS f, DIAGNOSTICO d,ORDENDETRABAJO o
where c.CI=a.CI and a.PLACA=f.PLACA and f.ID_Falla=d.ID_Falla and d.id_diagnostico=o.id_diagnostico
and YEAR(FECHA_INGRESO_AUTO)<2026 and YEAR(FECHA_INGRESO_AUTO)>2023 --
group by c.CI,c.NOMBRE_CLIENTE
order by promedio_de_pagos desc

select em.ID_EMPLEADO,em.NOMBRE_EMPLEADO,r.DESCRIPCION_REPARACION,o.FECHA_INGRESO_AUTO,o.FECHA_EGRESO_AUTO,re.DESCRIPCION_REPUESTO,o.COSTO_TOTAL,re.CANTIDAD,re.COSTO_UNITARIO,re.DETALLE_REPUESTO_T_O_C_ from CLIENTE c,AUTO a,FALLAS f, DIAGNOSTICO d,ORDENDETRABAJO o,REPARACION r,EFECTUA ef,EMPLEADO em,REPUESTOS re
where c.CI=a.CI and a.PLACA=f.PLACA and f.ID_Falla=d.ID_Falla and d.id_diagnostico=o.id_diagnostico and r.ID_ORDEN=o.ID_ORDEN and ef.ID_REPARACION=r.ID_REPARACION and ef.ID_EMPLEADO=em.ID_EMPLEADO and re.ID_REPUESTOS=r.ID_REPUESTOS--joins
and a.MARCA='Suzuki' and a.MODELO='2020' and a.COLOR='Negro' and a.PLACA='7412GYT'--buscar auto
and o.FECHA_INGRESO_AUTO<'2025-03-1' and o.FECHA_INGRESO_AUTO>'2025-01-28'


select em.ID_EMPLEADO,em.NOMBRE_EMPLEADO,em.TELEFONO_EMPLEADO,em.TIPO_DE_EMPLEADO from ORDENDETRABAJO o,REPARACION r,EFECTUA ef,EMPLEADO em
where ef.ID_EMPLEADO=em.ID_EMPLEADO and ef.ID_REPARACION=r.ID_REPARACION and o.ID_ORDEN=r.ID_ORDEN and o.COSTO_TOTAL>4000 and HORA_DE_INGRESO BETWEEN '06:00:00' AND '14:00:00' -- Turno uno
AND FECHA_INGRESO_AUTO BETWEEN '2025-03-16' AND '2025-03-31' -- Segunda quincena de marzo
group by em.ID_EMPLEADO,em.NOMBRE_EMPLEADO,em.TELEFONO_EMPLEADO,em.TIPO_DE_EMPLEADO

