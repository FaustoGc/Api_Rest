-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.4.0-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para almacen_parahogar
CREATE DATABASE IF NOT EXISTS `almacen_parahogar` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `almacen_parahogar`;

-- Volcando estructura para tabla almacen_parahogar.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `Id_clientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  PRIMARY KEY (`Id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla almacen_parahogar.clientes: ~10 rows (aproximadamente)
INSERT INTO `clientes` (`Id_clientes`, `nombres`, `apellido`, `telefono`) VALUES
	(1, 'Juan', 'Pérez', 979581121),
	(2, 'Maria', 'Gonzalez', 98),
	(3, 'Carlos', 'Rodriguez', 567),
	(4, 'Ana', 'Martinez', 345),
	(5, 'Pedro', 'Gomez', 789),
	(6, 'Sofia', 'Lopez', 901),
	(7, 'Luis', 'Torres', 234),
	(8, 'Gabriela', 'Ramirez', 678),
	(9, 'Jorge', 'Morales', 12),
	(10, 'Isabel', 'Castillo', 456);

-- Volcando estructura para tabla almacen_parahogar.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla almacen_parahogar.empleados: ~10 rows (aproximadamente)
INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `telefono`) VALUES
	(1, 'Roberto', 'Mendoza', '123-456-7890'),
	(2, 'Patricia', 'Vargas', '098-765-4321'),
	(3, 'Ricardo', 'Ortiz', '567-890-1234'),
	(4, 'Carmen', 'Reyes', '345-678-9012'),
	(5, 'Guillermo', 'Guerrero', '789-012-3456'),
	(6, 'Teresa', 'Salgado', '901-234-5678'),
	(7, 'Eduardo', 'Paredes', '234-567-8901'),
	(8, 'Lourdes', 'Cordero', '678-901-2345'),
	(9, 'Hernan', 'Zambrano', '012-345-6789'),
	(10, 'Rosario', 'Delgado', '456-789-0123');

-- Volcando estructura para tabla almacen_parahogar.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad_en_almacen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla almacen_parahogar.productos: ~10 rows (aproximadamente)
INSERT INTO `productos` (`id`, `nombre`, `precio`, `cantidad_en_almacen`) VALUES
	(1, 'Sartén', 20.00, 50),
	(2, 'Cubiertos', 15.00, 100),
	(3, 'Artículos de cocina', 30.00, 200),
	(4, 'Cestas de mimbre', 25.00, 30),
	(5, 'Lámparas', 40.00, 20),
	(6, 'Vajillas', 60.00, 15),
	(7, 'Estanterías', 80.00, 10),
	(8, 'Mesas', 100.00, 5),
	(9, 'Sillas', 50.00, 10),
	(10, 'Muebles', 200.00, 5);

-- Volcando estructura para tabla almacen_parahogar.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `total_vendido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Id_clientes`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla almacen_parahogar.ventas: ~10 rows (aproximadamente)
INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_empleado`, `id_producto`, `total_vendido`) VALUES
	(1, 1, 1, 1, 1200.99),
	(2, 2, 2, 2, 25.75),
	(3, 3, 3, 3, 45.90),
	(4, 4, 4, 4, 200.00),
	(5, 5, 5, 5, 150.50),
	(6, 6, 6, 6, 80.25),
	(7, 7, 7, 7, 700.00),
	(8, 8, 8, 8, 300.00),
	(9, 9, 9, 9, 50.00),
	(10, 10, 10, 10, 75.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
