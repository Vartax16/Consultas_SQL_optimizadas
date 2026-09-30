--Margen de Ganancia Comparativo entre Costo de Línea y Precio de Artículo con Validación de Discrepancias por trimestre

WITH Ventas AS (
    SELECT
        d.ID_ARTICULO,
        SUM(d.CANTIDAD) AS CantidadVendida,
        SUM(d.PRECIO_UNITARIO * d.CANTIDAD) AS TotalVentas,
        DATEPART(QUARTER, v.FECHA_VENTA) AS Trimestre,
        YEAR(v.FECHA_VENTA) AS Año
    FROM
        HIS_VENTAS_D d
        JOIN HIS_VENTAS_C v ON d.ID_DETALLE_VENTAS = v.ID_VENTAS
    GROUP BY
        d.ID_ARTICULO,
        DATEPART(QUARTER, v.FECHA_VENTA),
        YEAR(v.FECHA_VENTA)
),
Compras AS (
    SELECT
        d.ID_ARTICULO,
        SUM(d.CANTIDAD) AS CantidadComprada,
        SUM(d.COSTO * d.CANTIDAD) AS TotalCompras,
        DATEPART(QUARTER, c.FECHA_COMPRA) AS Trimestre,
        YEAR(c.FECHA_COMPRA) AS Año
    FROM
        HIS_COMPRAS_D d
        JOIN HIS_COMPRAS_C c ON d.ID_DETALLE_COMPRA = c.ID_COMPRAS
    GROUP BY
        d.ID_ARTICULO,
        DATEPART(QUARTER, c.FECHA_COMPRA),
        YEAR(c.FECHA_COMPRA)
),
MargenGanancia AS (
    SELECT
        v.ID_ARTICULO,
        a.ART_DESCRIPCION AS DescripcionArticulo,
        v.Trimestre,
        v.Año,
        v.TotalVentas,
        c.TotalCompras,
        (v.TotalVentas - c.TotalCompras) AS MargenBruto,
        ((v.TotalVentas - c.TotalCompras) / NULLIF(c.TotalCompras, 0)) * 100 AS MargenPorcentaje,
        a.ART_COSTO AS CostoUnitarioArticulo,
        a.ART_PRECIO AS PrecioUnitarioArticulo
    FROM
        Ventas v
        JOIN Compras c ON v.ID_ARTICULO = c.ID_ARTICULO AND v.Trimestre = c.Trimestre AND v.Año = c.Año
        JOIN DM_ARTICULOS a ON v.ID_ARTICULO = a.ID_ARTICULO
)
SELECT
    ID_ARTICULO,
    DescripcionArticulo,
    Trimestre,
    Año,
    TotalVentas,
    TotalCompras,
    CostoUnitarioArticulo,
    PrecioUnitarioArticulo,
    MargenBruto,
    MargenPorcentaje
FROM
    MargenGanancia
ORDER BY
    Año,
    Trimestre,
    ID_ARTICULO;
