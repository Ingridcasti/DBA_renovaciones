
/* UPDATES EN LAS TABLAS */

/*Servicio Cambio de Contraseña */
UPDATE PerfilUsuario SET contrasenia = ? WHERE id_Perfil = ?;

/* servicio Editar Perfil*/
UPDATE PerfilUsuario SET contacto_Tel = ?, cargo = ? WHERE id_Perfil = ?;
UPDATE DatosPersona SET fecha_Nac = ? WHERE id_Persona = ?;

/*servicio Actualizar Estado*/
UPDATE Contratos SET id_Estado = ? WHERE num_Contrato = ?;

/*Servicio dar de baja un usuario*/
UPDATE PerfilUsuario SET estado = 2 WHERE id_Perfil = ?;
