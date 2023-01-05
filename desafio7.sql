SELECT
a.artista AS artista,
al.album AS album,
COUNT(s.seguido_por_usuario) AS seguidores
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al
ON a.artista_id = al.artista_id
INNER JOIN SpotifyClone.seguindo AS s
ON s.artista_id = a.artista_id
GROUP BY al.album_id
ORDER BY seguidores DESC, artista, album;
