-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-12-2021 a las 11:02:03
-- Versión del servidor: 5.6.13
-- Versión de PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dbempresa`
--
CREATE DATABASE IF NOT EXISTS `dbempresa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbempresa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproductos`
--

CREATE TABLE IF NOT EXISTS `tbproductos` (
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `caracteristicas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbproductos`
--

INSERT INTO `tbproductos` (`codigo`, `descripcion`, `precio`, `stock`, `caracteristicas`) VALUES
('1', 'Caramelo de Limon', 0.1, 30, 'Alto en azucar'),
('2', 'Cartulina', 2, 18, 'No te la olvides'),
('3', 'Cheese Tris', 150, 20, 'Stock Limitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuario`
--

CREATE TABLE IF NOT EXISTS `tbusuario` (
  `usu_dni` varchar(11) NOT NULL,
  `usu_usuario` varchar(11) NOT NULL,
  `usu_nombre` varchar(11) NOT NULL,
  `usu_email` varchar(50) NOT NULL,
  `usu_telefono` varchar(11) NOT NULL,
  `usu_direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbusuario`
--

INSERT INTO `tbusuario` (`usu_dni`, `usu_usuario`, `usu_nombre`, `usu_email`, `usu_telefono`, `usu_direccion`) VALUES
('72624112', 'sangama7', 'Adrian', 'sangamaadrian7@gmail.com', '9', 'Callao'),
('72624113', 'lopez2', 'Maria', 'lopezmaria4@gmail.com', '9', 'Lima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuarios`
--

CREATE TABLE IF NOT EXISTS `tbusuarios` (
  `cuenta` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbusuarios`
--

INSERT INTO `tbusuarios` (`cuenta`, `nombre`, `clave`, `email`) VALUES
('DayanitaShow', 'Dayanita', '123', 'dayanitashow@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbventas`
--

CREATE TABLE IF NOT EXISTS `tbventas` (
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
