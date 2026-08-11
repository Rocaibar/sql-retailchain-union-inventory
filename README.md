# Consolidador de Inventario: UNION vs UNION ALL
----
## Preguntas y análisis técnico.

### ¿Cuántas filas devuelve cada consulta y por qué son distintas?
* ** 'UNION ALL' (Consulta 2): ** devuelve **14 filas** ( 7 registros de la sucursal norte y 7 registros de la sucursal sur). Consolida el 100% de los registros sin omitir ningún elemento.
* ** 'UNION' (Consulta 1): ** devuelve **14 filas**.

'UNION' únicamente elimina filas si son **completamente idénticas en todas sus columnas seleccionadas**.
En el conjunto de datos de análisis:
* Los productos con IDs '103', '104' y '106' existen en ambas sucursales, pero tienen **diferente stock** (por ejemplo, el producto '103' tiene stock '5' en norte y stock '3' en sur. Al ser diferente stock, la fila no es exactamente idéntica y 'UNION' la conserva.
* El producto "Webcam HD 1080p" tiene el mismo nombre y categoría en ambas tablas, pero posee diferente 'id_producto' ('107' en norte y '111' en sur) y distinto stock ('12' vs '9'), por lo que tampoco se descarta.
Para que 'UNION' reduzca la cantidad de filas, las dos sucursales deberían tener un registro exactamente igual en todas sus columnas (mismo 'id_producto', 'nombre_producto', 'categoria', 'stock'). De no incluir  la columna 'stock' en el 'SELECT', los productos '103', '104' y '106' si se duplicarían.
 ---
 ### 2. ¿Por qué UNION ALL es más eficiente que UNION?
 'UNION ALL' se limita a concatenar directamente los resultados de las dos consultas.
 En cambio, 'UNION' requiere un paso de procesamiento adicional para garantizar la unicidad de los datos.
 ---
 ### 3. ¿En qué casos de negocios usarías cada uno?
 #### 'UNION':
 1. **Consolidación de clientes para campañas de marketing:** Unificar listas de clientes de diferentes unidades de negocio excluyendo duplicados para evitar enviar el mismo correo dos veces a la misma persona.
 2.  **Creación de maestros de categorías o dimensiones:** Consolidar un listado único de proveedores o productos provenientes de múltiples sistemas ERP regionales para construir una tabla dimensional limpia.
#### 'UNION ALL':
 1. **Historial consolidado de transacciones:** Combinar tablas de ventas mensuales ('ventas_enero','ventas_febrero') para calcular ingresos totales o volumen general de ventas, donde cada registro representa un evento real que no debe filtrarse.
 2. **Consolidación de logs de eventos/auditoría:** Reunir los registros de actividad de varios servidores web para auditoría de seguridad y análisis de tráfico total.
---
### 4. ¿Qué pasa si las columnas de ambas consultas no coinciden en número y tipo? ¿Qué error genera?
Si las consultas involucradas en 'UNION' o 'UNION ALL' no coinciden en número de columnas o si su tipos de datos son incompatibles e implícitamente no convertibles, el gestor de base de datos interrumpe la ejecución y arroja un error de sintaxis/estructura.
