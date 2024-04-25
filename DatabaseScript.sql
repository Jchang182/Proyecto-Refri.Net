use master
go
drop database if EXISTS DB_RefriVirtual  
go

create database DB_RefriVirtual
go

use DB_RefriVirtual
go

create table tb_categoriaReceta(
idCategoria int primary key ,
descripcion varchar(100)
);

create table tb_receta(
idReceta char(4) primary key,
nombre varchar(50),
imagen varchar(100),
preparacion varchar(350)

);

create table tb_categoriaRecetaDetalle(
id int ,
idCategoria int  ,
idReceta  char(4) ,
primary key(id,idCategoria,idReceta),
Foreign key (idReceta)REFERENCES tb_receta(idReceta),
Foreign key (idCategoria)REFERENCES tb_categoriaReceta(idCategoria)
);

create table tb_producto(
idProducto char(4) primary key,
nombre varchar(50),
precio float,
stock int ,
descripcion varchar(100),
imagen varchar(100),
estado bit
);

create table tb_ingredientes(
idIngrediente int,
idReceta char(4),
idProducto char(4),
descripcionCantidad varchar(100),
primary key (idIngrediente,idReceta,idProducto),
Foreign key (idReceta)REFERENCES tb_receta(idReceta),
Foreign key (idProducto)REFERENCES tb_producto(idProducto)
);


create table tb_tipoUsuario(
id int primary key,
descripcion varchar(100)
);

create table tb_usuario(
idUsuario int primary key,
nombres varchar(100),
apellidos varchar(100),
email varchar(50),
telefono char(9),
contrasena varchar(50),
tipoUsuario int ,
estado bit,
idMembrecia int ,
Foreign key (tipoUsuario)REFERENCES tb_tipoUsuario(id)
);

create table tb_cabeceraCarrito(
idCarrito int primary key  ,
idUsuario int,
estadoCarrito bit ,
Foreign key (idUsuario)REFERENCES tb_usuario(idUsuario)
);

create table tb_detalleCarrito(
idDetalleCarrito int primary key ,
idCarrito int NOT NULL,
idProducto char(4) NOT NULL,
cantidad int NOT NULL,
precioTotal DECIMAL(10, 2) NOT NULL,
Foreign key (idCarrito)REFERENCES tb_cabeceraCarrito(idCarrito),
Foreign key (idProducto)REFERENCES tb_producto(idProducto)
);

create table tb_refri(
idRefri int primary key,
idUsuario int,
Foreign key (idUsuario)REFERENCES tb_usuario(idUsuario)
);

create table tb_detalleRefri(
idDetalleCarrito int primary key ,
idRefri int NOT NULL,
idProducto char(4) NOT NULL,
cantidad int NOT NULL,
Foreign key (idRefri)REFERENCES tb_refri(idRefri),
Foreign key (idProducto)REFERENCES tb_producto(idProducto)
);
create table tb_membrecia(
idMembrecia int primary key,
descripcion varchar(250),
imagen varchar(60),
precio DECIMAL(10, 2) NOT NULL

);
create table tb_detalleMenmbrecia(
id int primary key,
idMembrecia int ,
idReceta char(4),
Foreign key (idMembrecia)REFERENCES tb_membrecia(idMembrecia),
Foreign key (idReceta)REFERENCES tb_receta(idReceta)
);



--tb_categoriaReceta
insert into tb_categoriaReceta values(1,'Vegano');
insert into tb_categoriaReceta values(2,'Carnivoro');
insert into tb_categoriaReceta values(3,'Sin gluten');
insert into tb_categoriaReceta values(4,'Sin lactosa');
insert into tb_categoriaReceta values(5,'Comida Italiana');
insert into tb_categoriaReceta values(6,'Comida Peruana');
insert into tb_categoriaReceta values(7,'Comida Chilena');
insert into tb_categoriaReceta values(8,'Comida Mexicana');
insert into tb_categoriaReceta values(9,'Comida China');
insert into tb_categoriaReceta values(10,'Comida Japonesa');

--tb_receta
insert into tb_receta values('R001','Tallarin Rojo','tallarinRojo.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R002','Tallarin verde','tallarinverde.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R003','Tallarin Alfredo','tallarinAlfredo.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R004','Arroz Chaufa','arrozChaufa.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R005','Makis de Pulpo','MakisPulpo.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R006','El Cancato','tallarinFettuccine.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R007','Tacos de Carne','tallarinFettuccine.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R008','Causa de Pollo','tallarinFettuccine.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R009','LemonKay','tallarinFettuccine.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');
insert into tb_receta values('R010','Tallarin Saltado','tallarinFettuccine.jpg','Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu Lorem ipsu ');

--tb_categoriaRecetaDetalle
insert into tb_categoriaRecetaDetalle values(1,6,'R001');
insert into tb_categoriaRecetaDetalle values(1,6,'R002');
insert into tb_categoriaRecetaDetalle values(1,5,'R003');
insert into tb_categoriaRecetaDetalle values(2,2,'R003');
insert into tb_categoriaRecetaDetalle values(1,7,'R006');
insert into tb_categoriaRecetaDetalle values(1,10,'R005');
insert into tb_categoriaRecetaDetalle values(1,9,'R009');
insert into tb_categoriaRecetaDetalle values(1,6,'R008');
insert into tb_categoriaRecetaDetalle values(1,9,'R010');
insert into tb_categoriaRecetaDetalle values(1,9,'R004');

