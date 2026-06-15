-- ==================================================================================
-- Gestión Inteligente de Clínicas (Proyecto 3)
-- Integrantes: Ariel Leiva, Hugo Palomino, Felipe Romero y Franco Bernal
-- Asignatura: ICI3240-2
-- ==================================================================================

-- ==================================================================================
-- CONSULTA 1: Registro de Administraciones
-- ==================================================================================
-- Objetivo: Alimentar la tabla principal de "Atención Clínica y Pacientes".
-- Muestra el historial de procedimientos ordenado por fecha/hora descendente.
-- Demuestra el uso de LEFT JOIN, GROUP BY y GROUP_CONCAT para traer las
-- alergias conocidas del paciente en un solo string. Además, usa lógica
-- condicional y agregación para definir dinámicamente si la administración
-- está 'Realizada', 'Bloqueada' (si coincide una alergia) o 'Por realizar'.
-- ==================================================================================

SELECT 
    CONCAT('Adm', LPAD(a.id_administracion, 3, '0')) AS id_proc,
    DATE_FORMAT(a.fecha_hora, '%d/%m') AS fecha,
    DATE_FORMAT(a.fecha_hora, '%H:%i') AS hora,
    CONCAT(p_pac.nombre, ' ', p_pac.apellido) AS paciente,
    IFNULL(GROUP_CONCAT(DISTINCT al.nombre_componente SEPARATOR ', '), 'Sin Alergias') AS alergias_conocidas,
    CONCAT(p_per.nombre, ' ', p_per.apellido) AS responsable,
    i.nombre AS insumo_administrado,
    ai.cantidad AS dosis_cant,
    CASE 
        WHEN a.realizada = TRUE THEN 'Realizada'
        WHEN a.realizada = FALSE AND SUM(CASE WHEN al.nombre_componente IS NOT NULL AND m.componente LIKE CONCAT('%', al.nombre_componente, '%') THEN 1 ELSE 0 END) > 0 THEN 'Bloqueada'
        ELSE 'Por realizar'
    END AS estado
FROM Administracion a
JOIN Persona p_pac ON a.rut_paciente = p_pac.rut
JOIN Persona p_per ON a.rut_personal = p_per.rut
JOIN Administracion_Insumo ai ON a.id_administracion = ai.id_administracion
JOIN Insumo i ON ai.id_insumo = i.id_insumo
LEFT JOIN Medicamento m ON i.id_insumo = m.id_insumo
LEFT JOIN Paciente_Alergia pa ON a.rut_paciente = pa.rut_paciente
LEFT JOIN Alergia al ON pa.id_alergia = al.id_alergia
GROUP BY 
    a.id_administracion, 
    a.fecha_hora,
    p_pac.nombre, 
    p_pac.apellido, 
    p_per.nombre, 
    p_per.apellido, 
    i.nombre, 
    ai.cantidad,
    a.realizada
ORDER BY a.fecha_hora DESC;

-- ==================================================================================
-- CONSULTA 2: Alertas Farmacológicas
-- ==================================================================================
-- Objetivo: Alimentar el panel lateral de Alertas.
-- Demuestra el uso de operadores de conjuntos (UNION).
-- ==================================================================================

SELECT 
    'ALERTA CRÍTICA' AS tipo_alerta,
    CONCAT(p_pac.nombre, ' ', p_pac.apellido) AS paciente,
    CONCAT('Alergia a ', al.nombre_componente) AS condicion,
    pa.gravedad AS nivel_riesgo,
    i.nombre AS insumo_implicado,
    'Bloqueo Automático' AS accion_sistema
FROM Administracion a
JOIN Persona p_pac ON a.rut_paciente = p_pac.rut
JOIN Paciente_Alergia pa ON a.rut_paciente = pa.rut_paciente
JOIN Alergia al ON pa.id_alergia = al.id_alergia
JOIN Administracion_Insumo ai ON a.id_administracion = ai.id_administracion
JOIN Insumo i ON ai.id_insumo = i.id_insumo
JOIN Medicamento m ON i.id_insumo = m.id_insumo
WHERE m.componente LIKE CONCAT('%', al.nombre_componente, '%') 
  AND a.realizada = FALSE

UNION

SELECT 
    'PRECAUCIÓN CLÍNICA' AS tipo_alerta,
    CONCAT(p_pac.nombre, ' ', p_pac.apellido) AS paciente,
    enf.nombre_enfermedad AS condicion,
    'A Evaluar Clínicamente' AS nivel_riesgo,
    i.nombre AS insumo_implicado,
    'Requiere Validación Médica' AS accion_sistema
FROM Administracion a
JOIN Persona p_pac ON a.rut_paciente = p_pac.rut
JOIN Paciente_Enfermedad pe ON a.rut_paciente = pe.rut_paciente
JOIN Enfermedad enf ON pe.id_enfermedad = enf.id_enfermedad
JOIN Administracion_Insumo ai ON a.id_administracion = ai.id_administracion
JOIN Insumo i ON ai.id_insumo = i.id_insumo
WHERE a.realizada = FALSE;

-- ==================================================================================
-- CONSULTA 3: Últimos Ingresos a Bodega (Abastecimiento)
-- ==================================================================================
-- Objetivo: Alimentar la tabla inferior izquierda de logística.
-- ==================================================================================

SELECT 
    CONCAT('ORD-', o.id_orden) AS num_orden,
    DATE_FORMAT(oi.fecha_ingreso, '%d/%m') AS fecha,
    i.nombre AS insumo_recibido,
    oi.numero_lote AS lote,
    o.nombre_proveedor AS proveedor,
    CONCAT('+', oi.cantidad_ingresada, ' uds') AS cantidad
FROM Orden_Insumo oi
JOIN Orden o ON oi.id_orden = o.id_orden
JOIN Insumo i ON oi.id_insumo = i.id_insumo
ORDER BY oi.fecha_ingreso DESC;

-- ==================================================================================
-- CONSULTA 4: Control de Caducidad
-- ==================================================================================
-- Objetivo: Alimentar el panel inferior derecho de inventario crítico.
-- Demuestra el uso de funciones de fecha y tiempo (DATEDIFF, CURDATE).
-- ==================================================================================

SELECT 
    i.nombre AS insumo,
    'MEDICAMENTO' AS tipo_insumo,
    i.stock AS stock_actual,
    DATEDIFF(m.fecha_vencimiento, CURDATE()) AS dias_para_vencer,
    IF(DATEDIFF(m.fecha_vencimiento, CURDATE()) <= 30, 'CRÍTICO', 'PRECAUCIÓN') AS estado_caducidad
FROM Insumo i
JOIN Medicamento m ON i.id_insumo = m.id_insumo
WHERE i.stock > 0 
  AND m.fecha_vencimiento >= CURDATE()
  AND DATEDIFF(m.fecha_vencimiento, CURDATE()) <= 60

UNION

SELECT 
    i.nombre AS insumo,
    'MATERIAL CLÍNICO' AS tipo_insumo,
    i.stock AS stock_actual,
    DATEDIFF(mc.fecha_vencimiento, CURDATE()) AS dias_para_vencer,
    IF(DATEDIFF(mc.fecha_vencimiento, CURDATE()) <= 30, 'CRÍTICO', 'PRECAUCIÓN') AS estado_caducidad
FROM Insumo i
JOIN Material_Clinico mc ON i.id_insumo = mc.id_insumo
WHERE i.stock > 0 
  AND mc.fecha_vencimiento >= CURDATE()
  AND DATEDIFF(mc.fecha_vencimiento, CURDATE()) <= 60

ORDER BY dias_para_vencer ASC;