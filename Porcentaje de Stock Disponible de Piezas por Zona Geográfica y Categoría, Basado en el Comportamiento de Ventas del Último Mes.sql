--Porcentaje de Stock Disponible de Piezas por Zona Geográfica y Categoría, Basado en el Comportamiento de Ventas del Último Mes
WITH VentasUltimoMes AS (
    SELECT
        d.ID_ARTICULO,
        SUM(d.CANTIDAD) AS TotalVendidos
    FROM
        HIS_VENTAS_D d
        JOIN HIS_VENTAS_C v ON d.ID_DETALLE_VENTAS = v.ID_VENTAS
    WHERE
       YEAR(v.FECHA_VENTA) >= 2023 -- Ajuste según el período de análisis
    GROUP BY
        d.ID_ARTICULO
),
StockPorZonaCategoria AS (
    SELECT
        ga.GR_NOMBRE AS Categoria,
        z.ZN_NOMBRE AS ZonaGeografica,
        a.ART_STOCK AS StockDisponible,
        COALESCE(vu.TotalVendidos, 0) AS VentasRecientes
    FROM
        DM_ARTICULOS a
        JOIN HIS_COMPRAS_D hd ON hd.ID_ARTICULO = a.ID_ARTICULO
        JOIN DM_SOCIOSNEGOCIOS s ON a.ART_GRUPO = s.SN_GRUPOSN
        JOIN TB_ZONA z ON s.SN_DI_ZONA = z.ID_ZONA
        LEFT JOIN VentasUltimoMes vu ON a.ID_ARTICULO = vu.ID_ARTICULO
        JOIN TB_GRUPOART ga ON a.ART_GRUPO = ga.ID_GRUPOART
),
Resumendeventasultmes AS (
    SELECT
        sp.Categoria AS CategoriaPieza,
        sp.ZonaGeografica AS Zona,
        sp.StockDisponible AS StockDisponible,
        sp.VentasRecientes AS VentasRecientes,
        CASE
            WHEN COALESCE(sp.VentasRecientes, 0) = 0 THEN 100
            ELSE (sp.StockDisponible / (COALESCE(sp.VentasRecientes, 0) + sp.StockDisponible)) * 100
        END AS PorcentajeStockDisponible
    FROM
        StockPorZonaCategoria sp
)
SELECT 
    CategoriaPieza,
    Zona,
    SUM(StockDisponible) AS StockDisponible,
    SUM(VentasRecientes) AS VentasRecientes,
    AVG(PorcentajeStockDisponible) AS PorcentajeStockDisponible, 
    DATEADD(MONTH, -1, GETDATE()) AS Fechaproyectada
FROM 
    Resumendeventasultmes
GROUP BY 
    CategoriaPieza,
    Zona
ORDER BY
    CategoriaPieza,
    Zona;


