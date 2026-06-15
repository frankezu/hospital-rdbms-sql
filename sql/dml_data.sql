-- ==================================================================================
-- Gestión Inteligente de Clínicas (Proyecto 3)
-- Integrantes: Ariel Leiva, Hugo Palomino, Felipe Romero y Franco Bernal
-- Asignatura: ICI3240-2
-- ==================================================================================

-- ==========================================
-- 1. POBLAR ENTIDADES SUPER TIPO Y MAESTROS
-- ==========================================

-- Insertar Personas (8 Personal Médico y 11 Pacientes)
INSERT INTO Persona (rut, nombre, apellido, fecha_nacimiento, correo, telefono) VALUES
('21000111-1', 'Franco', 'Bernal', '2005-05-10', 'f.bernal@clinica.cl', '+56911111111'),
('21000222-2', 'Ariel', 'Leiva', '2004-03-12', 'a.leiva@clinica.cl', '+56922222222'),
('21000333-3', 'Felipe', 'Romero', '2004-08-20', 'f.romero@clinica.cl', '+56933333333'),
('21000444-4', 'Hugo', 'Palomino', '2005-01-05', 'h.palomino@clinica.cl', '+56944444444'),
('12000111-1', 'Laura', 'Guzman', '1982-11-05', 'l.guzman@clinica.cl', '+56950505050'),
('13000222-2', 'Roberto', 'Navarro', '1978-04-12', 'r.navarro@clinica.cl', '+56960606060'),
('10000111-1', 'Martin', 'Pino', '1990-03-12', 'm.pino@clinica.cl', '+56900000001'),
('09000222-2', 'Ignacia', 'Luna', '1985-06-25', 'i.luna@clinica.cl', '+56900000002'),
('15000111-K', 'Juan', 'Perez', '1980-10-10', 'juan.perez@mail.com', '+56955555555'),
('16000222-K', 'Maria', 'Gomez', '1992-12-01', 'm.gomez@mail.com', '+56966666666'),
('17000333-K', 'Carlos', 'Diaz', '1975-04-14', 'carlos.d@mail.com', '+56977777777'),
('18000444-K', 'Ana', 'Rios', '2000-11-22', 'ana.rios99@mail.com', '+56988888888'),
('19000555-5', 'Luis', 'Soto', '1988-06-15', 'luis.soto@mail.com', '+56999999999'),
('20000666-6', 'Carla', 'Molina', '1995-09-08', 'carla.m@mail.com', '+56910101010'),
('22000777-7', 'Pedro', 'Castillo', '1970-02-28', 'pedro.c@mail.com', '+56920202020'),
('23000888-8', 'Sofia', 'Vargas', '1985-07-19', 'sofia.v@mail.com', '+56930303030'),
('24000999-9', 'Diego', 'Hernandez', '1990-10-30', 'diego.h@mail.com', '+56940404040'),
('25000333-3', 'Tomas', 'Cortes', '2008-01-30', 'tomas.c@mail.com', '+56900000003'),
('26000444-4', 'Valentina', 'Mora', '1998-12-10', 'vale.m@mail.com', '+56900000004');

INSERT INTO Alergia (nombre_componente) VALUES
('Penicilina'),
('Látex'),
('Ibuprofeno'),
('Yodo'),
('Polen'),
('Polvo'),
('Mariscos'),
('Maní'),
('Picadura de Abeja');

INSERT INTO Enfermedad (nombre_enfermedad) VALUES
('Hipertensión Arterial'),
('Diabetes Tipo 2'),
('Asma Bronquial'),
('Arritmia Cardíaca'),
('Hipotiroidismo'),
('Artritis Reumatoide'),
('COVID-19'),
('Migraña Crónica'),
('Insuficiencia Renal'),
('Anemia');

