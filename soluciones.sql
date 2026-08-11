--=============================================================
-- RetailChain - UNION y UNION ALL
-- Autor: Rocio Castro
-- Fecha: 11/08/2026
--=============================================================

-- CONSULTA 1: UNION
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa laempresa en toda su red de sucursales?
-- Muestra productos únicos en la red comercial. Elimina filas completamente idénticas.

SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_norte
UNION
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_sur;

-- CONSULTA 2: UNION ALL
-- Auditoria de stock total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock existen en total entre ambas sucursales?
-- Muestra la totalidad de registros físicos en ambas sucursales, manteniendo duplicados.

SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_norte
UNION ALL
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_sur;

-- CONSULTA 3: COMPARACIÓN DE RESULTADOS
-- Conteo de filas resultantes con UNION
SELECT COUNT (*) AS filas_union
FROM (
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_norte
UNION
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_sur)
AS resultado_union;

-- Conteo filas resultantes UNION ALL
SELECT COUNT (*) AS filas_union_all
FROM (
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_norte
UNION ALL
SELECT id_producto, nombre_producto, categoria, stock
FROM inventario_sucursal_sur)
AS resultado_union_all;