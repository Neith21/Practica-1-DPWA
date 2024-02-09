CREATE DATABASE BDHospital;
GO
USE BDHospital;
GO

-- Tabla Departamentos
CREATE TABLE Departamentos (
    idDepartamento INT PRIMARY KEY IDENTITY(1,1),
    nombreDepartamento VARCHAR(50),
    ubicacion VARCHAR(100)
);
GO
INSERT INTO Departamentos (nombreDepartamento, ubicacion) VALUES 
('Departamento de Pediatr�a', 'Planta baja'),
('Departamento de Cardiolog�a', 'Segundo piso');
GO
-- Tabla CategoriaEmpleados
CREATE TABLE CategoriaEmpleados (
    idCategoria INT PRIMARY KEY IDENTITY(1,1),
    nombreCategoria VARCHAR(50),
    descripcion VARCHAR(100)
);
GO
INSERT INTO CategoriaEmpleados (nombreCategoria, descripcion) VALUES 
('M�dico Cirujano', 'Profesional de la salud con t�tulo universitario'),
('Enfermero', 'Profesional encargado de la atenci�n directa al paciente');
GO
-- Tabla Empleados
CREATE TABLE Empleados (
    idEmpleado INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES CategoriaEmpleados(idCategoria)
);
GO
INSERT INTO Empleados (nombre, apellido, idCategoria) VALUES 
('Juan', 'P�rez', 1),
('Mar�a', 'G�mez', 2);
GO
-- Tabla Paciente
CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fechaNacimiento DATE,
    genero VARCHAR(10),
    direccion VARCHAR(100)
);
GO
INSERT INTO Paciente (nombre, apellido, fechaNacimiento, genero, direccion) VALUES 
('Ana', 'L�pez', '1990-05-15', 'Femenino', 'Calle Principal #123'),
('Pedro', 'Mart�nez', '1985-10-20', 'Masculino', 'Avenida Central #456');
GO
-- Tabla Diagnosticos
CREATE TABLE Diagnosticos (
    idDiagnostico INT PRIMARY KEY IDENTITY(1,1),
    nombreDiagnostico VARCHAR(100),
    descripcion VARCHAR(500)
);
GO
INSERT INTO Diagnosticos (nombreDiagnostico, descripcion) VALUES 
('Gripe', 'Infecci�n respiratoria causada por virus'),
('Fractura de brazo', 'Rotura en uno de los huesos del brazo');
GO
-- Tabla Medicinas
CREATE TABLE Medicinas (
    idMedicina INT PRIMARY KEY IDENTITY(1,1),
    nombreMedicina VARCHAR(100),
    descripcion VARCHAR(500),
    precio DECIMAL(10, 2)
);
GO
INSERT INTO Medicinas (nombreMedicina, descripcion, precio) VALUES 
('Ibuprofeno', 'Analg�sico y antinflamatorio no esteroideo', 10.99),
('Paracetamol', 'Analg�sico y antipir�tico', 8.50);
GO
-- Tabla Tratamientos
CREATE TABLE Tratamientos (
    idTratamiento INT PRIMARY KEY IDENTITY(1,1),
    nombreTratamiento VARCHAR(100),
    descripcion VARCHAR(500)
);
GO
INSERT INTO Tratamientos (nombreTratamiento, descripcion) VALUES 
('Terapia F�sica', 'Ejercicios y t�cnicas para recuperaci�n de movilidad'),
('Quimioterapia', 'Tratamiento m�dico para el c�ncer mediante medicamentos');
GO
-- Tabla Consulta
CREATE TABLE Consulta (
    idConsulta INT PRIMARY KEY IDENTITY(1,1),
    idEmpleado INT,
    idPaciente INT,
    fechaConsulta DATE,
    FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
);
GO
INSERT INTO Consulta (idEmpleado, idPaciente, fechaConsulta) VALUES 
(1, 1, '2024-02-09'),
(2, 2, '2024-02-08');
GO
-- Tabla DetalleConsulta
CREATE TABLE DetalleConsulta (
    idDetalleConsulta INT PRIMARY KEY IDENTITY(1,1),
    idConsulta INT,
    idDiagnostico INT,
	idMedicina INT,
	idTratamiento INT,
    FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta),
    FOREIGN KEY (idDiagnostico) REFERENCES Diagnosticos(idDiagnostico),
	FOREIGN KEY (idMedicina) REFERENCES Medicinas(idMedicina),
	FOREIGN KEY (idTratamiento) REFERENCES Tratamientos(idTratamiento)
);
GO
INSERT INTO DetalleConsulta (idConsulta, idDiagnostico) VALUES 
(1, 1),
(2, 2);
GO
-- Tabla Historial
CREATE TABLE Historial (
    idHistorial INT PRIMARY KEY IDENTITY(1,1),
    idPaciente INT,
	idConsulta INT,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idConsulta) REFERENCES Consulta(idConsulta)
);
GO
INSERT INTO Historial (idPaciente, idConsulta) VALUES 
(1, 1),
(2, 2);
GO