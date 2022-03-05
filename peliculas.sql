-- Crear una base de datos llamada películas.
create database peliculas;

-- Crear 2 tablas llamadas películas y reparto.
create table peliculas(
	id int primary key,
	pelicula varchar,
	año_estreno int,
	director varchar
);

create table reparto(
	peliculas_id int,
	actor varchar,
	foreign key (peliculas_id) references peliculas(id)
);

-- Cargar ambos archivos a su tabla correspondiente.
\COPY peliculas FROM 'C:\Users\Samuel\Desktop\Apoyo Desafio - Top 100\peliculas.csv' csv header;

\COPY reparto FROM 'C:\Users\Samuel\Desktop\Apoyo Desafio - Top 100\reparto.csv' csv header;

-- Obtener el ID de la película “Titanic”.
select id id_titanic from peliculas where pelicula = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic".
select actor reparto_titanic from reparto where peliculas_id = 2;

-- Consultar en cuántas películas del top 100 participa Harrison Ford.
select pelicula Harrison_Ford_en from peliculas inner join reparto on peliculas.id = reparto.peliculas_id where reparto.actor = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
select pelicula peliculas_entre_1990_a_1999 from peliculas where año_estreno >= 1990 and  año_estreno <= 1999 order by pelicula asc;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
select pelicula, length(pelicula) longitud_titulo from peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
select pelicula, length(pelicula) longitud_titulo from peliculas order by length(pelicula) desc limit 1;