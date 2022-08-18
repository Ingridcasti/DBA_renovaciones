CREATE DATABASE renovaciones;

USE renovaciones;

CREATE TABLE DatosPersona(
  id_Persona INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(128),
  apellido VARCHAR(128),
  fecha_Nac DATE
);

CREATE TABLE Paises(
  id_Pais INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom_pais VARCHAR(128) NOT NULL
);

CREATE TABLE TipoEmpresa(
  id_Tipo_Empresa INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom_Tipo_Empre VARCHAR(64) NOT NULL
);

CREATE TABLE Estado(
  id_Estado INTEGER PRIMARY KEY AUTO_INCREMENT,
  estado VARCHAR(64) NOT NULL
);

CREATE TABLE TipoDocumentos(
  id_Tipo_Doc INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom_Tipo_Doc VARCHAR(128) NOT NULL
);

CREATE TABLE Roles(
  id_Rol INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom_Rol VARCHAR(128) NOT NULL,
  descripcion VARCHAR(256)
);

CREATE TABLE Licencias(
  id_Licencia INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom_Licencia VARCHAR(64) NOT NULL,
  valor_Licencia NUMERIC(10,2),
  valor_Soporte NUMERIC(10,2)
);

CREATE TABLE Clientes(
  id_Cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom_Empresa VARCHAR(128) NOT NULL,
  num_Registro VARCHAR(32) NOT NULL,
  id_Pais INTEGER NOT NULL,
  id_Tipo_Empresa INTEGER NOT NULL,
  FOREIGN KEY(id_Pais) references Paises(id_Pais),
  FOREIGN KEY(id_Tipo_Empresa) references TipoEmpresa(id_Tipo_Empresa)
);

CREATE TABLE Contactos(
  id_Contacto INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_Cliente INTEGER NOT NULL,
  contacto VARCHAR(64) NOT NULL,
  FOREIGN KEY(id_Cliente) references Clientes(id_Cliente)
);

CREATE TABLE PerfilUsuario(
  id_Perfil INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_Persona INTEGER NOT NULL,
  id_Rol INTEGER NOT NULL,
  id_Cliente INTEGER NOT NULL,
  cargo VARCHAR(128) NOT NULL,
  foto MEDIUMBLOB,
  contacto_Tel VARCHAR(32),
  correo VARCHAR(64),
  nom_usr VARCHAR(32),
  contrasenia BLOB NOT NULL, /*porque se encriptara la contrasenia y se genera un dato binario.*/
  estado BIT NOT NULL,
  FOREIGN KEY(id_Persona) references DatosPersona(id_Persona),
  FOREIGN KEY(id_Rol) references Roles(id_Rol),
  FOREIGN KEY(id_Cliente) references Clientes(id_Cliente)
);

CREATE TABLE Contratos(
  id_Contrato INTEGER PRIMARY KEY AUTO_INCREMENT,
  num_Contrato VARCHAR(32) NOT NULL,
  id_Licencia INTEGER NOT NULL,
  id_Cliente INTEGER NOT NULL,
  id_Estado INTEGER NOT NULL,
  fecha_Inicio DATE NOT NULL,
  fecha_Final DATE NOT NULL,
  FOREIGN KEY(id_Licencia) references Licencias(id_Licencia),
  FOREIGN KEY(id_Cliente) references Clientes(id_Cliente),
  FOREIGN KEY(id_Estado) references Estado(id_Estado)
);

CREATE TABLE DocumentacionContratos(
  id_Documento INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_Contrato INTEGER NOT NULL,
  documento LONGBLOB NOT NULL,
  id_Tipo_Doc INTEGER NOT NULL,
  FOREIGN KEY(id_Contrato) references Contratos(id_Contrato),
  FOREIGN KEY(id_Tipo_Doc) references TipoDocumentos(id_Tipo_Doc)
)
