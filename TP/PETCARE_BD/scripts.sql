-- ============================================
-- Script de creación y carga de datos
-- Motor: SQL Server
-- ============================================

CREATE DATABASE PETCARE_DB;
GO

USE PETCARE_DB;
GO

CREATE TABLE VETERINARIA (
    id_veterinaria INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    ruc VARCHAR(20) NOT NULL UNIQUE,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE
);

CREATE TABLE SEDE (
    id_sede INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(120),
    id_veterinaria INT NOT NULL,
    CONSTRAINT FK_SEDE_VETERINARIA
        FOREIGN KEY (id_veterinaria) REFERENCES VETERINARIA(id_veterinaria)
);

CREATE TABLE DUENO (
    id_dueno INT IDENTITY(1,1) PRIMARY KEY,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(30) UNIQUE,
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    direccion VARCHAR(200)
);

CREATE TABLE MASCOTA (
    id_mascota INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raza VARCHAR(50),
    sexo VARCHAR(10),
    fecha_nacimiento DATE,
    peso DECIMAL(6,2),
    fecha_registro DATETIME,
    id_dueno INT NOT NULL,
    CONSTRAINT FK_MASCOTA_DUENO
        FOREIGN KEY (id_dueno) REFERENCES DUENO(id_dueno)
);

CREATE TABLE CONTACTO_EMERGENCIA (
    id_contacto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80),
    telefono VARCHAR(20),
    relacion VARCHAR(40),
    id_mascota INT NOT NULL,
    CONSTRAINT FK_CONTACTO_MASCOTA
        FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota)
);

CREATE TABLE AREA_CLINICA (
    id_area_clinica INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    descripcion VARCHAR(200),
    capacidad INT,
    id_sede INT NOT NULL,
    CONSTRAINT FK_AREA_SEDE
        FOREIGN KEY (id_sede) REFERENCES SEDE(id_sede)
);

CREATE TABLE SERVICIO (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    descripcion VARCHAR(200),
    costo DECIMAL(10,2) NOT NULL,
    id_sede INT NOT NULL,
    CONSTRAINT FK_SERVICIO_SEDE
        FOREIGN KEY (id_sede) REFERENCES SEDE(id_sede)
);

CREATE TABLE PERSONAL_NO_VETERINARIO (
    id_personal INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    fecha_registro DATETIME,
    id_sede INT NOT NULL,
    CONSTRAINT FK_PERSONAL_SEDE
        FOREIGN KEY (id_sede) REFERENCES SEDE(id_sede)
);

CREATE TABLE VETERINARIO (
    id_veterinario INT IDENTITY(1,1) PRIMARY KEY,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    colegiatura VARCHAR(20) UNIQUE,
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    estado VARCHAR(20),
    fecha_registro DATETIME,
    id_sede INT NOT NULL,
    CONSTRAINT FK_VETERINARIO_SEDE
        FOREIGN KEY (id_sede) REFERENCES SEDE(id_sede)
);

CREATE TABLE ESPECIALIDAD (
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion VARCHAR(200)
);

CREATE TABLE VETERINARIO_ESPECIALIDAD (
    id_veterinario INT NOT NULL,
    id_especialidad INT NOT NULL,
    fecha_certificacion DATETIME,
    CONSTRAINT PK_VET_ESPEC PRIMARY KEY (id_veterinario, id_especialidad),
    CONSTRAINT FK_VE_VETERINARIO FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario),
    CONSTRAINT FK_VE_ESPECIALIDAD FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD(id_especialidad)
);

CREATE TABLE CITA (
    id_cita INT IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    motivo VARCHAR(200),
    estado VARCHAR(30),
    id_mascota INT NOT NULL,
    id_personal INT,
    CONSTRAINT FK_CITA_MASCOTA FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    CONSTRAINT FK_CITA_PERSONAL FOREIGN KEY (id_personal) REFERENCES PERSONAL_NO_VETERINARIO(id_personal)
);
ALTER TABLE CITA
ADD id_veterinario INT NULL;
GO

ALTER TABLE CITA
ADD CONSTRAINT FK_CITA_VETERINARIO FOREIGN KEY (id_veterinario)
REFERENCES VETERINARIO(id_veterinario);
GO

CREATE TABLE CONSULTA (
    id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    observaciones VARCHAR(500),
    id_veterinario INT NOT NULL,
    id_mascota INT NOT NULL,
    CONSTRAINT FK_CONSULTA_VETERINARIO FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario),
    CONSTRAINT FK_CONSULTA_MASCOTA FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota)
);

CREATE TABLE DIAGNOSTICO (
    id_diagnostico INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(500) NOT NULL,
    fecha DATETIME,
    gravedad VARCHAR(30),
    id_consulta INT NOT NULL,
    CONSTRAINT FK_DIAG_CONSULTA FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta)
);

CREATE TABLE EXAMEN (
    id_examen INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(80) NOT NULL,
    resultado VARCHAR(200),
    fecha_hora DATETIME,
    id_consulta INT NOT NULL,
    CONSTRAINT FK_EXAMEN_CONSULTA FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta)
);

CREATE TABLE VACUNA (
    id_vacuna INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    frecuencia VARCHAR(60)
);

CREATE TABLE MASCOTA_VACUNA (
    id_mascota INT NOT NULL,
    id_vacuna INT NOT NULL,
    fecha_aplicacion DATETIME,
    proxima_dosis DATETIME,
    id_consulta INT NOT NULL,
    CONSTRAINT PK_MASCOTA_VACUNA PRIMARY KEY (id_mascota, id_vacuna),
    CONSTRAINT FK_MV_MASCOTA FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    CONSTRAINT FK_MV_VACUNA FOREIGN KEY (id_vacuna) REFERENCES VACUNA(id_vacuna),
    CONSTRAINT FK_MV_CONSULTA FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta)
);

