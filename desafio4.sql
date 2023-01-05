SELECT
u.usuario,
IF (MAX(c.data_reproducao) > '2021-01-01', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_reproducao AS c
ON u.usuario_id = c.usuario_id
GROUP BY usuario
ORDER BY usuario;
