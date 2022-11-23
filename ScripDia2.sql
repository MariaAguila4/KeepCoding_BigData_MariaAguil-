create schema prueba_dll authorization vrrhkmpe;


-- Crear la tabla de series
create table prueba_dll.series(
	idSerie varchar(10), --0123456789
	nombre varchar(200),
	year_creation integer
);

--Borrar tabla
drop table prueba_dll.series ;

-- Crear la tabla de series con PK y control null
create table prueba_dll.series(
	idSerie varchar(10) not null, --0123456789 PK
	nombre varchar(200) not null,
	year_creation integer not null,
	constraint series_PK primary key (idSerie)
);

--Modificar tabla con un comentario
alter table prueba_dll.series 
add column comentario varchar(250) null;

--borrar columna + datos
alter table prueba_dll.series 
drop column comentario;

--creamos la tabla temporadas
create table prueba_dll.temporadas(
	idSerie varchar(10) not null, --0123456789 PK,FK-> series(idSeries)
	numTemp integer not null, --PK
	yeartemp integer not null, -- obligatorio
	titulo varchar(200) not null,--  obligatorio
	comentario varchar(250) null -- no obligatorio

);
alter table prueba_dll.temporadas
add constraint temporadasPk primary key (idSerie, numTemp);

-- creamos la FK de la tabla
alter table prueba_dll.temporadas
add constraint temporadasFk foreign key (idSerie)
references prueba_dll.series (idSerie); -- on delete cascade

---- DML -----
-- COmando Insert -----

insert into prueba_dll.series 
(idserie, nombre, year_creation)
values ('0001','Breaking Bad', 2008);


insert into prueba_dll.series 
(idserie, nombre, year_creation)
values ('0002','Juego de tronos', 2011);

insert into prueba_dll.series 
(idserie, nombre, year_creation)
values ('0003','Hermanos de sangre', 2001);

--- avance SELECT ---
select * from prueba_dll.series

insert into prueba_dll.temporadas 
(idserie, numTemp, yeartemp, titulo)
values ('0001', 1, 2008, 'Primera temporada');


insert into prueba_dll.temporadas 
(idserie, numTemp, yeartemp, titulo)
values ('0001', 2, 2008, 'Segunda temporada');


insert into prueba_dll.temporadas 
(idserie, numTemp, yeartemp, titulo)
values ('0002', 1, 2011, 'Primera temporada');

insert into prueba_dll.temporadas 
(idserie, numTemp, yeartemp, titulo)
values ('0002', 2, 2012, 'Segunda temporada');

insert into prueba_dll.temporadas 
(idserie, numTemp, yeartemp, titulo)
values ('0002', 3, 2013, 'Tercera temporada');

select * from prueba_dll.temporadas 



--- comando SELECT ---  full scan

select *
from prueba_dll.temporadas ;

select idserie , numTemp , yeartemp, titulo, comentario
from prueba_dll.temporadas ;


-- Serie juego de Tronos
select *
from prueba_dll.temporadas t 
where idserie  = '0002';


-- Serie juego de Tronos temporada 2
select *
from prueba_dll.temporadas t 
where idserie  = '0002' and numTemp = 2;

-- Serie juego de Tronos temporada 2 y la temporada 1
select *
from prueba_dll.temporadas t 
where idserie  = '0002' and (numTemp = 2 or numTemp  = 1)

-- temporadas mayores al año 2010
select *
from prueba_dll.temporadas a
where yeartemp > 2010


-- temporadas mayores al año 2010 ordenadas por año descendente
select *
from prueba_dll.temporadas t 
where t.yeartemp > 2010
order by t.yeartemp desc, t.titulo  desc -- asc / desc

-- No repetir el id serie, desde la tabla temporadas
select  distinct idserie  
from prueba_dll.temporadas 

--- Comando DELETE
delete from prueba_dll.series 
where idserie  = '0003';

--- COMANDO UPDATE ---

select *
from prueba_dll.temporadas
where idserie  = '0001' and numTemp = 2;

update prueba_dll.temporadas
set comentario = 'Hola', titulo  = 'temporada 2'
where idserie  = '0001' and numTemp = 2;

--- COMANDO SELECT - AGRUPACIONES ---

select count(*)
from prueba_dll.temporadas t 
where numTemp  = 1

select sum(numTemp), avg(numTemp)
from prueba_dll.temporadas t 

--- numero temporadas por serie
select idserie , count(*)
from prueba_dll.temporadas t 
group by idserie

-- numero series que tengas mas de 2 temporadas
select idserie , count(*)
from prueba_dll.temporadas t 
group by idserie
having count(*) >= 2
order by idserie desc


--- UNION ALL ---

-- temporadas de las 2 series
select idserie, titulo 
from prueba_dll.temporadas where idserie  = '0001'
union all
select idserie, titulo 
from prueba_dll.temporadas where idserie  = '0002'


--- usando 2 tablas distintas

select distinct idserie as pepe from prueba_dll.temporadas 
where idserie  = '0001'
union all
select idserie as manolo from prueba_dll.series s 
where idserie  = '0002' or idserie  = '0003'

--- Tabla temporal, auxiliar, intermedia... copia seguridad etc...


create table prueba_dll.series_copia
as
select * from prueba_dll.series s  where 1 = 1



select * from prueba_dll.series_copia sc 

--- FUNCIONES-----

select dt_birth as "Fecha de nacimiento", date_part('year',dt_birth) as yeartemp  
from public.person 
where date_part('year',dt_birth) < 1976;

select email, trim(upper(email)) as email2 
from public.person p 


select * 
from public.employees e 

---- Ejerccios


select gender, count(*)
from person
group by gender

select count(*)
from person p 
where dt_birth  < '1970-01-01'



select COUNT(*)
from employees  
where employee_type = 'PROFESIONAL'

select AVG(salary_gross_annual), MAX(salary_gross_annual), MIN(salary_gross_annual)
from employees  

select  job , AVG(salary_gross_annual)
from employees  
group by job
