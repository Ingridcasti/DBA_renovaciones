/*Servivio de catalogo de estado*/
select id_Estado, estado from Estado;
/*Servivio de catalogo de Pais*/
select id_Pais, nom_pais from Paises;
/*Servivio de catalogo Rol*/
select id_Rol, nom_Rol from Roles;
/*Servivio de catalogo de tipos de documentos*/
select id_Tipo_Doc, nom_Tipo_Doc from TipoDocumentos;
/*Servivio de catalogo de tipo de empresa*/
select id_Tipo_Empresa, nom_Tipo_Empre from TipoEmpresa;


/*Servivio autenticacion de Usuario*/
select correo, contrasenia from  PerfilUsuario where correo="gerson.chavez@tigo.hn" and contrasenia="tigo123";
/*Servivio Recuperaion de contraseña*/
select correo from PerfilUsuario where correo="gerson.chavez@tigo.hn";

USE renovaciones;
/* Servivio Listar contratos-cliente ALL*/
select Contratos.id_Contrato,Contratos.num_Contrato, Contratos.fecha_Inicio, Contratos.fecha_Final, 
	Estado.estado, DATE_ADD(Contratos.fecha_Inicio, INTERVAL 12 MONTH) AS 'Fecha exacta de vencimiento' from Contratos 
       inner Join Estado on Contratos.id_Estado=Estado.id_Estado 
       inner join Clientes on Contratos.id_Cliente=Clientes.id_Cliente
       inner join PerfilUsuario on Clientes.id_Cliente=PerfilUsuario.id_Cliente
       where Clientes.id_Cliente="1";

/*Servicio Listar Contratos por Filtro(activos, en proceso, vencidos) con Rol Cliente*/
select Contratos.id_Contrato, Contratos.num_Contrato, Contratos.fecha_Inicio, Contratos.fecha_Final, 
	Estado.estado, DATE_ADD(Contratos.fecha_Inicio, INTERVAL 12 MONTH) AS Fecha_vencimiento from Contratos 
       inner Join Estado on Contratos.id_Estado=Estado.id_Estado 
       inner join Clientes on Contratos.id_Cliente=Clientes.id_Cliente
       where Clientes.id_Cliente="1" and Contratos.id_Estado='1';

/*Y Servicio Listar Contratos-admin(por activos(1), en proceso(3), vencidos(2) por estado por parte de administrador)*/
select Contratos.id_Contrato, Contratos.num_Contrato, Contratos.fecha_Inicio, Contratos.fecha_Final, 
	Estado.estado, DATE_ADD(Contratos.fecha_Inicio, INTERVAL 6 MONTH) AS Fecha_Renovacion from Contratos 
       inner Join Estado on Contratos.id_Estado=Estado.id_Estado 
       inner join Clientes on Contratos.id_Cliente=Clientes.id_Cliente
       where Clientes.id_Cliente="1" and Contratos.id_Estado='1';

       
/*Servicio Listar Clientes-Admin  por filtro de pais */
SELECT c.id_Cliente, c.nom_Empresa,
	 (select count(1) From Contratos co where  co.id_Estado= 1
	 AND co.Id_Cliente=c.Id_Cliente ) as Contratos_Activos,
	(select count(1) From Contratos co where  co.id_Estado= 2 
	AND co.Id_Cliente=c.Id_Cliente ) as Contratos_En_Proceso,
	(select count(1) From Contratos co where  co.id_Estado= 3 
	AND co.Id_Cliente=c.Id_Cliente ) as Contratos_Vencidos,
	(select count(1) From PerfilUsuario pu  where pu.Id_Cliente = c.Id_Cliente) as perfiles_cliente,
    pa.nom_pais, pa.id_Pais from Clientes c 
	inner join Paises pa on c.id_Pais=pa.id_Pais;

