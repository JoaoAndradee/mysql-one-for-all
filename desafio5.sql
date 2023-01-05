SELECT
s.song AS cancao,
COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.historico_reproducao AS h
ON s.song_id = h.song_id
GROUP BY song
ORDER BY reproducoes DESC, cancao
LIMIT 2;
