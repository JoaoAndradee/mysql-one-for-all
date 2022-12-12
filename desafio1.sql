DROP DATABASE IF EXISTS SpotifyClone;

    CREATE DATABASE IF NOT EXISTS SpotifyClone;

	CREATE TABLE SpotifyClone.plano (
		    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        plano VARCHAR(50) NOT NULL,
        valor DECIMAL(4,2)
    ) ENGINE = InnoDB;

    CREATE TABLE SpotifyClone.usuario (
		usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        usuario VARCHAR(200) NOT NULL,
        idade INT NOT NULL,
        plano_id INT NOT NULL,
        data_assinatura DATE,
        FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano (plano_id)
	) ENGINE = InnoDB;

    CREATE TABLE SpotifyClone.artista (
		artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        artista VARCHAR(100)
    ) ENGINE = InnoDB;

	CREATE TABLE SpotifyClone.album (
		album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        album VARCHAR(100) NOT NULL,
        artista_id INT NOT NULL,
        ano_lancamento YEAR NOT NULL,
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
    ) ENGINE = InnoDB;

	CREATE TABLE SpotifyClone.song (
		song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        artista_id INT NOT NULL,
        song VARCHAR(250) NOT NULL,
        album_id INT NOT NULL,
        duracao_segundos INT NOT NULL,
        FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id),
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
    ) ENGINE = InnoDB;

	CREATE TABLE SpotifyClone.historico_reproducao (
        usuario_id INT NOT NULL,
        song_id INT NOT NULL,
        data_reproducao DATE,
        PRIMARY KEY (usuario_id, song_id),
        FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario (usuario_id),
        FOREIGN KEY (song_id) REFERENCES SpotifyClone.song (song_id)
    ) ENGINE = InnoDB;

    CREATE TABLE SpotifyClone.seguindo (
		artista_id INT NOT NULL,
        seguido_por_usuario INT,
        PRIMARY KEY (artista_id, seguido_por_usuario),
        FOREIGN KEY (seguido_por_usuario) REFERENCES SpotifyClone.usuario (usuario_id),
        FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
    ) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plano (plano, valor)
VALUES
('gratuito', 0.00),
('universitario', 5.99),
('pessoal', 6.99),
('familiar', 7.99);

INSERT INTO SpotifyClone.usuario (usuario, idade, plano_id, data_assinatura)
VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 4, '2017-12-30'),
('Martin Fowler', 46, 4, '2017-01-17'),
('Sandi Metz', 58, 4, '2018-04-29'),
('Paulo Freire', 19, 2, '2018-02-14'),
('Bell Hooks', 26, 2, '2018-01-05'),
('Christopher Alexander', 85, 3, '2019-06-05'),
('Judith Butler', 45, 3, '2020-05-13'),
('Jorge Amado', 58, 3, '2017-02-17');

INSERT INTO SpotifyClone.artista (artista)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO SpotifyClone.album (album, artista_id, ano_lancamento)
VALUES
('Renaissance', 1, '2022'),
('Jazz', 2, '1978'),
('Hot Space', 2, '1982'),
('Falso Brilhante', 3, '1998'),
('Vento de Maio', 3, '2001'),
('QVVJFA?', 4, '2003'),
('Somewhere Far Beyond', 5, '2007'),
('I Put A Spell On You', 6, '2012');

INSERT INTO SpotifyClone.song (artista_id, song, duracao_segundos, album_id)
VALUES
(1, 'BREAK MY SOUL', 279, 1),
(1, "VIRGO'S GROOVE", 369, 1),
(1, 'ALIEN SUPERSTAR', 116, 1),
(2, "Don't Stop Me  Now", 203, 2),
(2, 'Under Pressure', 152, 3),
(3, 'Como Nossos Pais', 105, 4),
(3, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
(4, 'Samba em Paris', 267, 6),
(5, "The Bard's Song", 244, 7),
(6, 'Feeling Good', 100, 8);

INSERT INTO SpotifyClone.historico_reproducao (usuario_id, song_id, data_reproducao)
VALUES
(1, 8, '2022-02-28'),
(1, 2, '2020-05-02'),
(1, 10, '2020-03-06'),
(2, 10, '2022-08-05'),
(2, 7, '2022-01-02'),
(3, 10, '2020-11-13'),
(3, 2, '2020-12-05'),
(4, 8, '2021-08-15'),
(5, 8, '2022-01-09'),
(5, 5, '2020-08-06'),
(6, 7, '2017-01-24'),
(6, 1, '2017-10-12'),
(7, 4, '2011-12-15'),
(8, 4, '2012-03-17'),
(9, 9, '2022-02-24'),
(10, 3, '2015-12-13');

INSERT INTO SpotifyClone.seguindo (artista_id, seguido_por_usuario)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(4, 4),
(5, 5),
(6, 5),
(6, 6),
(1, 6),
(6, 7),
(3, 9),
(2, 10);