-- Insertar Insumos Base
INSERT INTO Insumo (fabricante, nombre, stock) VALUES
('MedTronic', 'Monitor de Signos Vitales', 5),         -- id 1 (Equipo)
('General Electric', 'Desfibrilador Portátil', 2),     -- id 2 (Equipo)
('Johnson & Johnson', 'Gasa Estéril', 500),            -- id 3 (Material)
('3M Medical', 'Jeringa', 1200),                       -- id 4 (Material)
('Laboratorios Chile', 'Amoxicilina', 150),            -- id 5 (Medicamento)
('Bayer', 'Aspirina', 300),                            -- id 6 (Medicamento)
('Pfizer', 'Ibuprofeno', 80),                          -- id 7 (Medicamento)
('Andrómaco', 'Paracetamol', 450),                     -- id 8 (Medicamento)
('Becton Dickinson', 'Jeringa', 800),                  -- id 9 (Material)
('3M Medical', 'Cinta Adhesiva Médica', 300),          -- id 10 (Material)
('Philips', 'Ecógrafo Portátil', 1),                   -- id 11 (Equipo)
('Roche', 'Analizador de Sangre', 1),                  -- id 12 (Equipo)
('Laboratorios Chile', 'Losartán', 200),               -- id 13 (Medicamento)
('Bayer', 'Diclofenaco', 150),                         -- id 14 (Medicamento)
('Pfizer', 'Vacuna COVID-19', 50),                     -- id 15 (Medicamento)
('Andrómaco', 'Omeprazol', 300),                       -- id 16 (Medicamento)
('Medix', 'Incubadora Neonatal', 0),                   -- id 17 (Equipo - Roto)
('BSN medical', 'Venda Elástica', 200),                -- id 18 (Material - No estéril)
('Laboratorios Saval', 'Ketorolaco', 100),             -- id 19 (Medicamento - Intravenosa)
('Baxter', 'Suero Fisiológico', 500);                  -- id 20 (Medicamento - Intravenosa)

INSERT INTO Orden (nombre_proveedor) VALUES
('Distribuidora Médica del Pacífico S.A.'),
('Farmacéutica Nacional de Chile'),
('Insumos Médicos Globales S.A.'),
('Equipamiento Hospitalario SpA');

-- ==========================================
-- 2. POBLAR SUBTIPOS DE PERSONA
-- ==========================================

INSERT INTO Personal (rut, rol, correo_institucional) VALUES
('21000111-1', 'Médico Cirujano', 'f.bernal@clinica.cl'),
('21000222-2', 'Enfermero Jefe', 'a.leiva@clinica.cl'),
('21000333-3', 'Médico Internista', 'f.romero@clinica.cl'),
('21000444-4', 'Arsenalero Médico', 'h.palomino@clinica.cl'),
('12000111-1', 'Anestesista', 'l.guzman@clinica.cl'),
('13000222-2', 'Tecnólogo Médico', 'r.navarro@clinica.cl'),
('10000111-1', 'Paramédico', 'm.pino@clinica.cl'),
('09000222-2', 'Auxiliar de Farmacia', 'i.luna@clinica.cl');

INSERT INTO Paciente (rut, altura, peso, grupo_sanguineo) VALUES
('15000111-K', 1.75, 80.5, 'O+'),
('16000222-K', 1.62, 65.0, 'A-'),
('17000333-K', 1.80, 92.3, 'B+'),
('18000444-K', 1.58, 55.2, 'AB+'),
('19000555-5', 1.70, 75.0, 'O-'),
('20000666-6', 1.65, 60.5, 'A+'),
('22000777-7', 1.82, 88.0, 'B-'),
('23000888-8', 1.60, 58.0, 'O+'),
('24000999-9', 1.78, 82.0, 'AB-'),
('25000333-3', 1.65, 55.0, 'O+'),
('26000444-4', 1.70, 62.0, 'A-');

-- ==========================================
-- 3. POBLAR SUBTIPOS DE INSUMO
-- ==========================================

INSERT INTO Equipo_Instrumental (id_insumo, estado_operativo, fecha_fabricacion, vida_util, ultimo_mantenimiento, frecuencia_mantenimiento) VALUES
(1, TRUE, '2023-01-15', 10, '2026-01-10', 1),
(2, TRUE, '2022-05-20', 8, '2025-11-05', 1),
(11, TRUE, '2024-02-10', 5, '2025-12-01', 1),
(12, TRUE, '2023-08-15', 7, '2026-02-20', 1),
(17, FALSE, '2015-05-10', 10, '2024-01-01', 1);