--tb_producto
insert into tb_producto values('P001', 'Lata de Atun Primor',10.50,10,'500 gramos','LataAtun.jpg',1);
insert into tb_producto values('P002', 'Paquete de tallarin don vitolio',8.50,10,'500 gramos','paqueteTallarin.jpg',1);
insert into tb_producto values('P003', 'Sillaro',10.50,10,'500 gramos','Sillao.jpg',1);
insert into tb_producto values('P004', '1 kg de carne',10.50,10,'1 kg de san fernando','1kgCarne.jpg',1);
insert into tb_producto values('P005', '1kg de tomate',10.50,10,'1kg de tomate','1kgtomate.jpg',1);
insert into tb_producto values('P006', '1 kg de arroz paisana',10.50,10,'1 kg de arroz paisana','1kgArrozPaisana.jpg',1);
insert into tb_producto values('P007', '1 kg de limon',10.50,10,'1 kg de limon','1kglimon.jpg',1);
insert into tb_producto values('P008', '500 gramos de queso',10.50,10,'500 gramos de queso','queso.jpg',1);
insert into tb_producto values('P009', 'Aceite primor',10.50,10,'Aceite primor','Aceiteprimor.jpg',1);
insert into tb_producto values('P010', '1 kg de harina Vitolio',10.50,10,'1 kg de harina Vitolio','1kgHarina.jpg',1);

--tb_ingredientes
insert into tb_ingredientes values(1, 'R001','P002',' 2 TOMATES ');
insert into tb_ingredientes values(2, 'R001','P004',' 2 TOMATES ');
insert into tb_ingredientes values(3, 'R001','P005',' 2 TOMATES ');
insert into tb_ingredientes values(4, 'R001','P009',' 2 TOMATES ');
insert into tb_ingredientes values(1, 'R004','P003',' 2 TOMATES ');
insert into tb_ingredientes values(2, 'R004','P006',' 2 TOMATES ');
insert into tb_ingredientes values(1, 'R009','P007',' 2 TOMATES ');
insert into tb_ingredientes values(2, 'R009','P003',' 2 TOMATES ');
insert into tb_ingredientes values(3, 'R009','P009',' 2 TOMATES ');
insert into tb_ingredientes values(4, 'R009','P004',' 2 TOMATES ');

--tb_tipoUsuario
insert into tb_tipoUsuario values(1, 'Admin');
insert into tb_tipoUsuario values(2, 'Cliente');

--tb_usuario

insert into tb_usuario values(1, 'Admin' , 'admin' ,'admin@hotmail.com','963852741','admin',1,1,1);
insert into tb_usuario values(2, 'Jacqueline' , 'Chang' ,'jacqueline.chang2211@gmail.com','902297116','1230',2,1,1);
insert into tb_usuario values(3, 'Johan' , 'Cerna' ,'Johan@hotmail.com','963852741','1230',2,1,1);
insert into tb_usuario values(4, 'Joel' , 'Larico' ,'Joel@hotmail.com','963852741','1230',2,1,1);

select * from tb_producto


--tb_cabeceraCarrito -- estado carrito  1 = carrito abierto y 0 = a carrito ceraddo
insert into tb_cabeceraCarrito values(1, 2 , 1 ); 
insert into tb_cabeceraCarrito values(2, 3 , 1 ); 
insert into tb_cabeceraCarrito values(3, 4 , 1 ); 

--tb_detalleCarrito
insert into tb_detalleCarrito values(1, 1 , 'P001',10,105 ); 
insert into tb_detalleCarrito values(2, 1 , 'P002',10,105 ); 
insert into tb_detalleCarrito values(3, 1 , 'P003',10,105 ); 
insert into tb_detalleCarrito values(4, 1 , 'P004',10,105 ); 
insert into tb_detalleCarrito values(5, 1 , 'P005',10,105 ); 
insert into tb_detalleCarrito values(6, 1 , 'P006',10,105 ); 


--tb_refri
insert into tb_refri values(1, 1 ); 
insert into tb_refri values(2, 2 ); 
insert into tb_refri values(3, 3 ); 
insert into tb_refri values(4, 4 ); 

--tb_detalleRefri
insert into tb_detalleRefri values(1, 1 , 'P001',10); 
insert into tb_detalleRefri values(2, 1 , 'P002',10); 
insert into tb_detalleRefri values(3, 2 , 'P003',10); 
insert into tb_detalleRefri values(4, 2 , 'P001',10); 
insert into tb_detalleRefri values(5, 3 , 'P001',10); 
insert into tb_detalleRefri values(6, 3 , 'P003',10); 
insert into tb_detalleRefri values(7, 4 , 'P001',10); 
insert into tb_detalleRefri values(8, 4 , 'P005',10); 



--Procedures => listarRecetas, eliminarRecetas, mergeRecetas
create proc sp_listar_receta
as
begin
	select * from tb_receta
end
exec sp_listar_receta



create proc sp_delete_receta
@IdReceta char
as
begin
	delete from tb_receta where idReceta = @IdReceta
end
go

create proc sp_merge_receta
@IdReceta char,
@Nombre varchar,
@Imagen varchar,
@Preparacion varchar
as
begin

Merge tb_receta as target
using(Select @IdReceta, @Nombre, @Imagen, @Preparacion) as 
		source(idReceta,nombre,imagen,preparacion)
on target.idReceta=source.idReceta
When Matched then
   Update Set target.nombre=source.nombre, target.imagen=source.imagen,
   target.preparacion=source.preparacion
When not Matched then
   Insert Values(source.idReceta, source.nombre, source.imagen, source.preparacion);
end

