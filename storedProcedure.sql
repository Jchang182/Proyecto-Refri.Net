use DB_RefriVirtual
go


create or alter procedure usp_ValidarUsuario(
@Correo varchar(50),
@Contraseña varchar(50)
)
as

begin
	select * from tb_usuario where email = @Correo  and contrasena  = @Contraseña
end;

exec usp_ValidarUsuario 'admin@hotmail.com' ,'admin' ;

create or alter procedure usp_GenerarCodigo
as
begin 
	select top 1 tb_usuario.idUsuario + 1 as CodigoGenerado from  tb_usuario
	order by idUsuario desc;
end;

create or alter procedure usp_RegistrarUsuario(
@idUsuario int ,
@Nombre varchar(100),
@Apellidos varchar(100),
@Email varchar(100),
@Telefono varchar(100),
@Contrasena  varchar(100),
@TipoUsuario int ,
@estado int ,
@idMembrecia int 
)
as
begin 
	insert into tb_usuario values(@idUsuario,@Nombre,@Apellidos,@Email,@Telefono,@Contrasena,@TipoUsuario,@estado,@idMembrecia);
end;

create or alter procedure usp_ActualizarUsuario(
@idUsuario int ,
@Nombre varchar(100),
@Apellidos varchar(100),
@Email varchar(100),
@Telefono varchar(100),
@Contrasena  varchar(100),
@TipoUsuario int ,
@estado int ,
@idMembrecia int 
)
as
begin 
	update  tb_usuario Set  nombres=@Nombre, apellidos=@Apellidos,email=@Email,telefono=@Telefono,contrasena=@Contrasena,tipoUsuario=@TipoUsuario,estado=@estado,idMembrecia=@idMembrecia where  idUsuario=@idUsuario;
end;

create or alter procedure usp_BuscarUsuario(
@idUsuario int 
)
as 
begin 
	select * from tb_usuario where idUsuario = @idUsuario ;
end;

select * from tb_usuario