CREATE TABLE HISTORIAL_CLINICO (
    id_historial INT IDENTITY(1,1) PRIMARY KEY,
    fecha_registro DATETIME NOT NULL,
    id_mascota INT NOT NULL,
    CONSTRAINT FK_HC_MASCOTA FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota)
);

CREATE TABLE HOSPITALIZACION (
    id_hospitalizacion INT IDENTITY(1,1) PRIMARY KEY,
    fecha_ingreso DATETIME NOT NULL,
    fecha_salida DATETIME,
    motivo VARCHAR(200),
    id_mascota INT NOT NULL,
    id_area_clinica INT NOT NULL,
    CONSTRAINT FK_HOSP_MASCOTA FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    CONSTRAINT FK_HOSP_AREA FOREIGN KEY (id_area_clinica) REFERENCES AREA_CLINICA(id_area_clinica)
);

CREATE TABLE CIRUGIA (
    id_cirugia INT IDENTITY(1,1) PRIMARY KEY,
    tipo VARCHAR(80) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado VARCHAR(30),
    id_area_clinica INT NOT NULL,
    id_mascota INT NOT NULL,
    id_veterinario INT NOT NULL,
    CONSTRAINT FK_CIR_AREA FOREIGN KEY (id_area_clinica) REFERENCES AREA_CLINICA(id_area_clinica),
    CONSTRAINT FK_CIR_MASCOTA FOREIGN KEY (id_mascota) REFERENCES MASCOTA(id_mascota),
    CONSTRAINT FK_CIR_VETERINARIO FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

CREATE TABLE MEDICAMENTO (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion VARCHAR(200),
    stock INT NOT NULL
);

CREATE TABLE MOVIMIENTO_INVENTARIO (
    id_movimiento INT IDENTITY(1,1) PRIMARY KEY,
    tipo_movimiento VARCHAR(30) NOT NULL,
    cantidad INT NOT NULL,
    fecha DATETIME NOT NULL,
    motivo VARCHAR(200),
    id_veterinario INT NOT NULL,
    id_medicamento INT NOT NULL,
    CONSTRAINT FK_MI_VETERINARIO FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario),
    CONSTRAINT FK_MI_MEDICAMENTO FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);

