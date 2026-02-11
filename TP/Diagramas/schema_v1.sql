

CREATE TABLE VETERINARIA (
    id_veterinaria INT PRIMARY KEY,
    nombre         VARCHAR(120) NOT NULL,
    ruc            VARCHAR(20)  NOT NULL UNIQUE,
    direccion      VARCHAR(200),
    telefono       VARCHAR(20),
    email          VARCHAR(120) UNIQUE
);

CREATE TABLE SEDE (
    id_sede        INT PRIMARY KEY,
    nombre         VARCHAR(120) NOT NULL,
    direccion      VARCHAR(200),
    telefono       VARCHAR(20),
    email          VARCHAR(120),
    id_veterinaria INT NOT NULL
);

CREATE TABLE DUENO (
    id_dueno         INT PRIMARY KEY,
    nombres          VARCHAR(100) NOT NULL,
    apellidos        VARCHAR(100) NOT NULL,
    tipo_documento   VARCHAR(10)  NOT NULL,
    numero_documento VARCHAR(20)  NOT NULL UNIQUE,
    telefono         VARCHAR(20),
    email            VARCHAR(120) UNIQUE,
    direccion        VARCHAR(200),
    fecha_registro   DATE
);

CREATE TABLE MASCOTA (
    id_mascota       INT PRIMARY KEY,
    nombre           VARCHAR(80)  NOT NULL,
    especie          VARCHAR(50)  NOT NULL,
    raza             VARCHAR(80),
    sexo             CHAR(1),
    color            VARCHAR(60),
    fecha_nacimiento DATE,
    peso             DECIMAL(5,2),
    id_dueno         INT NOT NULL
);

CREATE TABLE CONTACTO_EMERGENCIA (
    id_contacto INT PRIMARY KEY,
    nombre      VARCHAR(120) NOT NULL,
    telefono    VARCHAR(20)  NOT NULL,
    parentesco  VARCHAR(60),
    id_dueno    INT NOT NULL
);

