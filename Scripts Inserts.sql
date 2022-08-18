USE renovaciones;

INSERT Paises(nom_pais) VALUES("Honduras");
INSERT Paises(nom_pais) VALUES("El Salvador");
INSERT Paises(nom_pais) VALUES("Panamá");
INSERT Paises(nom_pais) VALUES("Guatemala");
INSERT Paises(nom_pais) VALUES("Costa Rica");

SELECT * FROM Paises;

INSERT TipoEmpresa(nom_Tipo_Empre) VALUES("Publica");
INSERT TipoEmpresa(nom_Tipo_Empre) VALUES("Privada");

SELECT * FROM TipoEmpresa;

INSERT Estado(estado) VALUES("Activo");
INSERT Estado(estado) VALUES("Vencido");
INSERT Estado(estado) VALUES("En proceso de renovación");

SELECT * FROM Estado;

INSERT TipoDocumentos(nom_Tipo_Doc) VALUES("Contrato");
INSERT TipoDocumentos(nom_Tipo_Doc) VALUES("Certificado de renovación");
INSERT TipoDocumentos(nom_Tipo_Doc) VALUES("Oferta");
INSERT TipoDocumentos(nom_Tipo_Doc) VALUES("Contrato Legal");
INSERT TipoDocumentos(nom_Tipo_Doc) VALUES("Orden de compra");

SELECT * FROM TipoDocumentos;

INSERT Roles(nom_Rol, descripcion) VALUES("Administrador", "Usuario que maneja la plataforma, con acceso total, empleado de la empresa renovadora.");
INSERT Roles(nom_Rol, descripcion) VALUES("Usuario Normal", "Usuario que pertenece a un cliente, tiene acceso a sus documentos y acciones.");

SELECT * FROM Roles;


/* DATOS PARA PRUEBAS*/

INSERT INTO DatosPersona(nombre, apellido, fecha_nac) VALUES("Gerson", "Chávez", '1999-10-23');

INSERT INTO Clientes(nom_Empresa, num_Registro, id_Pais, id_Tipo_Empresa) VALUES("Tigo", "EPSV08012022", 1, 2);
INSERT Clientes(nom_Empresa, num_Registro, id_Pais, id_Tipo_Empresa) VALUES("Claro", "EPSV08012023", 2, 2);

INSERT INTO Contactos(id_Cliente, contacto) VALUES(1, "www.tigo.com.hn/suport");
INSERT Contactos(id_Cliente, contacto) VALUES(1, "soporte@tigo.com.hn");
INSERT Contactos(id_Cliente, contacto) VALUES(1, "2234-8899");

INSERT INTO PerfilUsuario(id_Persona, id_Rol, id_Cliente, cargo, foto, contacto_Tel, correo, nom_usr, contrasenia, estado) 
VALUES(1, 2, 1, "Gerente", null, "9737-0789", "gerson.chavez@tigo.hn", "DavidTigo", "tigo123", 1);

SELECT * FROM PerfilUsuario;

SELECT * FROM Contratos;

INSERT INTO Contratos(num_Contrato, id_Cliente, id_Estado, fecha_Inicio, fecha_Final) VALUES("LOBD-00111", 1, 1, '2022-07-07', '2023-07-07');