/*Servicio Listar Clientes-Admin por filtro de pais&palabra clave(campo_cliente) */
SELECT 
	 Clientes.nom_Empresa, Clientes.id_Cliente,
	 count(case when Contratos.id_Estado= 1 then Contratos.id_Estado end ) as Contratos_Activos,
	 count(case when Contratos.id_Estado= 2 then Contratos.id_Estado end ) as Contratos_En_Proceso,
	 count(case when Contratos.id_Estado= 3 then Contratos.id_Estado end ) as Contratos_Vencidos,
	 count(PerfilUsuario.id_Cliente) as perfiles_cliente, 
     Paises.nom_pais from Clientes 
     inner join Contratos on Clientes.id_Cliente=Contratos.id_Cliente
     inner join Estado on Contratos.id_Estado=Estado.id_Estado
     inner join Paises on Clientes.id_Pais=Paises.id_Pais
     inner join PerfilUsuario on Clientes.id_Cliente=PerfilUsuario.id_Cliente
     WHERE (Clientes.nom_Empresa LIKE '%go%' and Clientes.id_Pais = "2") or Clientes.nom_Empresa LIKE '' or Paises.id_Pais = '2'
     group by Contratos.id_Cliente;
     
   
/*listar perfiles de cliente*/
SELECT P.id_Perfil, Cli.nom_Empresa, CONCAT(D.nombre, ' ', D.apellido) AS 'Nombre Completo' FROM PerfilUsuario as P 
inner join DatosPersona as D on D.id_Persona=P.id_Persona
inner join Clientes as Cli on P.id_Cliente=Cli.id_Cliente
WHERE P.id_Cliente = "";

/*Listar  Documentos*/
select  D.id_Documento, D.id_Contrato, C.num_contrato, T.nom_Tipo_Doc from DocumentacionContratos as D
        inner join TipoDocumentos as T on T.id_Tipo_Doc=D.id_Tipo_Doc
         inner join Contratos as C on D.id_Contrato=C.id_Contrato
        where D.id_Contrato="";
       
/* Descarga y visualizar documentos*/
select  T.nom_Tipo_Doc, D.id_Documento from DocumentacionContratos as D
        inner join TipoDocumentos as T on T.id_Tipo_Doc=D.id_Tipo_Doc
        where D.id_Contrato="" and D.id_Documento="";


/*Servicio Contactenos*/
select C.nom_Empresa, P.correo from PerfilUsuario as P
inner join Clientes as C ON P.id_Cliente=C.id_Cliente
where P.id_Perfil="1";

/*Renovacion de contratos*/
select C.nom_Empresa, P.correo, P.nom_usr, Contratos.num_contrato from PerfilUsuario as P
inner join Clientes as C ON P.id_Cliente=C.id_Cliente
inner join Contratos on Contratos.id_Cliente= C.id_Cliente
where Contratos.id_Contrato="";

/*Visualizar datos del Perfil*/
select P.cargo, P.correo, P.nom_usr, P.foto, P.contacto_Tel, D.nombre, D.apellido, D.fecha_Nac, C.nom_Empresa  from PerfilUsuario as P
inner join Clientes as C ON P.id_Cliente=C.id_Cliente
inner join DatosPersona as D on D.id_Persona=P.id_Persona
where P.id_Perfil="1";


/*Filtrar listado de clientes por palabra clave*/
SELECT C.id_Cliente, P.id_Perfil FROM PerfilUsuario as P
                        inner join Clientes as C on C.id_Cliente=P.id_Cliente
                        WHERE id_Perfil = 1;



SELECT 
               Clientes.id_Cliente, nom_Empresa ,
                count(case when Contratos.id_Estado= 1 then Contratos.id_Estado end ) as Contratos_Activos,
                 count(case when Contratos.id_Estado= 2 then Contratos.id_Estado end ) as Contratos_En_Proceso,
                 count(case when Contratos.id_Estado= 3 then Contratos.id_Estado end ) as Contratos_Vencidos,
                	 count(PerfilUsuario.id_Cliente) as perfiles_cliente,
                  Paises.nom_pais from Clientes 
                   inner join Contratos on Clientes.id_Cliente=Contratos.id_Cliente
                   inner join Estado on Contratos.id_Estado=Estado.id_Estado
                   inner join Paises on Clientes.id_Pais=Paises.id_Pais
                    inner join PerfilUsuario on Clientes.id_Cliente=PerfilUsuario.id_Cliente
                    WHERE Clientes.id_Cliente = 1
                  group by Contratos.id_Cliente=1;








