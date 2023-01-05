SELECT u.usuario, COUNT(h.song_id) AS qt_de_musicas_ouvidas, ROUND(SUM(d.duracao_segundos/60), 2) AS total_minutos
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_reproducao AS h
ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.song AS d
ON h.song_id = d.song_id
GROUP BY u.usuario
ORDER BY u.usuario;
