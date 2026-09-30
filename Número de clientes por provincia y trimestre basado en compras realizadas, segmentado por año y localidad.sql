
--Número de clientes por provincia y trimestre basado en compras realizadas, segmentado por año y localidad
--100080192
SELECT
    p.PRV_NOMBRE AS Provincia,
    DATEPART(QUARTER, v.FECHA_VENTA) AS Trimestre,
    YEAR(v.FECHA_VENTA) AS Año,
    COUNT(DISTINCT v.ID_CLIENTE) AS NumeroClientes
FROM
    HIS_VENTAS_C v
    JOIN DM_SOCIOSNEGOCIOS s ON v.ID_CLIENTE = s.ID_SOCIO
    JOIN TB_PROVINCIA p ON s.SN_DI_PROVINCIA = p.ID_PROVINCIA
GROUP BY
    p.PRV_NOMBRE,
    DATEPART(QUARTER, v.FECHA_VENTA),
    YEAR(v.FECHA_VENTA)
ORDER BY
    p.PRV_NOMBRE,
    Año,
    Trimestre;


