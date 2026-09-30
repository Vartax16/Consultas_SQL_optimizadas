--Ingreso mensual por provincia y categoría de artículos, segmentado por año

SELECT
    p.PRV_NOMBRE AS Provincia,
    DATEPART(MONTH, v.FECHA_VENTA) AS Mes,
    YEAR(v.FECHA_VENTA) AS Año,
    ga.GR_NOMBRE AS Categoria,
    COUNT(d.ID_ARTICULO) AS TotalArticulosVendidos,
    SUM(d.TOTAL_VENTA) AS IngresosGenerados
FROM
    HIS_VENTAS_D d
    JOIN HIS_VENTAS_C v ON d.ID_DETALLE_VENTAS = v.ID_VENTAS
    JOIN DM_ARTICULOS a ON d.ID_ARTICULO = a.ID_ARTICULO
    JOIN TB_GRUPOART ga ON a.ART_GRUPO = ga.ID_GRUPOART
    JOIN DM_SOCIOSNEGOCIOS s ON v.ID_CLIENTE = s.ID_SOCIO
    JOIN TB_PROVINCIA p ON s.SN_DI_PROVINCIA = p.ID_PROVINCIA
GROUP BY
    p.PRV_NOMBRE,
    DATEPART(MONTH, v.FECHA_VENTA),
    YEAR(v.FECHA_VENTA),
    ga.GR_NOMBRE
ORDER BY
    p.PRV_NOMBRE,
    Año,
    Mes,
    IngresosGenerados DESC;

