/* REGISTROS EN LAS DIFERENTES TABLAS */

USE renovaciones;

/*Servicio de registro de Usuario*/
INSERT INTO DatosPersona(nombre, apellido, fecha_nac) VALUES( ?, ?, ?);
INSERT INTO PerfilUsuario(id_Persona, id_Rol, id_Cliente, cargo, foto, contacto_Tel, correo, nom_usr, contrasenia, estado)
       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
       
/*Servicio de registro de Cliente*/
INSERT INTO Clientes(nom_Empresa, num_Registro, id_Pais, id_Tipo_Empresa) VALUES( ?, ?, 1, 2);
INSERT INTO Contactos(id_Cliente, contacto) VALUES(?, ?);

/*Servicio de registro de contratos*/
INSERT INTO Contratos(num_Contrato, id_Cliente, id_Estado, fecha_Inicio, fecha_Final) VALUES(?, ?, ?, ?, ?);

/*Servicio de registro de documentos de contrato*/
INSERT INTO DocumentacionContratos(id_Contrato, documento, id_Tipo_Doc) VALUES(?, ?, ?);