CREATE TABLE AREA_CLINICA (
    id_area     INT PRIMARY KEY,
    nombre      VARCHAR(120) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE SERVICIO (
    id_servicio INT PRIMARY KEY,
    nombre      VARCHAR(120)  NOT NULL,
    descripcion VARCHAR(200),
    costo       DECIMAL(10,2) NOT NULL,
    id_area     INT NOT NULL
);

CREATE TABLE PERSONAL_NO_VETERINARIO (
    id_personal INT PRIMARY KEY,
    nombres     VARCHAR(100) NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    cargo       VARCHAR(60)  NOT NULL,
    telefono    VARCHAR(20),
    email       VARCHAR(120) UNIQUE,
    id_sede     INT NOT NULL
);

CREATE TABLE VETERINARIO (
    id_veterinario INT PRIMARY KEY,
    nombres        VARCHAR(100) NOT NULL,
    apellidos      VARCHAR(100) NOT NULL,
    colegiatura    VARCHAR(30)  NOT NULL UNIQUE,
    telefono       VARCHAR(20),
    email          VARCHAR(120) UNIQUE,
    id_sede        INT NOT NULL
);

CREATE TABLE ESPECIALIDAD (
    id_especialidad INT PRIMARY KEY,
    nombre          VARCHAR(120) NOT NULL UNIQUE,
    descripcion     VARCHAR(200)
);

CREATE TABLE VETERINARIO_ESPECIALIDAD (
    id_veterinario   INT NOT NULL,
    id_especialidad  INT NOT NULL,
    PRIMARY KEY (id_veterinario, id_especialidad)
);

CREATE TABLE CITA (
    id_cita       INT PRIMARY KEY,
    fecha         DATETIME NOT NULL,
    motivo        VARCHAR(200),
    estado        VARCHAR(20),
    id_mascota    INT NOT NULL,
    id_veterinario INT NOT NULL
);

CREATE TABLE CONSULTA (
    id_consulta   INT PRIMARY KEY,
    fecha         DATETIME,
    observaciones VARCHAR(400),
    id_cita       INT NOT NULL UNIQUE,
    id_servicio   INT NOT NULL
);

CREATE TABLE DIAGNOSTICO (
    id_diagnostico INT PRIMARY KEY,
    descripcion    VARCHAR(300) NOT NULL,
    tratamiento    VARCHAR(300),
    id_consulta    INT NOT NULL
);

CREATE TABLE EXAMEN (
    id_examen   INT PRIMARY KEY,
    tipo        VARCHAR(120) NOT NULL,
    resultado   VARCHAR(300),
    fecha       DATETIME,
    id_consulta INT NOT NULL
);

CREATE TABLE VACUNA (
    id_vacuna    INT PRIMARY KEY,
    nombre       VARCHAR(120) NOT NULL,
    fabricante   VARCHAR(120),
    descripcion  VARCHAR(200)
);

CREATE TABLE MASCOTA_VACUNA (
    id_mascota      INT  NOT NULL,
    id_vacuna       INT  NOT NULL,
    fecha_aplicacion DATE NOT NULL,
    proxima_dosis    DATE,
    PRIMARY KEY (id_mascota, id_vacuna, fecha_aplicacion)
);

CREATE TABLE HISTORIAL_CLINICO (
    id_historial INT PRIMARY KEY,
    fecha        DATETIME NOT NULL,
    descripcion  VARCHAR(400),
    id_mascota   INT NOT NULL,
    id_consulta  INT
);

CREATE TABLE HOSPITALIZACION (
    id_hospitalizacion INT PRIMARY KEY,
    fecha_ingreso      DATETIME NOT NULL,
    fecha_alta         DATETIME,
    motivo             VARCHAR(200),
    estado             VARCHAR(20),
    id_mascota         INT NOT NULL,
    id_sede            INT NOT NULL
);

CREATE TABLE CIRUGIA (
    id_cirugia    INT PRIMARY KEY,
    tipo          VARCHAR(120)  NOT NULL,
    descripcion   VARCHAR(300),
    fecha         DATETIME NOT NULL,
    costo         DECIMAL(10,2) NOT NULL,
    id_mascota    INT NOT NULL,
    id_veterinario INT NOT NULL
);

CREATE TABLE MEDICAMENTO (
    id_medicamento  INT PRIMARY KEY,
    nombre          VARCHAR(120) NOT NULL,
    descripcion     VARCHAR(200),
    stock           INT,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_vencimiento DATE
);

CREATE TABLE MOVIMIENTO_INVENTARIO (
    id_movimiento  INT PRIMARY KEY,
    tipo           VARCHAR(20) NOT NULL,
    cantidad       INT NOT NULL,
    fecha          DATETIME,
    observacion    VARCHAR(200),
    id_medicamento INT NOT NULL,
    id_personal    INT
);

CREATE TABLE RECETA (
    id_receta              INT PRIMARY KEY,
    fecha                  DATETIME,
    indicaciones_generales VARCHAR(300),
    id_consulta            INT NOT NULL UNIQUE,
    id_veterinario         INT NOT NULL
);

CREATE TABLE RECETA_MEDICAMENTO (
    id_receta       INT NOT NULL,
    id_medicamento  INT NOT NULL,
    dosis           VARCHAR(60),
    frecuencia      VARCHAR(60),
    duracion        VARCHAR(60),
    PRIMARY KEY (id_receta, id_medicamento)
);

ALTER TABLE SEDE
    ADD CONSTRAINT FK_SEDE_VETERINARIA
    FOREIGN KEY (id_veterinaria)
    REFERENCES VETERINARIA (id_veterinaria);

ALTER TABLE MASCOTA
    ADD CONSTRAINT FK_MASCOTA_DUENO
    FOREIGN KEY (id_dueno)
    REFERENCES DUENO (id_dueno);

ALTER TABLE CONTACTO_EMERGENCIA
    ADD CONSTRAINT FK_CONTACTO_DUENO
    FOREIGN KEY (id_dueno)
    REFERENCES DUENO (id_dueno);

ALTER TABLE SERVICIO
    ADD CONSTRAINT FK_SERVICIO_AREA
    FOREIGN KEY (id_area)
    REFERENCES AREA_CLINICA (id_area);

ALTER TABLE PERSONAL_NO_VETERINARIO
    ADD CONSTRAINT FK_PNV_SEDE
    FOREIGN KEY (id_sede)
    REFERENCES SEDE (id_sede);

ALTER TABLE VETERINARIO
    ADD CONSTRAINT FK_VETERINARIO_SEDE
    FOREIGN KEY (id_sede)
    REFERENCES SEDE (id_sede);

ALTER TABLE VETERINARIO_ESPECIALIDAD
    ADD CONSTRAINT FK_VE_VETERINARIO
    FOREIGN KEY (id_veterinario)
    REFERENCES VETERINARIO (id_veterinario);

ALTER TABLE VETERINARIO_ESPECIALIDAD
    ADD CONSTRAINT FK_VE_ESPECIALIDAD
    FOREIGN KEY (id_especialidad)
    REFERENCES ESPECIALIDAD (id_especialidad);

ALTER TABLE CITA
    ADD CONSTRAINT FK_CITA_MASCOTA
    FOREIGN KEY (id_mascota)
    REFERENCES MASCOTA (id_mascota);

ALTER TABLE CITA
    ADD CONSTRAINT FK_CITA_VETERINARIO
    FOREIGN KEY (id_veterinario)
    REFERENCES VETERINARIO (id_veterinario);

ALTER TABLE CONSULTA
    ADD CONSTRAINT FK_CONSULTA_CITA
    FOREIGN KEY (id_cita)
    REFERENCES CITA (id_cita);

ALTER TABLE CONSULTA
    ADD CONSTRAINT FK_CONSULTA_SERVICIO
    FOREIGN KEY (id_servicio)
    REFERENCES SERVICIO (id_servicio);

ALTER TABLE DIAGNOSTICO
    ADD CONSTRAINT FK_DIAGNOSTICO_CONSULTA
    FOREIGN KEY (id_consulta)
    REFERENCES CONSULTA (id_consulta);

ALTER TABLE EXAMEN
    ADD CONSTRAINT FK_EXAMEN_CONSULTA
    FOREIGN KEY (id_consulta)
    REFERENCES CONSULTA (id_consulta);

ALTER TABLE MASCOTA_VACUNA
    ADD CONSTRAINT FK_MV_MASCOTA
    FOREIGN KEY (id_mascota)
    REFERENCES MASCOTA (id_mascota);

ALTER TABLE MASCOTA_VACUNA
    ADD CONSTRAINT FK_MV_VACUNA
    FOREIGN KEY (id_vacuna)
    REFERENCES VACUNA (id_vacuna);

ALTER TABLE HISTORIAL_CLINICO
    ADD CONSTRAINT FK_HIST_MASCOTA
    FOREIGN KEY (id_mascota)
    REFERENCES MASCOTA (id_mascota);

ALTER TABLE HISTORIAL_CLINICO
    ADD CONSTRAINT FK_HIST_CONSULTA
    FOREIGN KEY (id_consulta)
    REFERENCES CONSULTA (id_consulta);

ALTER TABLE HOSPITALIZACION
    ADD CONSTRAINT FK_HOSP_MASCOTA
    FOREIGN KEY (id_mascota)
    REFERENCES MASCOTA (id_mascota);

ALTER TABLE HOSPITALIZACION
    ADD CONSTRAINT FK_HOSP_SEDE
    FOREIGN KEY (id_sede)
    REFERENCES SEDE (id_sede);

ALTER TABLE CIRUGIA
    ADD CONSTRAINT FK_CIR_MASCOTA
    FOREIGN KEY (id_mascota)
    REFERENCES MASCOTA (id_mascota);

ALTER TABLE CIRUGIA
    ADD CONSTRAINT FK_CIR_VETERINARIO
    FOREIGN KEY (id_veterinario)
    REFERENCES VETERINARIO (id_veterinario);

ALTER TABLE MOVIMIENTO_INVENTARIO
    ADD CONSTRAINT FK_MI_MEDICAMENTO
    FOREIGN KEY (id_medicamento)
    REFERENCES MEDICAMENTO (id_medicamento);

ALTER TABLE MOVIMIENTO_INVENTARIO
    ADD CONSTRAINT FK_MI_PERSONAL
    FOREIGN KEY (id_personal)
    REFERENCES PERSONAL_NO_VETERINARIO (id_personal);

ALTER TABLE RECETA
    ADD CONSTRAINT FK_RECETA_CONSULTA
    FOREIGN KEY (id_consulta)
    REFERENCES CONSULTA (id_consulta);

ALTER TABLE RECETA
    ADD CONSTRAINT FK_RECETA_VETERINARIO
    FOREIGN KEY (id_veterinario)
    REFERENCES VETERINARIO (id_veterinario);

ALTER TABLE RECETA_MEDICAMENTO
    ADD CONSTRAINT FK_RM_RECETA
    FOREIGN KEY (id_receta)
    REFERENCES RECETA (id_receta);

ALTER TABLE RECETA_MEDICAMENTO
    ADD CONSTRAINT FK_RM_MEDICAMENTO
    FOREIGN KEY (id_medicamento)
    REFERENCES MEDICAMENTO (id_medicamento);

ALTER TABLE MASCOTA
    ADD CONSTRAINT CK_MASCOTA_SEXO
    CHECK (sexo IN ('M','F'));

ALTER TABLE MOVIMIENTO_INVENTARIO
    ADD CONSTRAINT CK_MI_TIPO
    CHECK (tipo IN ('ENTRADA','SALIDA'));

ALTER TABLE MOVIMIENTO_INVENTARIO
    ADD CONSTRAINT CK_MI_CANTIDAD
    CHECK (cantidad > 0);
