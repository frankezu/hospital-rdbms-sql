-- ==================================================================================
-- Gestión Inteligente de Clínicas (Proyecto 3)
-- Integrantes: Ariel Leiva, Hugo Palomino, Felipe Romero y Franco Bernal
-- Asignatura: ICI3240-2
-- ==================================================================================

-- ==========================================
-- 1. ENTIDADES SUPER TIPO Y MAESTROS
-- ==========================================

CREATE TABLE Persona (
    rut VARCHAR(10) PRIMARY KEY CHECK(LENGTH(rut) BETWEEN 9 AND 10), 
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(100) CHECK(correo LIKE '%@%.%'),
    telefono CHAR(12) NOT NULL CHECK(telefono LIKE '+569%')
);

CREATE TABLE Alergia (
    id_alergia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_componente VARCHAR(100) NOT NULL
);

CREATE TABLE Enfermedad (
    id_enfermedad INT AUTO_INCREMENT PRIMARY KEY,
    nombre_enfermedad VARCHAR(100) NOT NULL
);

CREATE TABLE Insumo (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    fabricante VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    stock INT DEFAULT 0 CHECK(stock >= 0)
);

CREATE TABLE Orden(
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100)
);

-- ==========================================
-- 2. SUBTIPOS DE PERSONA
-- ==========================================

CREATE TABLE Paciente (
    rut VARCHAR(10) PRIMARY KEY CHECK(LENGTH(rut) BETWEEN 9 AND 10),
    altura DECIMAL(5,2),
    peso DECIMAL(5,2),
    grupo_sanguineo VARCHAR(3),
    FOREIGN KEY (rut) REFERENCES Persona(rut)
);

CREATE TABLE Personal (
    rut VARCHAR(10) PRIMARY KEY CHECK(LENGTH(rut) BETWEEN 9 AND 10),
    rol VARCHAR(50) NOT NULL,
    correo_institucional VARCHAR(100) NOT NULL CHECK(correo_institucional LIKE '%@%.%'),
    FOREIGN KEY (rut) REFERENCES Persona(rut)
);

-- ==========================================
-- 3. SUBTIPOS DE INSUMO
-- ==========================================

CREATE TABLE Equipo_Instrumental (
    id_insumo INT PRIMARY KEY,
    estado_operativo BOOLEAN NOT NULL,
    fecha_fabricacion DATE,
    vida_util INT,
    ultimo_mantenimiento DATE,
    frecuencia_mantenimiento INT,
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

CREATE TABLE Material_Clinico (
    id_insumo INT PRIMARY KEY,
    capacidad VARCHAR(10),
    material VARCHAR(50),
    esteril BOOLEAN,
    unidad_medida VARCHAR(20), 
    fecha_vencimiento DATE,
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

CREATE TABLE Medicamento (
    id_insumo INT PRIMARY KEY,
    componente VARCHAR(100) NOT NULL,
    concentracion VARCHAR(50) NOT NULL,
    formas_galenicas VARCHAR(50),
    via_administracion VARCHAR(50),
    fecha_vencimiento DATE NOT NULL,
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

-- ==========================================
-- 4. ENTIDADES DÉBILES
-- ==========================================

CREATE TABLE Ingreso (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    fecha_ingreso DATE NOT NULL,
    motivo TEXT NOT NULL,
    rut_paciente VARCHAR(10) NOT NULL CHECK(LENGTH(rut_paciente) BETWEEN 9 AND 10),
    FOREIGN KEY (rut_paciente) REFERENCES Paciente(rut)
);

CREATE TABLE Prescripcion (
    id_prescripcion INT AUTO_INCREMENT PRIMARY KEY,
    dosis VARCHAR(100) NOT NULL,
    diagnostico TEXT NOT NULL,
    id_ingreso INT NOT NULL,
    rut_personal VARCHAR(10) NOT NULL CHECK(LENGTH(rut_personal) BETWEEN 9 AND 10),
    FOREIGN KEY (id_ingreso) REFERENCES Ingreso(id_ingreso),
    FOREIGN KEY (rut_personal) REFERENCES Personal(rut)
);

-- ==========================================
-- 5. ENTIDADES ASOCIATIVAS Y RELACIONES (N:M)
-- ==========================================

CREATE TABLE Administracion (
    id_administracion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    rut_paciente VARCHAR(10) NOT NULL,
    rut_personal VARCHAR(10) NOT NULL,
    realizada BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (rut_paciente) REFERENCES Paciente(rut),
    FOREIGN KEY (rut_personal) REFERENCES Personal(rut)
);

CREATE TABLE Administracion_Insumo (
    id_administracion INT,
    id_insumo INT,
    cantidad DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_administracion, id_insumo),
    FOREIGN KEY (id_administracion) REFERENCES Administracion(id_administracion),
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

CREATE TABLE Paciente_Alergia (
    rut_paciente VARCHAR(10) CHECK(LENGTH(rut_paciente) BETWEEN 9 AND 10),
    id_alergia INT,
    gravedad VARCHAR(50),
    PRIMARY KEY (rut_paciente, id_alergia),
    FOREIGN KEY (rut_paciente) REFERENCES Paciente(rut),
    FOREIGN KEY (id_alergia) REFERENCES Alergia(id_alergia)
);

CREATE TABLE Paciente_Enfermedad (
    rut_paciente VARCHAR(10) CHECK(LENGTH(rut_paciente) BETWEEN 9 AND 10),
    id_enfermedad INT,
    PRIMARY KEY (rut_paciente, id_enfermedad),
    FOREIGN KEY (rut_paciente) REFERENCES Paciente(rut),
    FOREIGN KEY (id_enfermedad) REFERENCES Enfermedad(id_enfermedad)
);

CREATE TABLE Medicamento_Prescripcion (
    id_prescripcion INT,
    id_insumo INT, 
    PRIMARY KEY (id_prescripcion, id_insumo),
    FOREIGN KEY (id_prescripcion) REFERENCES Prescripcion(id_prescripcion),
    FOREIGN KEY (id_insumo) REFERENCES Medicamento(id_insumo)
);

CREATE TABLE Orden_Insumo (
    id_insumo INT,
    id_orden INT,
    numero_lote VARCHAR(50) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    cantidad_ingresada INT NOT NULL,
    PRIMARY KEY (id_insumo, id_orden, numero_lote),
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo),
    FOREIGN KEY (id_orden) REFERENCES Orden(id_orden)
);