INSERT INTO Material_Clinico (id_insumo, capacidad, material, esteril, unidad_medida, fecha_vencimiento) VALUES
(3, 'N/A', 'Algodón', TRUE, 'Caja', '2028-12-31'),
(4, '5ml', 'Plástico', TRUE, 'Unidad', '2027-06-30'),
(9, '10ml', 'Plástico', TRUE, 'Unidad', '2028-05-15'),
(10, '5m', 'Tela', FALSE, 'Rollo', '2029-11-20'),
(18, '10cm', 'Algodón/Poliéster', FALSE, 'Rollo', '2030-01-01');

INSERT INTO Medicamento (id_insumo, componente, concentracion, formas_galenicas, via_administracion, fecha_vencimiento) VALUES
(5, 'Amoxicilina Trihidratada (Derivado Penicilina)', '500mg', 'Cápsula', 'Oral', '2027-08-15'),
(6, 'Ácido Acetilsalicílico', '100mg', 'Comprimido', 'Oral', '2028-02-20'),
(7, 'Ibuprofeno', '400mg', 'Comprimido', 'Oral', '2026-07-25'), 
(8, 'Paracetamol', '500mg', 'Comprimido', 'Oral', '2029-01-10'),
(13, 'Losartán Potásico', '50mg', 'Comprimido', 'Oral', '2027-10-30'),
(14, 'Diclofenaco Sódico', '50mg', 'Gragea', 'Oral', '2026-09-15'),
(15, 'ARNm viral', '0.3ml', 'Solución Inyectable', 'Intramuscular', '2026-12-31'),
(16, 'Omeprazol', '20mg', 'Cápsula', 'Oral', '2028-04-10'),
(19, 'Ketorolaco Trometamol', '30mg', 'Ampolla', 'Intravenosa', '2025-10-01'),
(20, 'Cloruro de Sodio', '0.9%', 'Bolsa', 'Intravenosa', '2027-11-15');

-- ==========================================
-- 4. POBLAR ENTIDADES DÉBILES
-- ==========================================

INSERT INTO Ingreso (fecha_ingreso, motivo, rut_paciente) VALUES
('2026-06-10', 'Crisis hipertensiva y dolor torácico', '15000111-K'),
('2026-06-12', 'Infección respiratoria aguda', '16000222-K'),
('2026-06-14', 'Control post-operatorio', '17000333-K'),
('2026-06-15', 'Control de rutina y exámenes', '19000555-5'),
('2026-06-16', 'Dolor abdominal agudo', '20000666-6'),
('2026-06-17', 'Reacción alérgica severa', '22000777-7'),
('2026-06-18', 'Traumatismo por caída', '24000999-9'),
('2026-06-19', 'Cirugía de apéndice', '25000333-3'),
('2026-06-20', 'Evaluación para donación de sangre', '26000444-4');

INSERT INTO Prescripcion (dosis, diagnostico, id_ingreso, rut_personal) VALUES
('1 comprimido cada 8 horas', 'Infección bacteriana en tracto respiratorio', 2, '21000111-1'),
('100mg diarios en la mañana', 'Prevención de infarto agudo al miocardio', 1, '21000333-3'),
('1 comprimido al día', 'Hipertensión controlada', 4, '21000333-3'),
('1 cápsula en ayunas', 'Gastritis aguda', 5, '12000111-1'),
('1 dosis única', 'Prevención de infección', 6, '21000111-1'),
('1 ampolla cada 12 horas', 'Manejo del dolor postoperatorio', 8, '10000111-1'),
('500ml infusión continua', 'Hidratación intravenosa', 8, '10000111-1');

-- ==========================================
-- 5. POBLAR ENTIDADES ASOCIATIVAS (N:M)
-- ==========================================

