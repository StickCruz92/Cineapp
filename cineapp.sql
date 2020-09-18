-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2020 a las 21:41:00
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cineapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('luis', 'EDITOR'),
('marisol', 'GERENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `titulo`, `fecha`, `archivo`, `estatus`) VALUES
(1, 'Estreno - Kong La Isla Calavera', '2017-07-27', 'slide1.jpg', 'Activo'),
(2, 'Proximo Mes - La bella y la bestia', '2017-07-27', 'slide2.jpg', 'Activo'),
(3, 'Ya esta aquí - Spider Man, de regreso a casa', '2017-07-28', 'slide3.jpg', 'Activo'),
(4, 'Por fin ha llegado el día - Cars 3 ', '2017-07-29', 'slide4.jpg', 'Activo'),
(5, 'Hola mundo', '2020-09-13', '5B61NVBWrincon-mundo.png', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `id` int(11) NOT NULL,
  `director` varchar(100) DEFAULT NULL,
  `actores` varchar(255) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL COMMENT 'URL del video en Youtube\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id`, `director`, `actores`, `sinopsis`, `trailer`) VALUES
(1, 'Jordan Vogt-Roberts', 'Samuel L. Jackson,Tom Hiddleston,Brie Larson,Toby Kebbell', 'Kong: La Isla Calavera reimagina el origen del mítico Kong en una irresistible aventura original del director Jordan Vogt-Roberts. En la película, un diverso equipo de exploradores es reunido para aventurarse en el interior de una isla del Pacífico —tan bella como traicionera— que no aparece en los mapas, sin saber que están invadiendo los dominios del mítico Kong.', 'https://www.youtube.com/embed/86jhW2gPc84'),
(2, 'Daniel Espinosa', 'Jake Gyllenhaal, Ryan Reynolds, Rebecca Ferguson', 'Seis miembros de la tripulación de la Estación Espacial Internacional que están a punto de lograr uno de los descubrimientos más importantes en la historia humana: la primera evidencia de vida extraterrestre en Marte. A medida que el equipo comienza a investigar y sus métodos tienen consecuencias inesperadas, la forma viviente demostrará ser más inteligente de lo que cualquiera esperaba.', 'https://www.youtube.com/embed/_cq1XIVXdjU'),
(3, 'Bill Condon', 'Dan Stevens,Emma Watson,Luke Evans', 'LA BELLA Y LA BESTIA, de Disney, es una adaptación de acción real de la película animada, que revive a los queridos personajes del clásico cuento de Disney para una audiencia contemporánea, manteniendo la música original e incorporando varias nuevas canciones.', 'https://www.youtube.com/embed/4D8N06nx9rs'),
(4, 'Oriol Paulo', 'Mario Casas, Bárbara Lennie, José Coronado, Ana Wagener', 'Adrián Doria, un joven y exitoso empresario, despierta en la habitación de un hotel junto al cadáver de su amante. Acusado de asesinato, decide contratar los servicios de Virginia Goodman, la mejor preparadora de testigos del país. En el transcurso de una noche, asesora y cliente trabajarán para encontrar una duda razonable que le libre de la cárcel.', 'https://www.youtube.com/embed/sOxy2gtPY7A'),
(5, 'Dean Israelite', 'Bryan Cranston, Elizabeth Banks, Becky G, Dacre Montgomery', 'Cinco adolescentes deben convertirse en algo extraordinario al enterarse que su pueblo, Angel Grove, y el mundo están a punto de ser aniquilados por una amenaza extraterrestre. Escogidos por el destino, nuestros héroes pronto descubren que son los únicos que pueden salvar el planeta…pero para hacerlo, deberán superar sus problemas de la vida real y, antes que sea demasiado tarde, unirse como los PowerRangers.', 'https://www.youtube.com/embed/gemUEi0XMTg'),
(6, 'F. Gary Gray', 'Dwayne Johnson,Michelle Rodriguez,Charlize Theron,Jason Statham,Vin Diesel', 'Justo cuando Dom y Letty celebran su luna de miel, Brian y Mia se han retirado del juego y el resto del equipo se ha desintegrado en busca de una vida comun y corriente; una misteriosa mujer intentara seducir a Dom para convencerlo de regresar a la vida criminal que tanto lo acecha, traicionando a quienes lo rodean y enfrentandose a retos nunca antes vistos.', 'https://www.youtube.com/embed/3KuazYQ1JuE'),
(7, 'James Gunn', 'Dave Bautista,Bradley Cooper,Zoe Saldana,Vin Diesel,Chris Pratt', 'Ambientada en el nuevo contexto sonoro de \"Awesome Mixtape #2\", GUARDIANES DE LA GALAXIA VOL. 2, de Marvel, continua las aventuras del equipo en su travesia por los confines del cosmos. Los Guardianes deberan luchar para mantener unida a su nueva familia mientras intentan resolver el misterio del verdadero linaje de Peter Quill. Viejos rivales se convertiran en nuevos aliados y los personajes favoritos de los comics clasicos acudiran en ayuda de nuestros heroes a medida que el Universo Cinematografico de Marvel continua expandiendose.', 'https://www.youtube.com/embed/bBTtlcJwjSo'),
(9, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'ghjgkjhgjk', 'https://www.youtube.com/embed/hXWaiBhZpgI'),
(10, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sinopsis', 'https://www.youtube.com/embed/xHirrzX38Qc'),
(11, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sinopsis', 'https://www.youtube.com/embed/hMbexEPAOQI'),
(12, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sinopsis', 'https://www.youtube.com/embed/hXWaiBhZpgI'),
(13, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sinopsis', 'https://www.youtube.com/embed/hXWaiBhZpgI'),
(14, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sipnosis', 'https://www.youtube.com/embed/xHirrzX38Qc'),
(15, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sip', 'https://www.youtube.com/embed/hMbexEPAOQI'),
(16, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'lop', 'https://www.youtube.com/embed/xHirrzX38Qc'),
(17, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'lop', 'https://www.youtube.com/embed/hMbexEPAOQI'),
(21, 'Hermanas Wachowski', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'sip', 'https://www.youtube.com/embed/hMbexEPAOQI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`, `descripcion`, `estatus`) VALUES
(5, 'Accion', 'Accion', 'Activo'),
(6, 'Aventura', 'Aventura', 'Activo'),
(7, 'Clasicas', 'Clasicas', 'Activo'),
(8, 'Comedia Romantica', 'Comedia Romantica', 'Activo'),
(9, 'Drama', 'Drama', 'Activo'),
(10, 'Terror', 'Terror', 'Activo'),
(11, 'Infantil', 'Infantil', 'Activo'),
(12, 'Accion y Aventura', 'Accion y Aventura', 'Activo'),
(13, 'Romantica', 'Romantica', 'Activo'),
(14, 'Ciencia Ficcion', 'Ciencia Ficcion', 'Activo'),
(15, 'Thriller', 'Thriller', 'Activo'),
(16, 'Sangrienta', 'Sangrienta', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `sala` varchar(100) NOT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `idPelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `fecha`, `hora`, `sala`, `precio`, `idPelicula`) VALUES
(1, '2017-10-04', '18:00:00', 'Premium', 55, 1),
(2, '2017-10-04', '18:00:00', 'Premium', 55, 3),
(3, '2017-10-04', '21:00:00', 'Premium', 55, 3),
(4, '2017-10-04', '18:00:00', 'Premium', 65, 4),
(5, '2017-10-04', '21:00:00', 'Premium', 65, 4),
(6, '2017-10-04', '20:00:00', 'Premium', 55, 5),
(7, '2017-10-04', '16:30:00', 'Premium', 60, 7),
(8, '2017-10-04', '15:45:00', 'Premium', 55, 8),
(9, '2017-10-04', '14:00:00', 'Sala 1', 55, 1),
(10, '2017-10-04', '16:00:00', 'Sala 1', 55, 1),
(11, '2017-10-04', '14:00:00', 'Sala 1', 60, 2),
(12, '2017-10-04', '16:00:00', 'Sala 1', 60, 2),
(13, '2017-10-04', '14:00:00', 'Sala 1', 55, 3),
(14, '2017-10-04', '16:00:00', 'Sala 1', 55, 3),
(15, '2017-10-04', '14:00:00', 'Sala 1', 65, 4),
(16, '2017-10-04', '16:00:00', 'Sala 1', 65, 4),
(17, '2017-10-04', '17:00:00', 'Sala 1', 55, 5),
(18, '2017-10-04', '19:00:00', 'Sala 1', 55, 5),
(19, '2017-10-04', '21:00:00', 'Sala 1', 55, 5),
(20, '2017-10-04', '18:45:00', 'Sala 1', 55, 8),
(21, '2017-10-04', '21:45:00', 'Sala 1', 55, 8),
(22, '2017-10-04', '17:00:00', 'Sala 2', 55, 3),
(23, '2017-10-04', '17:00:00', 'Sala 2', 65, 4),
(24, '2017-10-04', '16:00:00', 'Sala 2', 55, 5),
(25, '2017-10-04', '18:30:00', 'Sala 2', 60, 7),
(26, '2017-10-04', '16:00:00', 'Sala 3', 55, 3),
(27, '2017-10-04', '16:00:00', 'Sala 3', 65, 4),
(28, '2017-10-04', '22:00:00', 'Sala 3', 55, 5),
(29, '2017-10-04', '20:45:00', 'Sala 3', 60, 7),
(30, '2017-10-04', '22:20:00', 'Sala 3', 55, 8),
(31, '2017-10-05', '18:00:00', 'Premium', 55, 1),
(32, '2017-10-05', '18:00:00', 'Premium', 55, 3),
(33, '2017-10-05', '21:00:00', 'Premium', 55, 3),
(34, '2017-10-05', '18:00:00', 'Premium', 65, 4),
(35, '2017-10-05', '21:00:00', 'Premium', 65, 4),
(36, '2017-10-05', '14:30:00', 'Premium', 55, 8),
(37, '2017-10-05', '17:00:00', 'Premium', 55, 8),
(38, '2017-10-05', '14:00:00', 'Sala 1', 55, 1),
(39, '2017-10-05', '16:00:00', 'Sala 1', 55, 1),
(40, '2017-10-05', '14:00:00', 'Sala 1', 60, 2),
(41, '2017-10-05', '16:00:00', 'Sala 1', 60, 2),
(42, '2017-10-05', '14:00:00', 'Sala 1', 55, 3),
(43, '2017-10-05', '16:00:00', 'Sala 1', 55, 3),
(44, '2017-10-05', '14:00:00', 'Sala 1', 65, 4),
(45, '2017-10-05', '16:00:00', 'Sala 1', 65, 4),
(46, '2017-10-05', '17:50:00', 'Sala 1', 55, 8),
(47, '2017-10-05', '17:00:00', 'Sala 2', 55, 3),
(48, '2017-10-05', '17:00:00', 'Sala 2', 65, 4),
(49, '2017-10-05', '17:00:00', 'Sala 2', 55, 8),
(50, '2017-10-05', '16:00:00', 'Sala 3', 55, 3),
(51, '2017-10-05', '16:00:00', 'Sala 3', 65, 4),
(52, '2017-10-05', '22:10:00', 'Sala 3', 55, 8),
(53, '2017-10-06', '18:00:00', 'Premium', 55, 5),
(54, '2017-10-06', '21:00:00', 'Premium', 55, 5),
(55, '2017-10-06', '20:00:00', 'Premium', 60, 2),
(56, '2017-10-06', '15:30:00', 'Premium', 55, 8),
(57, '2017-10-06', '14:00:00', 'Sala 1', 55, 5),
(58, '2017-10-06', '16:00:00', 'Sala 1', 55, 5),
(59, '2017-10-06', '17:00:00', 'Sala 1', 60, 2),
(60, '2017-10-06', '19:00:00', 'Sala 1', 60, 2),
(61, '2017-10-06', '21:00:00', 'Sala 1', 60, 2),
(62, '2017-10-06', '20:30:00', 'Sala 1', 55, 8),
(63, '2017-10-06', '13:30:00', 'Sala 1', 60, 7),
(64, '2017-10-06', '17:00:00', 'Sala 2', 55, 5),
(65, '2017-10-06', '16:00:00', 'Sala 2', 60, 2),
(66, '2017-10-06', '17:15:00', 'Sala 2', 55, 8),
(67, '2017-10-06', '13:30:00', 'Sala 2', 60, 7),
(68, '2017-10-06', '18:00:00', 'Sala 2', 60, 7),
(69, '2017-10-06', '21:30:00', 'Sala 2', 60, 7),
(70, '2017-10-06', '16:00:00', 'Sala 3', 55, 5),
(71, '2017-10-06', '22:00:00', 'Sala 3', 60, 2),
(72, '2017-10-06', '17:15:00', 'Sala 3', 55, 8),
(73, '2017-10-06', '14:00:00', 'Sala 3', 60, 7),
(74, '2017-10-06', '22:00:00', 'Sala 3', 60, 7),
(75, '2017-10-07', '22:15:00', 'Premium', 55, 5),
(76, '2017-10-07', '14:30:00', 'Premium', 60, 7),
(77, '2017-10-07', '17:00:00', 'Premium', 60, 7),
(78, '2017-10-07', '11:00:00', 'Premium', 55, 8),
(79, '2017-10-07', '14:30:00', 'Sala 1', 60, 7),
(80, '2017-10-07', '21:30:00', 'Sala 1', 60, 7),
(81, '2017-10-07', '15:30:00', 'Sala 1', 55, 8),
(82, '2017-10-07', '15:30:00', 'Sala 2', 55, 5),
(83, '2017-10-07', '21:30:00', 'Sala 2', 60, 7),
(84, '2017-10-07', '11:00:00', 'Sala 2', 55, 8),
(85, '2017-10-07', '17:55:00', 'Sala 2', 55, 8),
(86, '2017-10-07', '16:40:00', 'Sala 3', 55, 5),
(87, '2017-10-07', '14:30:00', 'Sala 3', 60, 7),
(88, '2017-10-07', '17:00:00', 'Sala 3', 60, 7),
(89, '2017-10-07', '21:30:00', 'Sala 3', 60, 7),
(90, '2017-10-07', '11:00:00', 'Sala 3', 55, 8),
(91, '2017-10-07', '22:10:00', 'Sala 3', 55, 8),
(92, '2017-10-08', '13:30:00', 'Premium', 55, 8),
(93, '2017-10-08', '15:30:00', 'Premium', 55, 8),
(94, '2017-10-08', '17:30:00', 'Premium', 55, 8),
(95, '2017-10-08', '21:00:00', 'Premium', 55, 8),
(96, '2017-10-08', '17:00:00', 'Premium', 60, 7),
(97, '2017-10-08', '20:45:00', 'Premium', 60, 7),
(98, '2017-10-08', '16:15:00', 'Sala 1', 55, 8),
(99, '2017-10-08', '18:30:00', 'Sala 1', 55, 8),
(100, '2017-10-08', '21:30:00', 'Sala 1', 55, 8),
(101, '2017-10-08', '16:15:00', 'Sala 2', 60, 7),
(102, '2017-10-08', '20:15:00', 'Sala 2', 60, 7),
(103, '2017-10-08', '22:50:00', 'Sala 2', 60, 7),
(104, '2017-10-08', '14:40:00', 'Sala 3', 55, 8),
(105, '2017-10-08', '20:10:00', 'Sala 3', 55, 8),
(107, '2020-09-13', '13:00:00', 'Sala 1', 20, 22),
(108, '2020-09-13', '16:00:00', 'Premium', 100, 22),
(109, '2020-09-13', '17:00:00', 'Sala 3', 60, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` text NOT NULL,
  `estatus` enum('Activa','Inactiva') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `fecha`, `detalle`, `estatus`) VALUES
(1, 'Bob Esponja: tercera pelicula y temporada 12', '2017-10-01', '<p><strong><span style=\"color: #ff0000;\">Nickelodeon y productor de SpongeBob Square Pants confirman temporada 12 de 52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. </span></strong></p>\r\n<p><strong>&iexcl;Calamardo est&aacute; enojado!Bob Esponja: tercera pel&iacute;cula y temporada 12</strong></p>\r\n<p>Nickelodeon y productor de SpongeBob Square Pants confirman temporada 12 de 52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. &iexcl;Calamardo est&aacute; enojado!.</p>\r\n<p>A lado de cierta Pi&ntilde;a (debajo del mar), Calamardo debe estar de muy mal humor, pues hay Bob Esponja para rato... &iexcl;y por partida doble!. Por un lado, Vincent Waller (The Ren &amp; Stimpy Show), artista, productor, escritor y supervisor creativo de SpongeBob Squarepants anunci&oacute; con un divertido dibujo desde su cuenta de Twitter que, antes de que se estrene siquiera la temporada 11 de la serie animada, se ha confirmado ya la n&uacute;mero 12, &iexcl;que constar&aacute; de 52 episodios (recuerden que cada emisi&oacute;n consta de 2 aventuras)!</p>', 'Activa'),
(2, 'Julia Roberts protagonizara. The Bookseller', '2017-10-02', '<p>La novela de Cynthia Swanson <span style=\"color: #0000ff;\"><strong>The Bookseller</strong></span> ser&aacute; llevada al cine con <span style=\"color: #0000ff;\">Julia Roberts (Los Pitufos: La aldea Escondida)</span> como protagonista.<br /><br />La historia est&aacute; ambientada en los sesenta y su protagonista es una mujer soltera, Kitty Miller, que lleva una librer&iacute;a. Sue&ntilde;a con una vida alternativa en la que ha encontrado el amor y est&aacute; casada y con hijos, pero la l&iacute;nea que separa realidad y ficci&oacute;n comienza a estar demasiado dispersa para que la distinga.<br /><br />Seg&uacute;n informa <span style=\"color: #ff0000;\"><strong>Moviehole</strong></span> Roberts tambi&eacute;n producir&aacute; la pel&iacute;cula junto a Lisa Gillan y Marisa Yeres Hill.</p>', 'Activa'),
(3, 'Rosamund Pike sera Marie Curie', '2017-05-17', '<p><strong>Rosamund Pike</strong> (<span style=\"color: #008000;\">Un Reino Unido</span>) dar&aacute; vida a la famosa cient&iacute;fica Marie Curie en la pel&iacute;cula de Studiocanal <strong>Radioactiv</strong>. Se trata de una adaptaci&oacute;n de la biograf&iacute;a escrita por Lauren Redniss, que se centra en el romance entre Marie y Pierre Curie y en el descubrimiento de la radiactividad.<br /><br />Seg&uacute;n informa <span style=\"color: #008000;\"><strong>Premiere</strong></span> el proceso de casting para los papeles de Pierre y de Paul Langevin, su joven amante, ya ha comenzado.<br /><br />Marjane Satrapi dirigir&aacute; a partir de un gui&oacute;n de Jack Thorne. Tim Bevan, Eric Fellner y Paul Webster producir&aacute;n la pel&iacute;cula.</p>', 'Inactiva'),
(4, 'Julianne Moore sera Gloria', '2017-10-04', '<p><strong><span style=\"color: #0000ff;\">Julianne Moore</span></strong> <span style=\"color: #808080;\">(Kingsman: El C&iacute;rculo de Oro)</span> protagonizar&aacute; el remake de FilmNation de la pel&iacute;cula chilena <em><strong>Gloria</strong></em>.<br /><br />Sebastian Lelio, director de la pel&iacute;cula original, escribir&aacute; el gui&oacute;n del remake, que todav&iacute;a no tiene t&iacute;tulo.<br /><br />Moore ser&aacute; Gloria, una mujer de 58 a&ntilde;os que est&aacute; sola en la vida. Para compensar el vac&iacute;o, llena sus d&iacute;as de actividades y por las noches busca el amor en el mundo de las fiestas para solteros adultos, donde solo consigue perderse en una serie de aventuras sin sentido. Esta fr&aacute;gil felicidad en la que vive se altera cuando conoce a Rodolfo, un hombre de 65 a&ntilde;os, recientemente separado, que se obsesiona con ella. Gloria comienza un romance, pero &eacute;ste se complica por la enfermiza dependencia de Rodolfo hacia sus hijos y su ex mujer. Esta relaci&oacute;n, a la que Gloria se entrega porque intuye que podr&iacute;a ser la &uacute;ltima, acabar&aacute; por hacerla estrellarse contra la cruel realidad del mundo. Gloria deber&aacute; reconstruirse para enfrentar con nuevas fuerzas su definitiva entrada a la vejez.<br /><br />Seg&uacute;n <span style=\"color: #008000;\"><strong>The Hollywood Reporter</strong> </span>Juan de Dios Larrain y Pablo Larrain producir&aacute;n la cinta, que comenzar&aacute; a rodarse a finales de mes.</p>', 'Activa'),
(5, 'Matrix revoluciones', '2020-09-13', '<p>al fin el extreno de matrix revoluciones</p>', 'Inactiva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `duracion` int(11) NOT NULL,
  `clasificacion` enum('A','B','C') NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `fechaEstreno` date NOT NULL,
  `estatus` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  `idDetalle` int(11) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `duracion`, `clasificacion`, `imagen`, `fechaEstreno`, `estatus`, `idDetalle`, `idGenero`) VALUES
(1, 'Kong La Isla Calavera', 118, 'B', 'kong.png', '2017-09-29', 'Activa', 1, 12),
(2, 'Life: Vida Inteligente', 104, 'B', 'life.png', '2017-09-29', 'Activa', 2, 9),
(3, 'La Bella y La Bestia', 132, 'A', 'bella.png', '2017-09-29', 'Activa', 3, 11),
(4, 'Contratiempo', 106, 'B', 'contratiempo.png', '2017-10-01', 'Activa', 4, 12),
(5, 'Power Rangers', 120, 'B', 'power-rangers.png', '2017-10-01', 'Activa', 5, 6),
(7, 'Rapidos y Furiosos 8', 136, 'B', 'rapidos-furiosos.png', '2017-10-03', 'Activa', 6, 5),
(8, 'Guardianes de la Galaxia Vol 2', 136, 'B', 'guardianes-galaxia.png', '2017-10-03', 'Activa', 7, 5),
(22, 'Matrix revoluciones', 120, 'B', '39TUZU42matrix-revoluciones.png', '2020-01-09', 'Inactiva', 21, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `cuenta` varchar(100) NOT NULL,
  `perfil` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `cuenta`, `perfil`) VALUES
(7, 'luis', 'EDITOR'),
(8, 'marisol', 'GERENTE'),
(9, 'pepe', 'EDITOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('luis', '{noop}luis123', 0),
('marisol', '{noop}mari123456', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `cuenta` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cuenta`, `pwd`, `activo`, `email`, `telefono`) VALUES
(4, 'luis', '$2a$10$Pa/G9YNYlB5ZUD8JBbd94uiCxMLcln73cqGSCYYEemzDjfIqT468m', 1, 'luis@luis.com', '4444444'),
(5, 'marisol', '$2a$10$iYELx1L2rT9qZEL6.ZdBeuqC4UQoy3zJt7cp.ULrWLTyxvFtlPKTa', 1, 'mari@mai.com', '4444444'),
(6, 'pepe', '$2a$10$UybqGub3sFnzzyZ1.DjFo.C4dzIEBvVUCRULwIvuGTq15Eedy9aPG', 1, 'pepe@pepe.com', '4444444');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `authorities_idx_1` (`username`,`authority`);

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Horarios_Peliculas1_idx` (`idPelicula`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Peliculas_Detalles1_idx` (`idDetalle`),
  ADD KEY `fk_Peliculas_Generos1_idx` (`idGenero`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authorities_idx_2` (`cuenta`,`perfil`),
  ADD UNIQUE KEY `cuenta_perfil_UNIQUE` (`cuenta`,`perfil`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cuenta_UNIQUE` (`cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_Horarios_Peliculas1` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `fk_Peliculas_Detalles1` FOREIGN KEY (`idDetalle`) REFERENCES `detalles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Peliculas_Generos1` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `authorities_ibfk_2` FOREIGN KEY (`cuenta`) REFERENCES `usuarios` (`cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
