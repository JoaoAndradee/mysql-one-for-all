SELECT s.song AS nome, COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.usuario as u
INNER JOIN SpotifyClone.historico_reproducao AS h
ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.song AS s
ON s.song_id = h.song_id
WHERE
u.plano_id IN (1, 3)
GROUP BY s.song
ORDER BY song;