CREATE TABLE RECETA (
    id_receta INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATETIME NOT NULL,
    id_veterinario INT NOT NULL,
    CONSTRAINT FK_RECETA_VETERINARIO FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

CREATE TABLE RECETA_MEDICAMENTO (
    id_receta INT NOT NULL,
    id_medicamento INT NOT NULL,
    dosis VARCHAR(60),
    frecuencia VARCHAR(60),
    duracion VARCHAR(60),
    CONSTRAINT PK_RECETA_MED PRIMARY KEY (id_receta, id_medicamento),
    CONSTRAINT FK_RM_RECETA FOREIGN KEY (id_receta) REFERENCES RECETA(id_receta),
    CONSTRAINT FK_RM_MEDICAMENTO FOREIGN KEY (id_medicamento) REFERENCES MEDICAMENTO(id_medicamento)
);

-- =========================
-- DATOS DE PRUEBA
-- =========================

-- 1. VETERINARIA (Matriz)
INSERT INTO VETERINARIA (nombre, ruc, direccion, telefono, email) VALUES 
('PetCare Corporación S.A.C', '20601234567', 'Av. Javier Prado 1500, San Isidro', '014223344', 'corporativo@petcare.com');

-- 2. SEDE 
INSERT INTO SEDE (nombre, direccion, telefono, email, id_veterinaria) VALUES 
('PetCare Jesús María', 'Av. Salaverry 1400', '955111010', 'jesusmaria@petcare.com', 1),
('PetCare Rimac', 'Jr. Los Molinos 897', '955111002', 'rimac@petcare.com', 1),
('PetCare La Molina', 'Av. Raul Ferrero 1205', '955111005', 'lamolina@petcare.com', 1),
('PetCare Miraflores', 'Calle Schell 320', '955111008', 'miraflores@petcare.com', 1),
('PetCare Surco', 'Av. Caminos del Inca 450', '955111003', 'surco@petcare.com', 1),
('PetCare San Borja', 'Av. San Borja Sur 700', '955111011', 'sanborja@petcare.com', 1),
('PetCare Barranco', 'Av. San Martin 400', '955111020', 'barranco@petcare.com', 1),
('PetCare Los Olivos', 'Av. Carlos Izaguirre 150', '955111021', 'losolivos@petcare.com', 1),
('PetCare San Isidro', 'Av. Dos de Mayo 800', '955111022', 'sanisidro@petcare.com', 1),
('PetCare Ate', 'Av. Metropolitana 250', '955111023', 'ate@petcare.com', 1),
('PetCare Chorrillos', 'Av. Defensores del Morro 500', '955111024', 'chorrillos@petcare.com', 1);

-- 3. DUENO 
INSERT INTO DUENO (nombres, apellidos, tipo_documento, numero_documento, telefono, email, direccion) VALUES 
('Olenka', 'Espinoza Gomez', 'DNI', '75781234', '988100201', 'olenk@gmail.com', 'Av. Brasil 1971, Jesús María'),
('Luis', 'Calderon Ramírez', 'DNI', '10457896', '988100202', 'lcald@hotmail.com', 'Av. Guardia Republicana 984, Rimac'),
('Ricardo', 'Salas Torres', 'DNI', '42568912', '988100203', 'rsalas@gmail.com', 'Calle Los Jazmines 220, La Molina'),
('Andrea', 'Paredes Lozano', 'DNI', '51236789', '988100204', 'aparedes@yahoo.com', 'Calle Porta 180, Miraflores'),
('Fernando', 'Castro Rojas', 'DNI', '87654321', '988100205', 'ferojas@hotmail.com', 'Av. Primavera 1225, Surco'),
('Maria', 'Mendoza Flores', 'DNI', '99874561', '988100206', 'maflores@gmail.com', 'Jr. Fray Luis de Leon 476, San Borja'),
('Carlos', 'Mendoza Prado', 'DNI', '12345678', '988100207', 'cmendoza@gmail.com', 'Av. Las Palmeras 123, Villa El Salvador'),
('Lucia', 'Fernandez Rio', 'DNI', '23456789', '988100208', 'lfernandez@gmail.com', 'Jr. Ucayali 456, Lima'),
('Roberto', 'Gomez Siccha', 'DNI', '34567890', '988100209', 'rgomez@gmail.com', 'Calle Los Pinos 789, San Isidro'),
('Paola', 'Rios Medina', 'DNI', '45612378', '988100210', 'prios@gmail.com', 'Av. Angamos 450, Surquillo'),
('Jorge', 'Quispe Ramos', 'DNI', '56781234', '988100211', 'jquispe@gmail.com', 'Av. Canada 1000, La Victoria'),
('Diana', 'Salazar Cruz', 'DNI', '67891234', '988100212', 'dsalazar@gmail.com', 'Av. Brasil 900, Magdalena');

-- 4. MASCOTA 
INSERT INTO MASCOTA (nombre, especie, raza, sexo, fecha_nacimiento, peso, fecha_registro, id_dueno) VALUES 
('Michi', 'Gato', 'Persa', 'F', '2024-05-20', 4.2, '2025-07-13', 1),
('Fortin', 'Perro', 'Pastor Aleman', 'M', '2023-06-15', 25.5, '2025-02-10', 2),
('Toby', 'Perro', 'Poodle', 'M', '2022-08-05', 6.5, '2025-04-10', 2),
('Simba', 'Gato', 'Siames', 'M', '2024-08-05', 3.8, '2025-03-20', 4),
('Rocky', 'Perro', 'Bulldog Frances', 'M', '2023-09-12', 12.5, '2025-11-10', 5),
('Nala', 'Perro', 'Golden Retriever', 'F', '2022-03-18', 30.2, '2024-05-20', 6),
('Rex', 'Perro', 'Pastor Aleman', 'M', '2021-05-10', 28.0, '2025-01-15', 7),
('Luna', 'Gato', 'Angora', 'F', '2022-11-20', 3.5, '2025-01-20', 1),
('Coco', 'Perro', 'Beagle', 'M', '2023-03-12', 15.2, '2025-02-01', 9),
('Max', 'Perro', 'Labrador', 'M', '2021-07-01', 27.0, '2025-03-01', 10),
('Kiara', 'Gato', 'Maine Coon', 'F', '2023-01-10', 5.1, '2025-04-01', 11),
('Bruno', 'Perro', 'Boxer', 'M', '2020-09-09', 29.0, '2025-05-01', 12),
('Loki','Perro','Husky','M','2022-02-02',22.4,'2025-06-01',1),
('Mila','Gato','Siames','F','2023-03-03',3.9,'2025-06-02',1),
('Thor','Perro','Doberman','M','2021-01-15',32.0,'2025-06-03',3),
('Kira','Perro','Husky','F','2022-05-10',18.5,'2025-06-04',6),
('Zeus','Perro','Rottweiler','M','2020-09-09',40.0,'2025-06-05',4),
('Cleo','Gato','Bengala','F','2023-04-18',4.5,'2025-06-06',5),
('Bobby','Perro','Cocker','M','2022-12-12',14.0,'2025-06-07',6),
('Mora','Gato','Criollo','F','2024-01-01',3.2,'2025-06-08',7),
('Kori','Perro','Jack Russell','M','2022-10-06',9.5,'2025-06-09',8),
('Nina','Perro','Shih Tzu','F','2023-07-07',7.2,'2025-06-10',9),
('Rocco','Perro','Boxer','M','2022-10-10',26.0,'2025-06-11',10),
('Luna II','Gato','Angora','F','2023-08-08',3.7,'2025-06-12',11);

-- 5. CONTACTO_EMERGENCIA
INSERT INTO CONTACTO_EMERGENCIA (nombre, apellidos, telefono, relacion, id_mascota) VALUES 
('Nataly', 'Aguilar Gomez', '911222331', 'Prima', 1),
('Diana', 'Calderon Quispe', '911222332', 'Hija', 2),
('Felipe', 'Salas Mendoza', '911222333', 'Hermano', 3),
('Rosa', 'Paredes Linares', '911222334', 'Madre', 4),
('Carlos', 'Castro Vega', '911222335', 'Padre', 5),
('Luciana', 'Gutierrez Flores', '911222336', 'Hermana', 6),
('Alberto', 'Mendoza Garcia', '999888777', 'Padre', 7),
('Elena', 'Rio Martinez', '999888778', 'Madre', 8),
('Pedro', 'Gomez Peralta', '999888779', 'Hermano', 9),
('Andrea', 'Rios Torres', '911333440', 'Tía', 10),
('Luis', 'Quispe Salas', '911333441', 'Primo', 11),
('Marcos', 'Salazar Diaz', '911333442', 'Padre', 12);

-- 6. AREA_CLINICA
INSERT INTO AREA_CLINICA (nombre, descripcion, capacidad, id_sede) VALUES 
('Rayos X', 'Sala de diagnóstico por imágenes', 1, 1),
('Laboratorio', 'Análisis de sangre y muestras', 3, 1),
('Consultorio 1', 'Atención general', 2, 3),
('Quirófano', 'Cirugías menores y mayores', 1, 4),
('Hospitalización', 'Internamiento de mascotas', 6, 5),
('Ecografía', 'Diagnóstico por ultrasonido', 1, 6),
('UCI', 'Unidad de cuidados intensivos', 2, 7),
('Rehabilitacion', 'Area de terapias fisicas', 4, 8),
('Triaje', 'Evaluacion rapida inicial', 3, 9),
('Consultorio 2', 'Atención general avanzada', 2, 10),
('Sala Postoperatoria', 'Recuperación post cirugía', 4, 11);

-- 7. SERVICIO 
INSERT INTO SERVICIO (nombre, descripcion, costo, id_sede) VALUES 
('Consulta General', 'Revisión básica', 30.00, 2),
('Vacunación', 'Aplicación de vacunas anuales', 80.00, 1),
('Perfil Bioquímico', 'Análisis de sangre completo', 120.00, 3),
('Ecografía', 'Diagnóstico por ultrasonido', 150.00, 6),
('Cirugía', 'Procedimientos quirúrgicos', 400.00, 4),
('Hospitalización', 'Internamiento diario', 180.00, 5),
('Limpieza Ocular', 'Lavado especializado de ojos', 45.00, 7),
('Corte de uñas', 'Servicio estetico basico', 20.00, 8),
('Consulta Especialista', 'Atencion por cardiologo/oncologo', 120.00, 9),
('Desparasitación', 'Control antiparasitario', 50.00, 10),
('Control Nutricional', 'Plan alimenticio personalizado', 90.00, 11);

-- 8. PERSONAL_NO_VETERINARIO
INSERT INTO PERSONAL_NO_VETERINARIO (nombre, apellidos, rol, telefono, email, fecha_registro, id_sede) VALUES 
('María', 'García Pérez', 'Recepcionista', '922000101', 'mgarcia@petcare.com', '2025-01-28', 1),
('Pedro', 'Ramírez López', 'Administrador', '922000102', 'pramirez@petcare.com', '2025-01-17', 2),
('César', 'Ramos Acosta', 'Recepcionista', '922000103', 'rgil@petcare.com', '2025-03-01', 3),
('Jorge', 'Mendoza Ríos', 'Cajero', '922000105', 'jmrios@petcare.com', '2025-03-15', 4),
('Carmen', 'Vega Castillo', 'Esteticista', '922000106', 'ccvega@petcare.com', '2025-01-05', 5),
('Diego', 'Salas Paredes', 'Recepcionista', '922000107', 'dsalas@petcare.com', '2025-10-20', 6),
('Raul', 'Zevallos Arbeloa', 'Seguridad', '922000108', 'rzevallos@petcare.com', '2025-02-01', 7),
('Marta', 'Soto Diaz', 'Limpieza', '922000109', 'msoto@petcare.com', '2025-02-05', 8),
('Sofia', 'Vaca Perez', 'Contadora', '922000110', 'svaca@petcare.com', '2025-02-10', 9),
('Luis', 'Torres Vega', 'Recepcionista', '922000111', 'ltorres@petcare.com', '2025-03-10', 10),
('Ana', 'Flores Ruiz', 'Cajera', '922000112', 'aflores@petcare.com', '2025-03-12', 11),
('Ana', 'Lopez Diaz', 'Esteticista', '922000120', 'alopez@petcare.com', '2026-02-10', 1),
('Luis', 'Torres Salazar', 'Esteticista', '922000121', 'ltorres2@petcare.com', '2026-02-10', 2),
('Sofia', 'Morales Vega', 'Esteticista', '922000122', 'smorales@petcare.com', '2026-02-10', 3),
('Diego', 'Sanchez Rojas', 'Esteticista', '922000123', 'dsanchez@petcare.com', '2026-02-10', 4),
('Patricia', 'Lozano Ruiz', 'Esteticista', '922000124', 'plozano2@petcare.com', '2026-02-10', 6),
('Brenda', 'Ponce Ramos', 'Esteticista', '922000125', 'bponce2@petcare.com', '2026-02-10', 7),
('Camila', 'Suarez Diaz', 'Esteticista', '922000126', 'csuarez2@petcare.com', '2026-02-10', 8),
('Oscar', 'Flores Vega', 'Esteticista', '922000127', 'oflores2@petcare.com', '2026-02-10', 9),
('Ivan', 'Gutierrez Silva', 'Esteticista', '922000128', 'igutierrez2@petcare.com', '2026-02-10', 10),
('Natalia', 'Vega Torres', 'Esteticista', '922000129', 'nvega2@petcare.com', '2026-02-10', 11);


-- 9. VETERINARIO
INSERT INTO VETERINARIO (nombres, apellidos, colegiatura, telefono, email, estado, fecha_registro, id_sede) VALUES 
('Rosa', 'Mendoza Castillo', 'CMVP1001', '933000201', 'rmendoza@petcare.com', 'Activo', '2025-01-27', 1),
('Silvia', 'Vargas Díaz', 'CMVP1002', '933000202', 'svargas@petcare.com', 'Activo', '2025-01-16', 2),
('Daniel', 'Sánchez Castro', 'CMVP1003', '933000203', 'dsosa@petcare.com', 'Activo', '2025-03-05', 3),
('Fernanda', 'Lopez Morales', 'CMVP1004', '933000204', 'flopez@petcare.com', 'Activo', '2025-01-20', 4),
('Javier', 'Torres Pineda', 'CMVP1005', '933000205', 'jtorres@petcare.com', 'Activo', '2025-03-12', 5),
('Karla', 'Rojas Sánchez', 'CMVP1006', '933000206', 'krojas@petcare.com', 'Activo', '2025-02-25', 6),
('Alberto', 'Ruiz Huaman', 'CMVP2001', '933000207', 'aruiz@petcare.com', 'Activo', '2025-02-01', 7),
('Elena', 'Sanz Lopez', 'CMVP2002', '933000208', 'esanz@petcare.com', 'Activo', '2025-02-05', 8),
('Pedro', 'Vaca Vazquez', 'CMVP2003', '933000209', 'pvaca@petcare.com', 'Activo', '2025-02-10', 9),
('Andrea', 'Salazar Ruiz', 'CMVP2004', '933000210', 'asalazar@petcare.com', 'Activo', '2025-03-01', 10),
('Luis', 'Quispe Romero', 'CMVP2005', '933000211', 'lquispe@petcare.com', 'Activo', '2025-03-02', 11),
('Marcos','Diaz Lopez','CMVP3001','933000212','mdiaz@petcare.com','Activo','2025-03-10',1),
('Claudia','Ramos Perez','CMVP3002','933000213','cramos@petcare.com','Activo','2025-03-11',2),
('Ivan','Gutierrez Silva','CMVP3003','933000214','igutierrez@petcare.com','Activo','2025-03-12',3),
('Natalia','Vega Torres','CMVP3004','933000215','nvega@petcare.com','Activo','2025-03-13',4),
('Raul','Morales Castro','CMVP3005','933000216','rmorales@petcare.com','Activo','2025-03-14',5),
('Patricia','Lozano Ruiz','CMVP3006','933000217','plozano@petcare.com','Activo','2025-03-15',6),
('Diego','Herrera Soto','CMVP3007','933000218','dherrera@petcare.com','Activo','2025-03-16',7),
('Camila','Suarez Diaz','CMVP3008','933000219','csuarez@petcare.com','Activo','2025-03-17',8),
('Brenda','Ponce Ramos','CMVP3009','933000220','bponce@petcare.com','Activo','2025-03-18',9),
('Oscar','Flores Vega','CMVP3010','933000221','oflores@petcare.com','Activo','2025-03-19',10),
('Luciano','Mendoza Gil','CMVP3011','933000222','lmendoza@petcare.com','Activo','2025-03-20',11);

-- 10. ESPECIALIDAD
INSERT INTO ESPECIALIDAD (nombre, descripcion) VALUES 
('Cardiología', 'Enfermedades del corazón'),
('Dermatología', 'Problemas de piel y alergias'),
('Fisiatría', 'Rehabilitación física y terapias de movilidad'),
('Oftalmología', 'Afecciones oculares y cirugía de ojos'),
('Odontología', 'Salud dental y limpiezas especializadas'),
('Neurología', 'Trastornos del sistema nervioso'),
('Oncología', 'Tratamiento de tumores'),
('Nutrición', 'Dietas especializadas'),
('Etologia', 'Comportamiento animal'),
('Cirugía General', 'Procedimientos quirúrgicos básicos y avanzados');

-- 11. VETERINARIO_ESPECIALIDAD
INSERT INTO VETERINARIO_ESPECIALIDAD (id_veterinario, id_especialidad, fecha_certificacion) VALUES 
(1,2,'2021-06-01'),
(2,1,'2022-08-15'),
(3,3,'2023-11-20'),
(4,4,'2020-09-10'),
(5,6,'2022-12-05'),
(6,5,'2021-04-22'),
(7,7,'2020-05-15'),
(8,8,'2021-11-20'),
(9,9,'2022-01-10'),
(10,10,'2021-03-12'),
(11,10,'2022-07-18'),
(12,3,'2020-05-09'),
(13,1,'2021-04-10'),
(14,2,'2022-02-14'),
(15,3,'2023-01-25'),
(16,4,'2020-11-11'),
(17,5,'2021-09-09'),
(18,6,'2022-10-10'),
(19,7,'2021-08-08'),
(20,8,'2023-03-03'),
(21,9,'2022-12-12'),
(22,10,'2021-05-05');

-- 12. CITA
-- Citas con Esteticistas
INSERT INTO CITA (fecha_hora, motivo, estado, id_mascota, id_personal) VALUES
('2025-11-05 09:00', 'Baño medicado', 'Completada', 8, 16),
('2025-11-07 11:00', 'Corte de raza', 'Completada', 22, 19),
('2025-12-17 09:00', 'Limpieza de oídos', 'Completada', 5, 5),
('2025-12-22 11:00', 'Desmotado', 'Programada', 3, 13),
('2026-02-18 09:00', 'Baño hipoalergénico', 'Programada', 21, 13),
('2026-02-19 09:00', 'Desparasitación', 'Programada', 12, 5),
('2026-02-21 10:00', 'Stripping', 'Programada', 21, 13),
('2026-02-21 11:00', 'Baño premium', 'Programada', 3, 13),
('2026-02-28 12:00', 'Deslanado', 'Programada', 6, 16),
('2026-03-03 09:00', 'Baño estándar', 'Programada', 13, 18),
('2026-02-20 10:00', 'Corte de uñas', 'Programada', 14, 19),
('2026-02-20 11:00', 'Corte de uñas', 'Programada', 15, 14),
('2026-02-20 12:00', 'Deslanado', 'Programada', 16, 16);
-- Citas con Veterinarios
INSERT INTO CITA (fecha_hora, motivo, estado, id_mascota, id_veterinario) VALUES
('2025-08-15 09:00', 'Control de alergia', 'Completada', 1, 1),
('2025-03-10 10:30', 'Chequeo cardiaco', 'Completada', 2, 2),
('2025-05-12 11:00', 'Terapia de rehabilitación', 'Completada', 3, 3),
('2025-09-05 08:30', 'Vacunación anual', 'Completada', 4, 4),
('2025-04-18 12:15', 'Limpieza dental', 'Completada', 5, 6),
('2025-06-22 15:45', 'Cirugía rodilla', 'Completada', 6, 10),
('2025-11-01 09:00', 'Evaluacion oncologica', 'Completada', 7, 7),
('2025-11-02 10:00', 'Cambio de dieta', 'Completada', 8, 9),
('2025-11-03 11:00', 'Agresividad', 'Completada', 9, 10),
('2025-11-05 09:00', 'Control general', 'Completada', 10, 11),
('2025-12-01 09:00', 'Vacunación anual', 'Completada', 11, 12),
('2025-12-05 10:30', 'Chequeo nutricional', 'Completada', 12, 13),
('2025-12-10 11:00', 'Control de peso', 'Completada', 13, 14),
('2025-12-15 08:30', 'Limpieza dental', 'Completada', 14, 15),
('2025-12-20 12:15', 'Evaluación dermatológica', 'Completada', 15, 16),
('2025-12-25 15:45', 'Chequeo cardiaco', 'Completada', 16, 17),
('2026-01-05 09:00', 'Vacunación felina', 'Completada', 17, 18),
('2026-01-10 10:00', 'Control de etología', 'Completada', 18, 19),
('2026-01-15 11:00', 'Revisión general', 'Completada', 19, 20),
('2026-01-20 09:00', 'Desparasitación', 'Completada', 20, 21),
('2026-01-25 10:30', 'Chequeo general', 'Completada', 21, 22),
('2026-02-01 11:00', 'Vacuna refuerzo', 'Completada', 22, 1),
('2026-02-05 08:30', 'Control de peso', 'Completada', 1, 2),
('2026-02-10 12:15', 'Chequeo nutricional', 'Completada', 2, 3),
('2026-02-12 15:45', 'Vacunación anual', 'Completada', 3, 4),
('2026-02-14 09:00', 'Revisión general', 'Completada', 4, 5),
('2026-02-15 10:30', 'Control dermatológico', 'Completada', 5, 6),
('2026-02-18 09:00', 'Chequeo general', 'Programada', 1, 1),
('2026-02-19 10:00', 'Vacuna anual', 'Programada', 2, 2),
('2026-02-20 11:00', 'Control de etología', 'Programada', 3, 3),
('2026-02-21 12:00', 'Limpieza dental', 'Programada', 4, 4),
('2026-02-22 09:00', 'Evaluación cardiaca', 'Programada', 5, 5),
('2026-02-23 10:00', 'Revisión general', 'Programada', 6, 6),
('2026-02-24 11:00', 'Desparasitación', 'Programada', 7, 7),
('2026-02-25 12:00', 'Vacuna refuerzo', 'Programada', 8, 8),
('2026-02-26 09:00', 'Chequeo nutricional', 'Programada', 9, 9),
('2026-02-27 10:00', 'Evaluación neurológica', 'Programada', 10, 10);

-- 13. CONSULTA
INSERT INTO CONSULTA (fecha_hora, observaciones, id_veterinario, id_mascota) VALUES
('2025-08-15 09:15', 'Presenta prurito en orejas, se aplica tratamiento tópico', 1, 1),
('2025-03-10 10:45', 'Ritmo cardiaco estable, seguimiento recomendado', 2, 2),
('2025-05-12 11:30', 'Debilidad en tren posterior, fisioterapia indicada', 3, 3),
('2025-09-05 08:50', 'Vacuna aplicada correctamente, buen estado general', 4, 4),
('2025-04-18 12:30', 'Sarro moderado detectado, limpieza dental realizada', 6, 5),
('2025-06-22 16:00', 'Evaluación prequirúrgica completada', 10, 6),
('2025-11-01 09:15', 'Masa palpable en abdomen, estudios adicionales recomendados', 7, 7),
('2025-11-02 10:15', 'Sobrepeso leve, dieta indicada', 9, 8),
('2025-11-03 11:15', 'Ansiedad por separación confirmada', 10, 9),
('2025-11-05 09:30', 'Control general sin novedades', 11, 10),
('2025-12-01 09:15', 'Vacuna aplicada correctamente, sin reacción', 12, 11),
('2025-12-05 10:45', 'Chequeo nutricional, dieta balanceada', 13, 12),
('2025-12-10 11:15', 'Control de peso adecuado', 14, 13),
('2025-12-15 08:50', 'Limpieza dental realizada, sin sarro significativo', 15, 14),
('2025-12-20 12:30', 'Dermatitis leve, tratamiento tópico indicado', 16, 15),
('2025-12-25 15:50', 'Chequeo cardiaco estable', 17, 16),
('2026-01-05 09:15', 'Vacuna felina aplicada, sin reacción', 18, 17),
('2026-01-10 10:15', 'Etología revisada, comportamiento estable', 19, 18),
('2026-01-15 11:15', 'Revisión general, signos vitales normales', 20, 19),
('2026-01-20 09:10', 'Desparasitación completada', 21, 20),
('2026-01-25 10:45', 'Chequeo general sin novedades', 22, 21),
('2026-02-01 11:15', 'Vacuna refuerzo aplicada correctamente', 1, 22),
('2026-02-05 08:50', 'Control de peso y nutrición', 2, 1),
('2026-02-10 12:30', 'Chequeo nutricional, dieta balanceada', 3, 2),
('2026-02-12 15:50', 'Vacunación anual aplicada correctamente', 4, 3),
('2026-02-14 09:15', 'Revisión general, signos vitales normales', 5, 4),
('2026-02-15 10:45', 'Control dermatológico, tratamiento aplicado', 6, 5);

-- 14. DIAGNOSTICO
INSERT INTO DIAGNOSTICO (descripcion, fecha, gravedad, id_consulta) VALUES
('Dermatitis alérgica', '2025-08-15', 'Baja', 1),
('Sano con observación', '2025-03-10', 'Baja', 2),
('Displasia de cadera leve', '2025-05-12', 'Media', 3),
('Sano, vacunas al día', '2025-09-05', 'Baja', 4),
('Sarro dental moderado', '2025-04-18', 'Baja', 5),
('Rotura de ligamento cruzado', '2025-06-22', 'Alta', 6),
('Posible lipoma', '2025-11-01', 'Media', 7),
('Obesidad grado I', '2025-11-02', 'Baja', 8),
('Trastorno de ansiedad', '2025-11-03', 'Baja', 9),
('Paciente sano', '2025-11-05', 'Baja', 10),
('Vacunación preventiva', '2025-12-01', 'Baja', 11),
('Sobrepeso leve', '2025-12-05', 'Media', 12),
('Control de peso adecuado', '2025-12-10', 'Baja', 13),
('Sarro dental leve', '2025-12-15', 'Baja', 14),
('Dermatitis leve', '2025-12-20', 'Baja', 15),
('Chequeo cardiaco estable', '2025-12-25', 'Baja', 16),
('Vacuna felina aplicada', '2026-01-05', 'Baja', 17),
('Etología estable', '2026-01-10', 'Baja', 18),
('Revisión general', '2026-01-15', 'Baja', 19),
('Desparasitación completa', '2026-01-20', 'Baja', 20),
('Chequeo general', '2026-01-25', 'Baja', 21),
('Vacuna refuerzo aplicada', '2026-02-01', 'Baja', 22),
('Control de peso', '2026-02-05', 'Baja', 23),
('Chequeo nutricional', '2026-02-10', 'Baja', 24),
('Vacunación anual', '2026-02-12', 'Baja', 25),
('Revisión general', '2026-02-14', 'Baja', 26),
('Control dermatológico', '2026-02-15', 'Baja', 27);

-- 15. EXAMEN
INSERT INTO EXAMEN (tipo, resultado, fecha_hora, id_consulta) VALUES
('Raspado cutáneo', 'Negativo a ácaros', '2025-08-15 10:00', 1),
('Ecografía cardiaca', 'Sin anomalías', '2025-03-10 11:30', 2),
('Evaluación Postural', 'Dificultad leve al levantarse', '2025-05-12 12:00', 3),
('Hemograma completo', 'Valores normales', '2025-09-05 09:30', 4),
('Radiografía dental', 'Sarro moderado', '2025-04-18 13:00', 5),
('Radiografía rodilla', 'Ligamento cruzado roto confirmado', '2025-06-22 16:30', 6),
('Test de comportamiento', 'Ansiedad confirmada', '2025-11-03 14:00', 9),
('Perfil lipídico', 'Valores normales', '2025-12-05 11:00', 12);

-- 16. VACUNA
INSERT INTO VACUNA (nombre, descripcion, frecuencia) VALUES 
('Triple Felina', 'Rinotraqueítis, Calicivirus', 'Anual'),
('Antirrábica', 'Prevención de rabia', 'Anual'),
('KC', 'Tos de las perreras', 'Semestral'),
('Quíntuple Canina', 'Moquillo, Hepatitis, Parvovirus, Parainfluenza y Leptospira', 'Anual'),
('Giardia', 'Prevención de Giardiasis', 'Semestral'),
('Leucemia Felina', 'Refuerzo FeLV', 'Anual'), 
('Distemper', 'Prevencion Moquillo', 'Anual'), 
('Bordetella', 'Tos de las perreras', 'Semestral'),
('Parvovirus', 'Prevención Parvovirosis', 'Anual'),
('Influenza Canina', 'Prevención Influenza', 'Anual'),
('Calicivirus Felino', 'Refuerzo respiratorio', 'Anual'),
('Leptospira', 'Prevención Leptospirosis', 'Semestral'),
('Panleucopenia', 'Prevención viral felina', 'Anual');

-- 17. MASCOTA_VACUNA
INSERT INTO MASCOTA_VACUNA (id_mascota, id_vacuna, fecha_aplicacion, proxima_dosis, id_consulta) VALUES
(1, 1, '2025-08-15', '2026-08-15', 1),
(2, 4, '2025-03-10', '2026-03-10', 2),
(4, 1, '2025-09-05', '2026-09-05', 4),
(11, 1, '2025-12-01', '2026-12-01', 12),
(17, 4, '2026-01-05', '2027-01-05', 17),
(22, 4, '2026-02-01', '2027-02-01', 22),
(3, 3, '2026-02-12', '2026-08-12', 24);

-- 18. HISTORIAL_CLINICO
INSERT INTO HISTORIAL_CLINICO (fecha_registro, id_mascota) VALUES 
('2025-07-13', 1),
('2025-02-10', 2),
('2025-04-10', 3),
('2025-03-20', 4),
('2025-11-10', 5),
('2024-05-20', 6),
('2025-01-15', 7), 
('2025-01-20', 8), 
('2025-02-01', 9),
('2025-03-01', 10),
('2025-04-01', 11),
('2025-05-01', 12),
('2025-06-01', 13),
('2025-06-02', 14),
('2025-06-03', 15),
('2025-06-04', 16),
('2025-06-05', 17),
('2025-06-06', 18),
('2025-06-07', 19),
('2025-06-08', 20),
('2025-06-09', 21),
('2025-06-10', 22),
('2025-06-11', 23),
('2025-06-12', 24);

-- 19. HOSPITALIZACION
INSERT INTO HOSPITALIZACION (fecha_ingreso, motivo, id_mascota, id_area_clinica) VALUES 
('2025-03-15', 'Reposo preventivo', 2, 2),
('2025-05-12', 'Monitoreo post-terapia', 3, 3),
('2025-09-10', 'Control post-vacunación', 4, 5),
('2025-04-18', 'Recuperación post-limpieza dental', 5, 5),
('2025-06-25', 'Post-operatorio cirugía de rodilla', 6, 5),
('2025-11-01', 'Observacion biopsia', 7, 7),
('2025-11-10', 'Deshidratacion', 8, 8),
('2025-11-15', 'Post-operatorio', 9, 5),
('2025-07-16', 'Monitoreo cardiaco preventivo', 21, 2);

-- 20. CIRUGIA
INSERT INTO CIRUGIA (tipo, fecha_hora, estado, id_area_clinica, id_mascota, id_veterinario) VALUES 
('Biopsia cutánea', '2025-04-02 09:30', 'Pendiente', 2, 2, 2),
('Terapia Láser', '2025-05-12 12:30', 'Realizada', 3, 3, 3),
('Limpieza dental profunda', '2025-04-20 08:00', 'Programada', 4, 5, 5),
('Cirugía de ligamento cruzado', '2025-06-23 10:00', 'Programada', 4, 6, 6),
('Cirugía de displasia de cadera', '2025-05-13 09:00', 'Pendiente', 4, 3, 3),
('Castracion', '2025-11-05 08:00', 'Programada', 4, 7, 7),
('Esterilizacion', '2025-11-12 09:00', 'Pendiente', 4, 8, 8),
('Extraccion de Tumor', '2025-11-20 10:00', 'Programada', 4, 9, 9),
('Correccion cardiaca leve', '2025-07-20 09:00', 'Pendiente', 2, 21, 6);

-- 21. MEDICAMENTO
INSERT INTO MEDICAMENTO (nombre, descripcion, stock) VALUES 
('Corticoides', 'Antiinflamatorio', 200),
('Apoquel', 'Antialergico', 50),
('Glucosamina', 'Suplemento para articulaciones', 120),
('Meloxicam', 'Analgesico y antiinflamatorio', 150),
('Omeprazol', 'Protector gastrico', 180),
('Tramadol', 'Analgesico opioide', 90),
('Prednisona', 'Inmunosupresor', 300),
('Hill s Metabolic', 'Alimento medicado', 40),
('Fluoxetina', 'Ansiolitico', 60),
('Amoxicilina', 'Antibiotico de amplio espectro', 250);

-- 22. MOVIMIENTO_INVENTARIO
INSERT INTO MOVIMIENTO_INVENTARIO (tipo_movimiento, cantidad, fecha, motivo, id_veterinario, id_medicamento) VALUES 
('Entrada', 100, '2025-01-01', 'Abastecimiento inicial', 1, 1),
('Salida', 5, '2025-08-15', 'Uso en consulta Michi', 1, 2),
('Salida', 10, '2025-05-12', 'Tratamiento Toby', 3, 3),
('Salida', 10, '2025-05-12', 'Uso en consulta Nala (displasia)', 3, 3),
('Entrada', 50, '2025-02-10', 'Reabastecimiento', 2, 4),
('Salida', 8, '2025-04-18', 'Uso en consulta Rocky (limpieza dental)', 5, 5),
('Entrada', 500, '2025-10-01', 'Compra mayorista', 7, 7),
('Salida', 1, '2025-11-02', 'Venta bolsa 2kg', 8, 8),
('Salida', 30, '2025-11-03', 'Tratamiento Rex', 7, 7),
('Salida', 15, '2025-07-15', 'Tratamiento cardiaco preventivo', 6, 10);

-- 23. RECETA
INSERT INTO RECETA (fecha, id_veterinario) VALUES 
('2025-08-15', 1),
('2025-03-10', 2),
('2025-05-12', 3),
('2025-09-05', 4),
('2025-04-18', 5),
('2025-06-22', 6),
('2025-11-01', 7),
('2025-11-02', 8),
('2025-11-03', 9),
('2025-07-15', 6);

-- 24. RECETA_MEDICAMENTO
INSERT INTO RECETA_MEDICAMENTO (id_receta, id_medicamento, dosis, frecuencia, duracion) VALUES 
(1, 1, '1/2 tableta', 'Cada 24h', '5 dias'),
(2, 2, '1 tableta', 'Cada 12h', '10 dias'),
(3, 3, '1 tableta', 'Cada 24h', '30 dias'),
(4, 5, '1 ml', 'Cada 24 horas', '7 dias'),
(5, 6, '1/2 tableta', 'Cada 12 horas', '5 dias'),
(6, 4, '1 tableta', 'Cada 8 horas', '15 dias'),
(7, 7, '5 mg', 'Cada 12h', '7 dias'),
(8, 8, '100 g', 'Cada 8h', 'Indefinido'),
(9, 9, '10 mg', 'Cada 24h', '30 dias'),
(10, 10, '250 mg', 'Cada 12h', '10 dias');
GO