INSERT INTO Paciente_Alergia (rut_paciente, id_alergia, gravedad) VALUES
('16000222-K', 1, 'Severa - Shock Anafiláctico'), 
('15000111-K', 3, 'Leve - Erupción cutánea'),
('18000444-K', 2, 'Moderada'),
('19000555-5', 6, 'Leve - Estornudos'), 
('22000777-7', 7, 'Severa - Shock Anafiláctico'), 
('24000999-9', 8, 'Moderada - Erupción'), 
('20000666-6', 4, 'Leve'),
('25000333-3', 9, 'Severa - Edema de glotis');

INSERT INTO Paciente_Enfermedad (rut_paciente, id_enfermedad) VALUES
('15000111-K', 1),
('15000111-K', 4),
('17000333-K', 2),
('19000555-5', 5), 
('23000888-8', 6), 
('24000999-9', 8),
('25000333-3', 10);

INSERT INTO Orden_Insumo (id_insumo, id_orden, numero_lote, fecha_ingreso, cantidad_ingresada) VALUES
(5, 1, 'LOTE-A123', '2026-06-01', 150),
(7, 2, 'LOTE-B456', '2026-05-15', 80),
(4, 1, 'LOTE-C789', '2026-06-10', 1200),
(11, 3, 'LOTE-D012', '2026-06-05', 1),
(12, 4, 'LOTE-E345', '2026-06-08', 1),
(13, 3, 'LOTE-F678', '2026-06-12', 200),
(14, 4, 'LOTE-G901', '2026-06-13', 150),
(19, 2, 'LOTE-H234', '2026-06-18', 100),
(20, 1, 'LOTE-I567', '2026-06-18', 500);

INSERT INTO Medicamento_Prescripcion (id_prescripcion, id_insumo) VALUES
(1, 5),
(2, 6),
(3, 13), 
(4, 16), 
(5, 14),
(6, 19),
(7, 20);

INSERT INTO Administracion (fecha_hora, rut_paciente, rut_personal, realizada) VALUES
('2026-06-10 10:30:00', '15000111-K', '21000222-2', TRUE),
('2026-06-12 15:45:00', '16000222-K', '21000222-2', FALSE),
('2026-06-15 09:00:00', '19000555-5', '13000222-2', TRUE),
('2026-06-16 11:30:00', '20000666-6', '21000444-4', TRUE),
('2026-06-17 14:20:00', '22000777-7', '21000222-2', FALSE),
('2026-06-19 18:00:00', '25000333-3', '10000111-1', TRUE);

INSERT INTO Administracion_Insumo (id_administracion, id_insumo, cantidad) VALUES
(1, 6, 1.00), 
(1, 4, 1.00), 
(2, 5, 2.00),
(3, 12, 1.00), 
(3, 9, 1.00), 
(4, 16, 1.00), 
(5, 15, 1.00),
(6, 19, 1.00),
(6, 20, 500.00);

-- ==========================================
-- 6. DATOS ADICIONALES (Para rellenar Dashboard)
-- ==========================================

INSERT INTO Orden_Insumo (id_insumo, id_orden, numero_lote, fecha_ingreso, cantidad_ingresada) VALUES
(8, 3, 'LOTE-J890', '2026-06-19', 450),
(6, 2, 'LOTE-K123', '2026-06-20', 300),
(3, 1, 'LOTE-L456', '2026-06-21', 500);

INSERT INTO Administracion (fecha_hora, rut_paciente, rut_personal, realizada) VALUES
('2026-06-21 08:15:00', '15000111-K', '21000222-2', FALSE),
('2026-06-21 09:30:00', '23000888-8', '21000111-1', FALSE),
('2026-06-21 10:45:00', '24000999-9', '12000111-1', TRUE),
('2026-06-21 11:00:00', '26000444-4', '13000222-2', FALSE);

INSERT INTO Administracion_Insumo (id_administracion, id_insumo, cantidad) VALUES
(7, 5, 1.00), 
(8, 14, 1.00), 
(9, 20, 250.00), 
(10, 8, 2.00);