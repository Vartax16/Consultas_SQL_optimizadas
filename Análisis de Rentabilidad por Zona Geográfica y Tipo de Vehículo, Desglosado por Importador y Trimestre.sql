--Análisis de Rentabilidad por Zona Geográfica y Tipo de Vehículo, Desglosado por Importador y Trimestre

SELECT
    z.ZN_NOMBRE AS ZonaGeografica,
    a.ART_DESCRIPCION AS TipoDeVehiculo,
    sn.SN_NOMBRE AS Importador,
    DATEPART(QUARTER, v.FECHA_VENTA) AS Trimestre,
    SUM(v.TOTAL) AS TotalVentas,
    SUM(d.CANTIDAD * a.ART_COSTO) AS TotalCostos,
    SUM(v.TOTAL) - SUM(d.CANTIDAD * a.ART_COSTO) AS Rentabilidad
FROM
    HIS_VENTAS_C v
    JOIN HIS_VENTAS_D d ON v.ID_VENTAS = d.ID_DETALLE_VENTAS
    JOIN DM_ARTICULOS a ON d.ID_ARTICULO = a.ID_ARTICULO
    JOIN DM_SOCIOSNEGOCIOS sn ON v.ID_CLIENTE = sn.ID_SOCIO
    JOIN TB_ZONA z ON sn.SN_DI_ZONA = z.ID_ZONA
WHERE
    v.FECHA_VENTA BETWEEN '2023-01-01' AND '2024-12-31' -- Ajusta el rango de fechas según el período deseado
GROUP BY
    z.ZN_NOMBRE,
    a.ART_DESCRIPCION,
    sn.SN_NOMBRE,
    DATEPART(QUARTER, v.FECHA_VENTA)
ORDER BY
    z.ZN_NOMBRE,
    a.ART_DESCRIPCION,
    sn.SN_NOMBRE,
    DATEPART(QUARTER, v.FECHA_VENTA);
