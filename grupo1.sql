-- 1
SELECT genero, count(*) as cantidad FROM cancion
INNER JOIN generoxcancion ON cancion.IdCancion= generoxcancion.IdCancion
INNER JOIN genero ON generoxcancion.IdGenero= genero.IdGenero
WHERE (genero="pop" OR genero="rock") AND titulo LIKE "%m%"
group by genero;

-- 2
SELECT  cancion.idCancion, cancion.titulo, count(cancion.idCancion) as cant FROM cancion 
INNER JOIN playlistxcancion ON playlistxcancion.IdCancion = cancion.IdCancion
INNER JOIN playlist ON playlistxcancion.IdPlaylist = playlist.IdPlaylist
GROUP BY cancion.titulo;

-- 3
SELECT cancion.idCancion, cancion.titulo, count(cancion.idCancion) as cant, artista.nombre FROM cancion 
-- LEFT JOIN playlistxcancion ON playlistxcancion.IdCancion = cancion.IdCancion
-- LEFT JOIN playlist ON playlistxcancion.IdPlaylist = playlist.IdPlaylist
JOIN album ON cancion.idAlbum= album.idAlbum
JOIN artista ON artista.idArtista = album.idArtista
WHERE NOT EXISTS
	(SELECT idCancion FROM playlistxcancion WHERE playlistxcancion.IdCancion = cancion.IdCancion)
GROUP BY cancion.titulo;
-- HAVING cant=0; playlistxcancion.IdCancion IS NULL



-- 4
UPDATE usuario SET Pais_idPais=1
WHERE CP='7600';

-- 5
SELECT cancion.titulo, count(generoxcancion.idCancion) as cant  FROM album
JOIN cancion ON album.idAlbum = cancion.idAlbum
JOIN generoxcancion ON cancion.idCancion= generoxcancion.idCancion
-- JOIN genero ON generoxcancion.idGenero= genero.idGenero
GROUP BY cancion.titulo
HAVING cant>1;

-- 6 
CREATE INDEX nombre_cancion
ON cancion (idCancion);
-- SHOW INDEX FROM cancion

