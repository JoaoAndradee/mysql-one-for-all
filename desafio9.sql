SELECT COUNT(s.song_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducao AS s
WHERE s.usuario_id = 1;
