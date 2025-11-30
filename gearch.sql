-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Gearch;

-- Usar la base de datos
USE Gearch;

-- Crear tabla Propietario
CREATE TABLE Propietario (
    id_propietario INT PRIMARY KEY,
    nombre_propietario VARCHAR(100) NOT NULL,
    email_propietario VARCHAR(100) UNIQUE NOT NULL,
    telefono_propietario VARCHAR(20),
    contrasena_propietario VARCHAR(100) NOT NULL
);

-- Crear tabla Taller
CREATE TABLE Taller (
    id_taller INT PRIMARY KEY,
    nombre_taller VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono_taller VARCHAR(20),
    id_propietario INT NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES Propietario(id_propietario)
);

-- Crear tabla Calendario
CREATE TABLE Calendario (
    id_calendario INT PRIMARY KEY,
    fecha_cita DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    id_taller INT NOT NULL,
    FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);

-- Crear tabla Servicio
CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Crear tabla intermedia Taller_Servicio (M:N)
CREATE TABLE Taller_Servicio (
    id_taller INT NOT NULL,
    id_servicio INT NOT NULL,
    PRIMARY KEY (id_taller, id_servicio),
    FOREIGN KEY (id_taller) REFERENCES Taller(id_taller),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE NOT NULL,
    telefono_cliente VARCHAR(20),
    contrasena_cliente VARCHAR(100) NOT NULL
);

-- Crear tabla Vehiculo
CREATE TABLE Vehiculo (
    id_vehiculo INT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    matricula VARCHAR(20),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Crear tabla Reserva
CREATE TABLE Reserva (
    id_reserva INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_taller INT NOT NULL,
    id_servicio INT NOT NULL,
    id_calendario INT NOT NULL,
    id_vehiculo INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_taller) REFERENCES Taller(id_taller),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_calendario) REFERENCES Calendario(id_calendario),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo)
);

-- Crear tabla Resena
CREATE TABLE Resena (
    id_resena INT PRIMARY KEY,
    comentario TEXT,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    fecha DATE,
    id_cliente INT NOT NULL,
    id_taller INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);
