-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2024 a las 19:59:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `newdreams`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ADMINISTRADOR` (IN `p_idAdministrador` INT)   BEGIN
    DELETE FROM Administrador
    WHERE idAdministrador = p_idAdministrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CLIENTE` (IN `p_idCliente` CHAR(5))   BEGIN
    DELETE FROM Cliente
    WHERE idCliente = p_idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5))   BEGIN
    DELETE FROM Comprobante
    WHERE No_Comprobante = p_No_Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_COTIZANCION` (IN `p_No_Cotizacion` CHAR(7))   BEGIN
    DELETE FROM Cotización
    WHERE No_Cotizacion = p_No_Cotizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45))   BEGIN
    UPDATE Cotizante
    SET Deleted = 1
    WHERE Correo_Cotizante = p_Correo_Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ENCUESTA` (IN `p_idEncuesta` INT)   BEGIN
    DELETE FROM Encuesta
    WHERE idEncuesta = p_idEncuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_EVENTO` (IN `p_idEvento` INT)   BEGIN
    DELETE FROM Evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_PAGOS` (IN `p_No_Pagos` CHAR(5))   BEGIN
    DELETE FROM Pagos
    WHERE No_Pagos = p_No_Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_SERVICIO` (IN `p_idServicio` CHAR(4))   BEGIN
    UPDATE Servicio
    SET Deleted = 1
    WHERE idServicio = p_idServicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ADMINISTRADOR` (IN `p_idAdministrador` INT, IN `p_Correo_Admin` VARCHAR(45), IN `p_Contraseña_admin` VARCHAR(45))   BEGIN
    INSERT INTO Administrador (idAdministrador, Correo_Admin, Contraseña_admin)
    VALUES (p_idAdministrador, p_Correo_Admin, p_Contraseña_admin);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_CLIENTE` (IN `p_Contraseña_Cliente` VARCHAR(60), IN `p_Correo_cotizante` VARCHAR(45))   BEGIN
    INSERT INTO Cliente (Contraseña_Cliente, Correo_cotizante)
    VALUES (p_Contraseña_Cliente, p_Correo_cotizante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5), IN `p_Fecha_hora_comprobante` DATETIME, IN `p_Valor_Comprobante` INT, IN `p_Pagos_No_Pagos` CHAR(5), IN `p_Pagos_Evento_idEvento` INT, IN `p_Pagos_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Comprobante (No_Comprobante, Fecha_hora_comprobante, Valor_Comprobante, Pagos_No_Pagos, Pagos_Evento_idEvento, Pagos_Evento_Cliente_idCliente)
    VALUES (p_No_Comprobante, p_Fecha_hora_comprobante, p_Valor_Comprobante, p_Pagos_No_Pagos, p_Pagos_Evento_idEvento, p_Pagos_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COTIZACION` (IN `p_Tipo_Cotizacion` VARCHAR(40), IN `p_Ubicacion` VARCHAR(200), IN `p_Fecha_Parcial_Evento_Cotizacion` DATETIME, IN `p_Fecha_Hora_Cotizacion` DATETIME, IN `p_Valor_Cotizacion` INT, IN `p_Cantidad_Personas_Cotizacion` SMALLINT, IN `p_Cotizante_Correo` VARCHAR(45))   BEGIN
    INSERT INTO Cotización (Tipo_Cotizacion, Ubicacion, Fecha_Parcial_Evento_Cotización, Fecha_Hora_Cotizacion, Valor_Cotización, Cantidad_Personas_Cotización, Cotizante_Correo)
    VALUES (p_Tipo_Cotizacion, p_Ubicacion, p_Fecha_Parcial_Evento_Cotizacion, p_Fecha_Hora_Cotizacion, p_Valor_Cotizacion, p_Cantidad_Personas_Cotizacion, p_Cotizante_Correo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COTIZACIONSERVICIO` (IN `p_NoCotizacion` CHAR(10), IN `p_IdServicio` CHAR(4), IN `p_CantidadServicios` INT, IN `p_ValorServicio` INT)   BEGIN
    INSERT INTO cotizacion_servicio (Cotizacion_No_Cotizacion, Servicio_idServicio, Cantidad_Servicios, Valor_Servicio)
    VALUES (p_NoCotizacion, p_IdServicio, p_CantidadServicios, p_ValorServicio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45), IN `p_Nombre_Cotizante` VARCHAR(45), IN `p_Apellido_Cotizante` VARCHAR(45), IN `p_Telefono_Cotizante` VARCHAR(45))   BEGIN
    INSERT INTO Cotizante (Correo_Cotizante, Nombre_Cotizante, Apellido_Cotizante, Telefono_Cotizante)
    VALUES (p_Correo_Cotizante, p_Nombre_Cotizante, p_Apellido_Cotizante, p_Telefono_Cotizante);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ENCUESTA` (IN `p_idEncuesta` INT, IN `p_Correo_Encuesta` VARCHAR(45), IN `p_Nombre_encuesta` VARCHAR(45), IN `p_Tipo_evento_encuesta` VARCHAR(45), IN `p_Satisfaccion_encuesta` INT, IN `p_Evento_idEvento` INT, IN `p_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Encuesta (idEncuesta, Correo_Encuesta, Nombre_encuesta, Tipo_evento_encuesta, Satisfaccion_encuesta, Evento_idEvento, Evento_Cliente_idCliente)
    VALUES (p_idEncuesta, p_Correo_Encuesta, p_Nombre_encuesta, p_Tipo_evento_encuesta, p_Satisfaccion_encuesta, p_Evento_idEvento, p_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_EVENTO` (IN `p_Tipo_evento` VARCHAR(45), IN `p_Valor_evento` INT, IN `p_Fecha_evento` DATETIME, IN `p_Estado_evento` VARCHAR(45), IN `p_Tematica_evento` VARCHAR(45), IN `p_Descripcion_evento` VARCHAR(200), IN `p_Administrador_idAdministrador` INT, IN `p_Cotizacion_No_Cotizacion` CHAR(7), IN `p_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Evento (Tipo_evento, Valor_evento, Fecha_evento, Estado_evento, Tematica_evento, Descripcion_evento, Administrador_idAdministrador, Cotizacion_No_Cotizacion, Cliente_idCliente)
    VALUES (p_Tipo_evento, p_Valor_evento, p_Fecha_evento, p_Estado_evento, p_Tematica_evento, p_Descripcion_evento, p_Administrador_idAdministrador, p_Cotizacion_No_Cotizacion, p_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_EVENTOSERVICIO` (IN `p_IdEvento` INT, IN `p_IdServicio` CHAR(4), IN `p_CantidadServicios` INT, IN `p_ValorTotal` INT)   BEGIN
    INSERT INTO evento_servicio (Evento_idEvento, Servicio_idServicio, Cantidad_Servicios, Valor_Total)
    VALUES (p_IdEvento, p_IdServicio, p_CantidadServicios, p_ValorTotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PAGOS` (IN `p_No_Pagos` CHAR(5), IN `p_Nombre_Pagos` VARCHAR(45), IN `p_Apellido_Pagos` VARCHAR(45), IN `p_Dia_hora_pagos` DATETIME, IN `p_Valor_pagos` INT, IN `p_Evento_idEvento` INT, IN `p_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Pagos (No_Pagos, Nombre_Pagos, Apellido_Pagos, Dia_hora_pagos, Valor_pagos, Evento_idEvento, Evento_Cliente_idCliente)
    VALUES (p_No_Pagos, p_Nombre_Pagos, p_Apellido_Pagos, p_Dia_hora_pagos, p_Valor_pagos, p_Evento_idEvento, p_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SERVICIO` (IN `p_Nombre_servicio` VARCHAR(100), IN `p_Valor_servicio` INT, IN `p_Tipo_servicio` VARCHAR(45))   BEGIN
    INSERT INTO Servicio (Valor_Servicio, Tipo_Servicio, Nombre_Servicio)
    VALUES (p_Valor_servicio, p_Tipo_servicio, p_Nombre_servicio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_ADMINISTRADOR` ()   BEGIN
    SELECT *
    FROM Administrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_CLIENTE` ()   BEGIN
    SELECT *
    FROM Cliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_COMPROBANTE` ()   BEGIN
    SELECT *
    FROM Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_COTIZACION` ()   BEGIN
    SELECT *
    FROM Cotización;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_COTIZANTE` ()   BEGIN
    SELECT * 
    FROM cotizante 
    WHERE cliente = 0 AND Deleted = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_ENCUESTA` ()   BEGIN
    SELECT *
    FROM Encuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_EVENTO` ()   BEGIN
    SELECT *
    FROM Evento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_PAGOS` ()   BEGIN
    SELECT *
    FROM Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READLIST_SERVICIO` ()   BEGIN
    SELECT *
    FROM Servicio
    WHERE Deleted = 0
    ORDER BY idServicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ADMINISTRADOR` (IN `p_idAdministrador` INT)   BEGIN
    SELECT *
    FROM Administrador
    WHERE idAdministrador = p_idAdministrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_CLIENTE` (IN `p_idCliente` CHAR(5))   BEGIN
    SELECT cl.idCliente, co.Nombre_Cotizante, co.Apellido_Cotizante, co.Telefono_Cotizante, cl.Correo_cotizante
    FROM Cliente cl
    JOIN Cotizante co ON cl.Correo_cotizante = co.Correo_Cotizante
    WHERE cl.idCliente = p_idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5))   BEGIN
    SELECT *
    FROM Comprobante
    WHERE No_Comprobante = p_No_Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_COTIZACION` (IN `p_No_Cotizacion` CHAR(7))   BEGIN
    SELECT *
    FROM Cotización
    WHERE No_Cotizacion = p_No_Cotizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45))   BEGIN
    SELECT *
    FROM Cotizante
    WHERE Correo_Cotizante = p_Correo_Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_ENCUESTA` (IN `p_idEncuesta` INT)   BEGIN
    SELECT *
    FROM Encuesta
    WHERE idEncuesta = p_idEncuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_EVENTO` (IN `p_idEvento` INT)   BEGIN
    SELECT *
    FROM Evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_PAGOS` (IN `p_No_Pagos` CHAR(5))   BEGIN
    SELECT *
    FROM Pagos
    WHERE No_Pagos = p_No_Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_READ_SERVICIO` (IN `p_idServicio` CHAR(4))   BEGIN
    SELECT *
    FROM Servicio
    WHERE idServicio = p_idServicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ADMINISTRADOR` (IN `p_idAdministrador` INT, IN `p_Correo_Admin` VARCHAR(45), IN `p_Contraseña_admin` VARCHAR(45))   BEGIN
    UPDATE Administrador
    SET Correo_Admin = p_Correo_Admin,
        Contraseña_admin = p_Contraseña_admin
    WHERE idAdministrador = p_idAdministrador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CLIENTE` (IN `p_idCliente` CHAR(5), IN `p_Contraseña_Cliente` VARCHAR(45), IN `p_Correo_cotizante` VARCHAR(45))   BEGIN
    UPDATE Cliente
    SET Contraseña_Cliente = p_Contraseña_Cliente, Correo_cotizante = p_Correo_cotizante
    WHERE idCliente = p_idCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CLIENTE_INTO_COTIZANTE` ()   BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE correo_cotizante_val VARCHAR(45);
    DECLARE cur CURSOR FOR SELECT Correo_Cotizante FROM cotizante;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    cotizante_loop: LOOP
        FETCH cur INTO correo_cotizante_val;
        IF done THEN
            LEAVE cotizante_loop;
        END IF;
        
        IF EXISTS (SELECT 1 FROM cliente WHERE Correo_cotizante = correo_cotizante_val) THEN
            UPDATE cotizante SET Cliente = 1 WHERE Correo_Cotizante = correo_cotizante_val;
        END IF;
    END LOOP;
    CLOSE cur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_COMPROBANTE` (IN `p_No_Comprobante` CHAR(5), IN `p_Fecha_hora_comprobante` DATETIME, IN `p_Valor_Comprobante` INT)   BEGIN
    UPDATE Comprobante
    SET Fecha_hora_comprobante = p_Fecha_hora_comprobante,
        Valor_Comprobante = p_Valor_Comprobante
    WHERE No_Comprobante = p_No_Comprobante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_COTIZACION` (IN `p_No_Cotizacion` CHAR(7), IN `p_Tipo_Cotizacion` VARCHAR(40), IN `p_Ubicacion` VARCHAR(45), IN `p_Fecha_Parcial_Evento_Cotizacion` DATETIME, IN `p_Valor_Cotizacion` INT, IN `p_Cantidad_Personas_Cotizacion` SMALLINT, IN `p_Cotizante_Correo` VARCHAR(45))   BEGIN
    UPDATE Cotización
    SET Tipo_Cotizacion = p_Tipo_Cotizacion,
    	Ubicacion = p_Ubicacion,
        Fecha_Parcial_Evento_Cotización = p_Fecha_Parcial_Evento_Cotizacion,
        Valor_Cotización = p_Valor_Cotizacion,
        Cantidad_Personas_Cotización = p_Cantidad_Personas_Cotizacion,
        Cotizante_Correo = p_Cotizante_Correo
    WHERE No_Cotizacion = p_No_Cotizacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_COTIZANTE` (IN `p_Correo_Cotizante` VARCHAR(45), IN `p_Nombre_Cotizante` VARCHAR(45), IN `p_Apellido_Cotizante` VARCHAR(45), IN `p_Telefono_Cotizante` VARCHAR(45))   BEGIN
    UPDATE Cotizante
    SET Correo_Cotizante = p_Correo_Cotizante,
        Nombre_Cotizante = p_Nombre_Cotizante,
        Apellido_Cotizante = p_Apellido_Cotizante,
        Telefono_Cotizante = p_Telefono_Cotizante
    WHERE Correo_Cotizante = p_Correo_Cotizante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ENCUESTA` (IN `p_idEncuesta` INT, IN `p_Correo_Encuesta` VARCHAR(45), IN `p_Nombre_encuesta` VARCHAR(45), IN `p_Tipo_evento_encuesta` VARCHAR(45), IN `p_Satisfaccion_encuesta` INT)   BEGIN
    UPDATE Encuesta
    SET Correo_Encuesta = p_Correo_Encuesta,
        Nombre_encuesta = p_Nombre_encuesta,
        Tipo_evento_encuesta = p_Tipo_evento_encuesta,
        Satisfaccion_encuesta = p_Satisfaccion_encuesta
    WHERE idEncuesta = p_idEncuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_EVENTO` (IN `p_idEvento` INT, IN `p_Tipo_evento` VARCHAR(45), IN `p_Valor_evento` INT, IN `p_Fecha_evento` DATETIME, IN `p_Estado_evento` VARCHAR(45), IN `p_Tematica_evento` VARCHAR(45), IN `p_Descripcion_evento` VARCHAR(200))   BEGIN
    UPDATE Evento
    SET Tipo_evento = p_Tipo_evento,
        Valor_evento = p_Valor_evento,
        Fecha_evento = p_Fecha_evento,
        Estado_evento = p_Estado_evento,
        Tematica_evento = p_Tematica_evento,
        Descripcion_evento = p_Descripcion_evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PAGOS` (IN `p_No_Pagos` CHAR(5), IN `p_Nombre_Pagos` VARCHAR(45), IN `p_Apellido_Pagos` VARCHAR(45), IN `p_Dia_hora_pagos` DATETIME, IN `p_Valor_pagos` INT)   BEGIN
    UPDATE Pagos
    SET Nombre_Pagos = p_Nombre_Pagos,
        Apellido_Pagos = p_Apellido_Pagos,
        Dia_hora_pagos = p_Dia_hora_pagos,
        Valor_pagos = p_Valor_pagos
    WHERE No_Pagos = p_No_Pagos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_SERVICIO` (IN `p_idServicio` CHAR(4), IN `p_Valor_servicio` INT, IN `p_Tipo_servicio` VARCHAR(45), IN `p_Nombre_servicio` VARCHAR(100))   BEGIN
    UPDATE Servicio
    SET Valor_servicio = p_Valor_servicio,
    	Nombre_servicio = p_Nombre_servicio,
        Tipo_servicio = p_Tipo_servicio
    WHERE idServicio = p_idServicio;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `Correo_Admin` varchar(45) NOT NULL,
  `Contraseña_admin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `Correo_Admin`, `Contraseña_admin`) VALUES
(1, 'juliansanabria@gmail.com', 'newdreams001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` char(5) NOT NULL,
  `Estado_Cliente` varchar(20) NOT NULL,
  `Contraseña_Cliente` varchar(60) NOT NULL,
  `Correo_cotizante` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Estado_Cliente`, `Contraseña_Cliente`, `Correo_cotizante`) VALUES
('CL001', 'Habilitado', 'abc123', 'pepitoperez@gmail.com'),
('CL002', 'Habilitado', 'añlm5nv4o5cd', 'mariamartinez@gmail.com'),
('CL003', 'Inhabilitado', 'd28v5f4f', 'mauriciotorres@gmail.com'),
('CL004', 'Inhabilitado', 'd2fg6f9d8Ee', 'valentinapaez@gmail.com'),
('CL005', 'Habilitado', 'EFrfg3548eD54', 'santiagocastellanos@gmail.com'),
('CL014', 'Habilitado', '1345', 'mariamartinez2@gmail.com'),
('CL015', 'Habilitado', '$2a$10$gYV1SDZZnKNJlHYjZ5TMzuPh6UWnZd9wNYNiklHUX.aBtvZL4X726', 'dfelipebr737@gmail.com'),
('CL016', 'Inhabilitado', '123asc', 'andresmartinez@gmail.com'),
('CL017', 'Habilitado', 'hol12', 'alfrecas@mail.com'),
('CL018', 'Habilitado', 'cba321', 'Angelica@mail.com'),
('CL019', 'Habilitado', 'holajiji', 'edilson@mail.com'),
('CL020', 'Habilitado', '123', 'DanielGa@mail.com'),
('CL021', 'Habilitado', 'holajiji1', 'franro@gmail.com'),
('CL022', 'Habilitado', 'harry32', 'harrilo@mail.com'),
('CL023', 'Habilitado', 'gua32', 'Dana@mail.com'),
('CL024', 'Habilitado', '123', 'estefania@mail.com'),
('CL025', 'Habilitado', '$2a$10$RL1gAnCh/B8ntu9t0YIfeu.2bFnbn5K7/Pu68Z4xmunWMxxcTFOBy', 'Kevinsa@mail.com'),
('CL026', 'Habilitado', '$2a$10$WCuL7tvaxoDnIG5qK2hREeyvc0oTA0NqjN/2LS8r3Wvebq3JhseqO', 'Juliomar@mail.com'),
('CL027', 'Habilitado', '$2a$10$NzuHfnAZU9HDbgq.Mur0HO84v8GG45Rkbap70cA4DoSqeLNRMLyjy', 'kevinsanty@mail.com'),
('CL028', 'Habilitado', '$2a$10$D.Uc4R.x5Z2FkIefagqNiuuLVxrvAwUVEOECTYs7TtbZYfUReKgHm', 'Alfonso@mail.com'),
('CL029', 'Habilitado', '$2a$10$Vfx7cuBlIQvSQANiMzvAd.hpssSodwWDZ1IHTreklgE/oyZQiqnli', 'alfsan@gmail.com');

--
-- Disparadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `trg_establecer_estadoCliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    IF NEW.Estado_Cliente IS NULL OR NEW.Estado_Cliente = '' THEN
        SET NEW.Estado_Cliente = 'Habilitado';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_generate_idCliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_id INT;

    -- Obtiene el último número de cliente insertado
    SELECT SUBSTRING(idCliente, 3) INTO last_id
    FROM cliente
    ORDER BY idCliente DESC
    LIMIT 1;

    -- Si no hay registros, asigna el valor inicial
    IF last_id IS NULL THEN
        SET new_id = 1;
    ELSE
        SET new_id = last_id + 1;
    END IF;

    -- Formatea el nuevo id con el prefijo "CL" y el número incrementado
    SET NEW.idCliente = CONCAT('CL', LPAD(new_id, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `No_Comprobante` char(5) NOT NULL,
  `Fecha_hora_comprobante` datetime NOT NULL,
  `Valor_Comprobante` int(11) NOT NULL,
  `Pagos_No_Pagos` char(5) NOT NULL,
  `Pagos_Evento_idEvento` int(11) NOT NULL,
  `Pagos_Evento_Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`No_Comprobante`, `Fecha_hora_comprobante`, `Valor_Comprobante`, `Pagos_No_Pagos`, `Pagos_Evento_idEvento`, `Pagos_Evento_Cliente_idCliente`) VALUES
('C01', '2023-10-25 10:30:00', 5500000, 'P0001', 1, 'CL001'),
('C02', '2024-06-23 06:00:00', 7000000, 'P0002', 2, 'CL002'),
('C03', '2024-02-03 02:00:00', 3000000, 'P0003', 3, 'CL003'),
('C04', '2023-07-28 10:15:00', 2500000, 'P0004', 4, 'CL004'),
('C05', '2023-08-02 02:30:00', 4500000, 'P0005', 5, 'CL005');

--
-- Disparadores `comprobante`
--
DELIMITER $$
CREATE TRIGGER `trg_generate_No_Comprobante` BEFORE INSERT ON `comprobante` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_id INT;

    -- Obtiene el último número de comprobante insertado
    SELECT SUBSTRING(No_Comprobante, 2) INTO last_id
    FROM comprobante
    ORDER BY No_Comprobante DESC
    LIMIT 1;

    -- Si no hay registros, asigna el valor inicial
    IF last_id IS NULL THEN
        SET new_id = 1;
    ELSE
        SET new_id = last_id + 1;
    END IF;

    -- Formatea el nuevo número de comprobante con el prefijo "C" y el número incrementado
    SET NEW.No_Comprobante = CONCAT('C', LPAD(new_id, 4, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_servicio`
--

CREATE TABLE `cotizacion_servicio` (
  `Cotizacion_No_Cotizacion` char(7) NOT NULL,
  `Servicio_idServicio` char(4) NOT NULL,
  `Cantidad_Servicios` int(11) NOT NULL,
  `Valor_Servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizacion_servicio`
--

INSERT INTO `cotizacion_servicio` (`Cotizacion_No_Cotizacion`, `Servicio_idServicio`, `Cantidad_Servicios`, `Valor_Servicio`) VALUES
('COT1001', 'S01', 0, 0),
('COT1001', 'S02', 0, 0),
('COT1001', 'S03', 0, 0),
('COT1001', 'S04', 10, 120000),
('COT1006', 'S06', 10, 12000),
('COT1006', 'S05', 10, 1200),
('COT1016', 'S01', 10, 70000),
('COT1016', 'S03', 10, 35000),
('COT1016', 'S05', 10, 100000),
('COT1016', 'S07', 10, 12000),
('COT1016', 'S15', 10, 600000),
('COT1017', 'S01', 10, 70000),
('COT1017', 'S03', 10, 35000),
('COT1017', 'S05', 10, 100000),
('COT1017', 'S07', 10, 12000),
('COT1017', 'S20', 100, 100000),
('COT1018', 'S01', 3, 21000),
('COT1018', 'S03', 30, 105000),
('COT1018', 'S05', 3, 30000),
('COT1018', 'S07', 30, 36000),
('COT1018', 'S20', 30, 30000),
('COT1019', 'S01', 2, 14000),
('COT1019', 'S03', 20, 70000),
('COT1019', 'S05', 2, 20000),
('COT1019', 'S07', 20, 24000),
('COT1019', 'S13', 2, 90000),
('COT1019', 'S20', 30, 30000),
('COT1020', 'S07', 30, 36000),
('COT1020', 'S20', 30, 30000),
('COT1021', 'S01', 10, 70000),
('COT1021', 'S03', 10, 35000),
('COT1021', 'S05', 10, 100000),
('COT1021', 'S07', 10, 12000),
('COT1021', 'S20', 30, 30000),
('COT1022', 'S01', 10, 70000),
('COT1022', 'S03', 10, 35000),
('COT1022', 'S05', 10, 100000),
('COT1022', 'S07', 10, 12000),
('COT1022', 'S13', 10, 450000),
('COT1022', 'S20', 30, 30000),
('COT1023', 'S01', 10, 70000),
('COT1023', 'S03', 10, 35000),
('COT1023', 'S05', 10, 100000),
('COT1023', 'S07', 10, 12000),
('COT1023', 'S20', 30, 30000),
('COT1024', 'S01', 10, 70000),
('COT1024', 'S03', 10, 35000),
('COT1024', 'S05', 10, 100000),
('COT1024', 'S07', 10, 12000),
('COT1024', 'S20', 30, 30000),
('COT1025', 'S01', 10, 70000),
('COT1025', 'S03', 10, 35000),
('COT1025', 'S05', 10, 100000),
('COT1025', 'S07', 10, 12000),
('COT1025', 'S15', 5, 300000),
('COT1025', 'S16', 2, 4000),
('COT1025', 'S20', 100, 100000),
('COT1026', 'S01', 10, 70000),
('COT1026', 'S03', 10, 35000),
('COT1026', 'S05', 10, 100000),
('COT1026', 'S07', 10, 12000),
('COT1026', 'S20', 30, 30000),
('COT1019', 'S09', 0, 0),
('COT1019', 'S16', 0, 0),
('COT1020', 'S09', 0, 0),
('COT1020', 'S10', 0, 0),
('COT1022', 'S13', 0, 0),
('COT1022', 'S16', 0, 0),
('COT1023', 'S04', 0, 0),
('COT1022', 'S18', 0, 0),
('COT1022', 'S15', 0, 0),
('COT1021', 'S12', 2, 90000),
('COT1021', 'S13', 5, 225000),
('COT1021', 'S16', 1, 2000),
('COT1021', 'S04', 10, 120000),
('COT1020', 'S11', 0, 0),
('COT1020', 'S18', 0, 0),
('COT1020', 'S20', 0, 0),
('COT1016', 'S12', 0, 0),
('COT1016', 'S20', 30, 30000),
('COT1019', 'S12', 0, 0),
('COT1027', 'S01', 10, 70000),
('COT1027', 'S03', 10, 35000),
('COT1027', 'S05', 10, 100000),
('COT1027', 'S07', 10, 12000),
('COT1028', 'S01', 10, 70000),
('COT1028', 'S03', 10, 35000),
('COT1028', 'S05', 10, 100000),
('COT1028', 'S07', 10, 12000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotización`
--

CREATE TABLE `cotización` (
  `No_Cotizacion` char(7) NOT NULL,
  `Tipo_Cotizacion` varchar(40) NOT NULL,
  `Ubicacion` varchar(200) NOT NULL,
  `Fecha_Parcial_Evento_Cotización` datetime NOT NULL,
  `Fecha_Hora_Cotizacion` datetime NOT NULL,
  `Valor_Cotización` int(11) NOT NULL,
  `Cantidad_Personas_Cotización` smallint(6) NOT NULL,
  `Cotizante_Correo` varchar(45) NOT NULL,
  `Deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotización`
--

INSERT INTO `cotización` (`No_Cotizacion`, `Tipo_Cotizacion`, `Ubicacion`, `Fecha_Parcial_Evento_Cotización`, `Fecha_Hora_Cotizacion`, `Valor_Cotización`, `Cantidad_Personas_Cotización`, `Cotizante_Correo`, `Deleted`) VALUES
('COT1001', 'Xv años', 'Salon comunal kennedy', '2023-10-20 08:00:00', '2023-06-15 02:54:00', 5000000, 100, 'mauriciotorres@gmail.com', 1),
('COT1002', 'Grado', 'Salon comunal bella vista', '2024-06-23 06:00:00', '2023-04-18 03:35:00', 7000000, 150, 'pepitoperez@gmail.com', 0),
('COT1003', 'Boda', 'Salon comunal perseverancia', '2024-02-03 02:00:00', '2023-05-01 08:00:00', 3500000, 80, 'valentinapaez@gmail.com', 0),
('COT1004', 'Bautizo', 'Salon comunal puente aranda', '2023-07-15 07:30:00', '2023-07-28 10:15:00', 2500000, 70, 'santiagocastellanos@gmail.com', 0),
('COT1005', 'Xv años', 'Salon comunal bosa', '2023-12-30 12:45:00', '2023-08-02 02:30:00', 4500000, 80, 'mauriciotorres@gmail.com', 0),
('COT1006', 'Reunion Empresarial', 'Centro empresarial', '2024-06-27 16:30:00', '2024-05-16 16:32:52', 5000000, 30, 'alfsan@gmail.com', 0),
('COT1016', 'Comunion', 'La empresa buscarÃÂÃÂ¡ el lugar del evento', '2024-07-07 17:30:00', '2024-05-08 16:33:00', 937000, 30, 'loreber@mail.com', 0),
('COT1017', 'XV aÃ±os', 'La empresa buscarÃ¡ el lugar del evento', '2024-07-31 17:30:00', '2024-05-08 16:50:00', 1162000, 70, 'Zharick@mail.com', 1),
('COT1018', '', 'Kennedy, Carrera 30 calle 19, Roma', '2024-06-21 16:00:00', '2024-05-08 16:55:00', 222000, 30, 'DanielGa@mail.com', 0),
('COT1019', 'Bautizo', 'Salon comunal, Cra 81 h 76F 15, Bosa', '2024-07-11 18:30:00', '2024-05-08 17:07:00', 248000, 20, 'alfrecas@mail.com', 0),
('COT1020', 'Comunion', 'Mi casita', '2024-07-20 16:00:00', '2024-05-09 18:19:00', 566000, 50, 'Dana@mail.com', 0),
('COT1021', 'Bautizo', 'La empresa buscarÃÂÃÂ¡ el lugar del evento', '2024-06-21 14:00:00', '2024-05-09 18:31:00', 684000, 30, 'Oreo@mail.com', 0),
('COT1022', 'Boda', 'Salon comunal soacha', '2024-08-20 17:30:00', '2024-05-09 18:32:00', 1147000, 30, 'tom@mail.com', 0),
('COT1023', 'XVaÃ±os', 'La empresa buscará el lugar del evento', '2024-07-27 20:30:00', '2024-05-09 19:00:00', 247000, 100, 'reamm@mail.com', 0),
('COT1024', 'Grado', 'La empresa buscará el lugar del evento', '2024-06-20 20:30:00', '2024-05-09 19:07:00', 247000, 100, 'weekend@mail.co', 0),
('COT1025', 'XVaÃ±os', 'Salon comunal, Cra 81 h 76F 15, Bosa', '2024-07-27 18:30:00', '2024-05-15 12:19:00', 621000, 100, 'guillermoisa@mail.com', 0),
('COT1026', 'XVaÃ±os', 'La empresa buscará el lugar del evento', '2024-07-20 20:30:00', '2024-05-20 12:53:00', 247000, 30, 'estefania@mail.com', 0),
('COT1027', 'Grado', 'La empresa buscará el lugar del evento', '2025-01-05 17:30:00', '2024-05-27 15:52:00', 442000, 100, 'Yolgei@mail.com', 0),
('COT1028', 'XVaÃ±os', 'La empresa buscará el lugar del evento', '2024-06-26 17:30:00', '2024-05-27 16:01:00', 442000, 30, 'edwin@mail.com', 0);

--
-- Disparadores `cotización`
--
DELIMITER $$
CREATE TRIGGER `trg_generate_No_Cotizacion` BEFORE INSERT ON `cotización` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_id INT;

    -- Obtiene el último número de cotización insertado
    SELECT SUBSTRING(No_Cotizacion, 4) INTO last_id
    FROM cotización
    ORDER BY No_Cotizacion DESC
    LIMIT 1;

    -- Si no hay registros, asigna el valor inicial
    IF last_id IS NULL THEN
        SET new_id = 1;
    ELSE
        SET new_id = last_id + 1;
    END IF;

    -- Formatea el nuevo número de cotización con el prefijo "COT" y el número incrementado
    SET NEW.No_Cotizacion = CONCAT('COT', LPAD(new_id, 4, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizante`
--

CREATE TABLE `cotizante` (
  `Correo_Cotizante` varchar(45) NOT NULL,
  `Nombre_Cotizante` varchar(45) NOT NULL,
  `Apellido_Cotizante` varchar(45) NOT NULL,
  `Telefono_Cotizante` varchar(45) NOT NULL,
  `Cliente` tinyint(1) NOT NULL,
  `Deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizante`
--

INSERT INTO `cotizante` (`Correo_Cotizante`, `Nombre_Cotizante`, `Apellido_Cotizante`, `Telefono_Cotizante`, `Cliente`, `Deleted`) VALUES
('Alfonso@mail.com', 'Alfonso', 'Lopez', '874512', 1, 0),
('alfrecas@mail.com', 'Alfredo', 'Castro', '875421', 1, 0),
('alfsan@gmail.com', 'Alfonso', 'Sanchez Morales', '3213950191', 1, 0),
('andresmartinez@gmail.com', 'Andres', 'Martinez', '3112104578', 1, 0),
('Angelica@mail.com', 'Angelica', 'Martinez', '9884512', 1, 0),
('angesu@mail.com', 'Angelica', 'Suarez', '120354', 0, 0),
('Dana@mail.com', 'Dana Marcela', 'Cespedes Triana', '4505', 1, 0),
('DanielGa@mail.com', 'Daniel Mauricio', 'Chambo Gaviria', '3202114578', 1, 0),
('dfelipebr737@gmail.com', 'Felipe', 'Bernal Rodriguez', '3112711553', 1, 0),
('edilson@mail.com', 'Edilson', 'Maecha', '986532', 1, 0),
('edwin@mail.com', 'Edwin', 'Santos', '98653214', 0, 1),
('estefania@mail.com', 'Estefania', 'Gavaria', '3112065487', 1, 0),
('Felipe@mail.com', 'Felipe', 'Rodriguez', '895623', 0, 0),
('franro@gmail.com', 'Francisco', 'Rojas Rey', '012345', 1, 0),
('franro@htomail.com', 'Francisco', 'Rojas', '0321457', 0, 0),
('Guillermo@mail.com', 'Guillermo', 'Camacho', '789632', 0, 0),
('guillermoisa@mail.com', 'Guillermo', 'Izasa', '875432', 0, 0),
('harrilo@mail.com', 'Harrison ', 'Lopez', '985421', 1, 0),
('Javier@mail.com', 'Javier', 'Rodriguez', '78523', 0, 0),
('Juliomar@mail.com', 'Julio', 'Martinez', '1230', 1, 0),
('Kevinsa@mail.com', 'Kevin', 'Salazar', '784512', 1, 0),
('kevinsanty@mail.com', 'Kevin Santiago', 'Gonzalez Romero', '3112458975', 1, 0),
('loreber@mail.com', 'Daiyan Lorena', 'Berrio', '3112754521', 0, 0),
('mariamartinez2@gmail.com', 'maria', 'martinez', '12345', 1, 0),
('mariamartinez@gmail.com', 'Maria', 'Martinez', '3224532545', 1, 0),
('mauriciotorres@gmail.com', 'Mauricio', 'Torres', '3229851236', 1, 0),
('Oreo@mail.com', 'Oreo', 'Rodriguez', '875432', 0, 0),
('pepitoperez@gmail.com', 'Pepito', 'Perez', '3224569875', 1, 0),
('reamm@mail.com', 'Ramm', 'Einstein', '10325', 0, 0),
('santiagocastellanos@gmail.com', 'Santiago', 'Castellanos', '3112365478', 1, 0),
('tom@mail.com', 'tom marvolo', 'holland', '3114758965', 0, 0),
('valentinapaez@gmail.com', 'Valentina', 'Paez', '3102548965', 1, 0),
('vivian@mail.com', 'Vivian', 'Hincapie', '87541', 0, 0),
('weekend@mail.co', 'Weekend', 'Testaye', '876532', 0, 0),
('Yolgei@mail.com', 'Yolgei', 'Bacca', '3112547470', 0, 0),
('Zharick@mail.com', 'Zharick', 'Serna', '875421', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL,
  `Correo_Encuesta` varchar(45) NOT NULL,
  `Nombre_encuesta` varchar(45) NOT NULL,
  `Tipo_evento_encuesta` varchar(45) NOT NULL,
  `Satisfaccion_encuesta` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `Evento_Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`idEncuesta`, `Correo_Encuesta`, `Nombre_encuesta`, `Tipo_evento_encuesta`, `Satisfaccion_encuesta`, `Evento_idEvento`, `Evento_Cliente_idCliente`) VALUES
(1, 'mauriciotorres@gmail.com', 'Mauricio', 'Xv años', 10, 1, 'CL001'),
(2, 'pepitoperez@gmail.com', 'Pepito', 'Grado', 10, 2, 'CL002'),
(3, 'valentinapaez@gmail.com', 'Valentina', 'Boda', 10, 3, 'CL003'),
(4, 'santiagocastellanos@gmail.com', 'Santiago', 'Bautizo', 10, 4, 'CL004'),
(5, 'mauriciotorres@gmail.com', 'Mauricio', 'Xv años', 10, 5, 'CL005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `Tipo_evento` varchar(45) NOT NULL,
  `Valor_evento` int(11) NOT NULL,
  `Fecha_evento` datetime NOT NULL,
  `Estado_evento` varchar(45) NOT NULL,
  `Tematica_evento` varchar(45) NOT NULL,
  `Descripcion_evento` varchar(200) NOT NULL,
  `Administrador_idAdministrador` int(11) NOT NULL,
  `Cotizacion_No_Cotizacion` char(7) NOT NULL,
  `Cliente_idCliente` char(5) NOT NULL,
  `Precio_Final` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `Tipo_evento`, `Valor_evento`, `Fecha_evento`, `Estado_evento`, `Tematica_evento`, `Descripcion_evento`, `Administrador_idAdministrador`, `Cotizacion_No_Cotizacion`, `Cliente_idCliente`, `Precio_Final`) VALUES
(1, 'Xv años', 5500000, '2023-10-25 10:30:00', 'Activo', 'Neon', 'Decoración totalmente neón, centros de mesa con ramosde flores fluorecentes, protocolo clasico, mariachis sorpresa\r\n  intervencion del padre, regalo de la madre, comida, hora loca, bebidas, fin', 1, 'COT1001', 'CL001', 0),
(2, 'Grado', 8000000, '2024-06-23 06:00:00', 'Activo', 'Clasico', 'Graduacion ingeniero aeronautico, ubicado en un avion dentro del hangar del aeropuerto, decoracion clasica, comida basica', 1, 'COT1002', 'CL002', 0),
(3, 'Boda', 3000000, '2024-02-03 02:00:00', 'Activo', 'Color negro', 'Decoracion a blanco y negro, protocolo clasico, regal sorpresa de la familiade la novia', 1, 'COT1003', 'CL003', 0),
(4, 'Bautizo', 2500000, '2023-07-15 07:30:00', 'Activo', 'Clasico', 'Bautizo clasico, comida con 3 carnes y 2 bebidas', 1, 'COT1004', 'CL004', 0),
(5, 'Xv años', 5000000, '2023-12-30 12:45:00', 'Activo', 'Francia', 'Ratatouille con vino añejo', 1, 'COT1005', 'CL005', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento_servicio`
--

CREATE TABLE `evento_servicio` (
  `Evento_idEvento` int(11) NOT NULL,
  `Servicio_idServicio` char(4) NOT NULL,
  `Cantidad_Servicios` int(5) NOT NULL,
  `Valor_Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento_servicio`
--

INSERT INTO `evento_servicio` (`Evento_idEvento`, `Servicio_idServicio`, `Cantidad_Servicios`, `Valor_Total`) VALUES
(1, 'S01', 0, 0),
(1, 'S02', 0, 0),
(1, 'S03', 0, 0),
(1, 'S04', 0, 0),
(1, 'S05', 0, 0),
(2, 'S01', 0, 0),
(2, 'S02', 0, 0),
(2, 'S03', 0, 0),
(2, 'S04', 0, 0),
(3, 'S01', 0, 0),
(3, 'S02', 0, 0),
(3, 'S03', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `No_Pagos` char(5) NOT NULL,
  `Referente` int(5) NOT NULL,
  `Nombre_Pagos` varchar(45) NOT NULL,
  `Apellido_Pagos` varchar(45) NOT NULL,
  `Dia_hora_pagos` datetime NOT NULL,
  `Valor_pagos` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  `Evento_Cliente_idCliente` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`No_Pagos`, `Referente`, `Nombre_Pagos`, `Apellido_Pagos`, `Dia_hora_pagos`, `Valor_pagos`, `Evento_idEvento`, `Evento_Cliente_idCliente`) VALUES
('P0001', 0, 'Mauricio', 'Torres', '2023-10-25 10:30:00', 50000, 1, 'CL001'),
('P0002', 0, 'Pepito', 'Perez', '2024-06-23 06:00:00', 70000, 2, 'CL002'),
('P0003', 0, 'Valentina', 'Paez', '2024-02-03 02:00:00', 30000, 3, 'CL003'),
('P0004', 0, 'Santiago', 'Castellanos', '2023-07-28 10:15:00', 250000, 4, 'CL004'),
('P0005', 0, 'Mauricio', 'Torres', '2023-08-02 02:30:00', 450000, 5, 'CL005'),
('P0006', 1, 'Pepito', 'Perez', '2024-05-20 04:52:00', 50000, 2, 'CL002'),
('P0007', 2, 'Pepito', 'Perez', '2024-05-19 03:30:00', 50000, 2, 'CL002'),
('P0008', 3, 'Pepito', 'Perez', '2024-05-18 03:30:00', 500000, 2, 'CL002');

--
-- Disparadores `pagos`
--
DELIMITER $$
CREATE TRIGGER `actualizar_referente` BEFORE INSERT ON `pagos` FOR EACH ROW BEGIN
    DECLARE max_referente INT;

    -- Obtener el máximo valor de referente para el mismo cliente y evento
    SELECT COALESCE(MAX(Referente), 0)
    INTO max_referente
    FROM pagos
    WHERE Evento_idEvento = NEW.Evento_idEvento
      AND Evento_Cliente_idCliente = NEW.Evento_Cliente_idCliente;

    -- Incrementar el referente para el nuevo pago
    SET NEW.Referente = max_referente + 1;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_generate_No_Pagos` BEFORE INSERT ON `pagos` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_id INT;

    -- Obtiene el último número de pago insertado
    SELECT SUBSTRING(No_Pagos, 2) INTO last_id
    FROM pagos
    ORDER BY No_Pagos DESC
    LIMIT 1;

    -- Si no hay registros, asigna el valor inicial
    IF last_id IS NULL THEN
        SET new_id = 1;
    ELSE
        SET new_id = last_id + 1;
    END IF;

    -- Formatea el nuevo número de pago con el prefijo "P" y el número incrementado
    SET NEW.No_Pagos = CONCAT('P', LPAD(new_id, 4, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` char(4) NOT NULL,
  `Valor_Servicio` int(11) NOT NULL,
  `Nombre_Servicio` varchar(45) NOT NULL,
  `Tipo_Servicio` varchar(40) NOT NULL,
  `Deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `Valor_Servicio`, `Nombre_Servicio`, `Tipo_Servicio`, `Deleted`) VALUES
('S01', 7000, 'Mantel y Tapa Mesa Rectangular', 'Manteleria', 0),
('S02', 15000, 'Mantel y Tapa Mesa Redonda', 'Manteleria', 0),
('S021', 10000, 'Vasos de plastico x30', 'Decoracion', 1),
('S022', 10000, 'Mesa de metal', 'Mesas y sillas', 1),
('S023', 15000, 'Sillas de metal', 'Mesas y sillas', 1),
('S024', 10000, 'Silla de metal', 'Mesas y sillas', 1),
('S03', 3500, 'Forro y Cinta silla', 'Manteleria', 0),
('S04', 12000, 'Faldon', 'Manteleria', 0),
('S05', 10000, 'Mesa Rectangular ', 'Mesas y sillas', 0),
('S06', 15000, 'Mesa Redonda', 'Mesas y Sillas', 0),
('S07', 1200, 'Silla Rimax', 'Mesas y Sillas', 0),
('S08', 5000, 'Silla Tiffani', 'Mesas y Sillas', 0),
('S09', 50000, 'Backing redondo', 'Decoracion', 0),
('S10', 80000, 'Mesas decorativas x3', 'Decoracion', 0),
('S11', 40000, 'Arco de madera cuadrado', 'Decoracion', 0),
('S12', 45000, 'Arco diseno blanco', 'Decoracion', 0),
('S13', 45000, 'Mamparas x3', 'Decoracion', 0),
('S14', 35000, 'Mampara de madera semiredonda', 'Decoracion', 0),
('S15', 60000, 'Cilindros x3', 'Decoracion', 0),
('S16', 2000, 'Base de cristal', 'Decoracion', 0),
('S17', 10000, 'Base dorada de madera', 'Decoracion', 0),
('S18', 12000, 'Base metalica dorada', 'Decoracion', 0),
('S19', 7000, 'Base de metalicos blanca', 'Decoracion', 0),
('S20', 2000, 'Servilleta de tela', 'Decoracion', 0);

--
-- Disparadores `servicio`
--
DELIMITER $$
CREATE TRIGGER `trg_generate_idServicio` BEFORE INSERT ON `servicio` FOR EACH ROW BEGIN
    DECLARE last_id INT;
    DECLARE new_id INT;

    -- Obtiene el último número de servicio insertado
    SELECT COALESCE(MAX(CAST(SUBSTRING(idServicio, 2) AS UNSIGNED)), 0)
    INTO last_id
    FROM servicio;

    -- Incrementa el último ID obtenido
    SET new_id = last_id + 1;

    -- Formatea el nuevo número de servicio con el prefijo "S" y el número incrementado
    SET NEW.idServicio = CONCAT('S', LPAD(new_id, 3, '0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cotizaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_cotizaciones` (
`No_Cotizacion` char(7)
,`Nombre_Cotizante` varchar(45)
,`Apellido_Cotizante` varchar(45)
,`Telefono_Cotizante` varchar(45)
,`Correo_Cotizante` varchar(45)
,`Tipo_Cotizacion` varchar(40)
,`Cantidad_Personas_Cotización` smallint(6)
,`Ubicacion` varchar(200)
,`Fecha_Parcial_Evento_Cotización` datetime
,`Fecha_Hora_Cotizacion` datetime
,`Valor_Cotización` int(11)
,`Deleted` tinyint(1)
,`Servicios` mediumtext
,`Valor_Unitario` mediumtext
,`Cantidad` mediumtext
,`Valor_Total` mediumtext
,`Tipo_Servicio` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_evento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_evento` (
`Nombre_Cotizante` varchar(45)
,`Apellido_Cotizante` varchar(45)
,`Correo_Cotizante` varchar(45)
,`Telefono_Cotizante` varchar(45)
,`idEvento` int(11)
,`Tipo_evento` varchar(45)
,`Fecha_evento` datetime
,`Estado_evento` varchar(45)
,`Descripcion_evento` varchar(200)
,`Cantidad_Personas_Cotización` smallint(6)
,`Nombres_Servicios` mediumtext
,`Valor_Servicios` mediumtext
,`Cantidad` mediumtext
,`Valor_Unitario` mediumtext
,`Tipo_Servicio` mediumtext
,`idCliente` char(5)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cotizaciones`
--
DROP TABLE IF EXISTS `vista_cotizaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cotizaciones`  AS SELECT `cot`.`No_Cotizacion` AS `No_Cotizacion`, `co`.`Nombre_Cotizante` AS `Nombre_Cotizante`, `co`.`Apellido_Cotizante` AS `Apellido_Cotizante`, `co`.`Telefono_Cotizante` AS `Telefono_Cotizante`, `co`.`Correo_Cotizante` AS `Correo_Cotizante`, `cot`.`Tipo_Cotizacion` AS `Tipo_Cotizacion`, `cot`.`Cantidad_Personas_Cotización` AS `Cantidad_Personas_Cotización`, `cot`.`Ubicacion` AS `Ubicacion`, `cot`.`Fecha_Parcial_Evento_Cotización` AS `Fecha_Parcial_Evento_Cotización`, `cot`.`Fecha_Hora_Cotizacion` AS `Fecha_Hora_Cotizacion`, `cot`.`Valor_Cotización` AS `Valor_Cotización`, `cot`.`Deleted` AS `Deleted`, group_concat(`s`.`Nombre_Servicio` separator ', ') AS `Servicios`, group_concat(`s`.`Valor_Servicio` separator ', ') AS `Valor_Unitario`, group_concat(`cots`.`Cantidad_Servicios` separator ', ') AS `Cantidad`, group_concat(`cots`.`Valor_Servicio` separator ', ') AS `Valor_Total`, group_concat(`s`.`Tipo_Servicio` separator ', ') AS `Tipo_Servicio` FROM (((`cotización` `cot` join `cotizacion_servicio` `cots` on(`cot`.`No_Cotizacion` = `cots`.`Cotizacion_No_Cotizacion`)) join `cotizante` `co` on(`co`.`Correo_Cotizante` = `cot`.`Cotizante_Correo`)) join `servicio` `s` on(`s`.`idServicio` = `cots`.`Servicio_idServicio`)) GROUP BY `cot`.`No_Cotizacion` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_evento`
--
DROP TABLE IF EXISTS `vista_evento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_evento`  AS SELECT `c`.`Nombre_Cotizante` AS `Nombre_Cotizante`, `c`.`Apellido_Cotizante` AS `Apellido_Cotizante`, `c`.`Correo_Cotizante` AS `Correo_Cotizante`, `c`.`Telefono_Cotizante` AS `Telefono_Cotizante`, `e`.`idEvento` AS `idEvento`, `e`.`Tipo_evento` AS `Tipo_evento`, `e`.`Fecha_evento` AS `Fecha_evento`, `e`.`Estado_evento` AS `Estado_evento`, `e`.`Descripcion_evento` AS `Descripcion_evento`, `ct`.`Cantidad_Personas_Cotización` AS `Cantidad_Personas_Cotización`, group_concat(`s`.`Nombre_Servicio` separator ', ') AS `Nombres_Servicios`, group_concat(`es`.`Valor_Total` separator ', ') AS `Valor_Servicios`, group_concat(`es`.`Cantidad_Servicios` separator ', ') AS `Cantidad`, group_concat(`s`.`Valor_Servicio` separator ', ') AS `Valor_Unitario`, group_concat(`s`.`Tipo_Servicio` separator ', ') AS `Tipo_Servicio`, `cl`.`idCliente` AS `idCliente` FROM (((((`evento` `e` join `cliente` `cl` on(`cl`.`idCliente` = `e`.`Cliente_idCliente`)) join `cotizante` `c` on(`c`.`Correo_Cotizante` = `cl`.`Correo_cotizante`)) join `cotización` `ct` on(`ct`.`No_Cotizacion` = `e`.`Cotizacion_No_Cotizacion`)) join `evento_servicio` `es` on(`es`.`Evento_idEvento` = `e`.`idEvento`)) join `servicio` `s` on(`s`.`idServicio` = `es`.`Servicio_idServicio`)) GROUP BY `e`.`idEvento` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `Correo_cotizante` (`Correo_cotizante`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD KEY `Pagos_No_Pagos` (`Pagos_No_Pagos`),
  ADD KEY `Pagos_Evento_idEvento` (`Pagos_Evento_idEvento`),
  ADD KEY `Pagos_Evento_Cliente_idCliente` (`Pagos_Evento_Cliente_idCliente`);

--
-- Indices de la tabla `cotizacion_servicio`
--
ALTER TABLE `cotizacion_servicio`
  ADD KEY `Cotizacion_No_Cotizacion` (`Cotizacion_No_Cotizacion`),
  ADD KEY `Servicio_idServicio` (`Servicio_idServicio`);

--
-- Indices de la tabla `cotización`
--
ALTER TABLE `cotización`
  ADD PRIMARY KEY (`No_Cotizacion`),
  ADD KEY `Cotizante_Correo` (`Cotizante_Correo`);

--
-- Indices de la tabla `cotizante`
--
ALTER TABLE `cotizante`
  ADD PRIMARY KEY (`Correo_Cotizante`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`idEncuesta`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`),
  ADD KEY `Evento_Cliente_idCliente` (`Evento_Cliente_idCliente`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `Administrador_idAdministrador` (`Administrador_idAdministrador`),
  ADD KEY `Cotizacion_No_Cotizacion` (`Cotizacion_No_Cotizacion`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`);

--
-- Indices de la tabla `evento_servicio`
--
ALTER TABLE `evento_servicio`
  ADD KEY `Evento_idEvento` (`Evento_idEvento`),
  ADD KEY `Servicio_idServicio` (`Servicio_idServicio`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`No_Pagos`),
  ADD KEY `Evento_idEvento` (`Evento_idEvento`),
  ADD KEY `Evento_Cliente_idCliente` (`Evento_Cliente_idCliente`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Correo_cotizante`) REFERENCES `cotizante` (`Correo_Cotizante`);

--
-- Filtros para la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`Pagos_No_Pagos`) REFERENCES `pagos` (`No_Pagos`),
  ADD CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`Pagos_Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `comprobante_ibfk_3` FOREIGN KEY (`Pagos_Evento_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `cotizacion_servicio`
--
ALTER TABLE `cotizacion_servicio`
  ADD CONSTRAINT `cotizacion_servicio_ibfk_1` FOREIGN KEY (`Cotizacion_No_Cotizacion`) REFERENCES `cotización` (`No_Cotizacion`),
  ADD CONSTRAINT `cotizacion_servicio_ibfk_2` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `cotización`
--
ALTER TABLE `cotización`
  ADD CONSTRAINT `cotización_ibfk_1` FOREIGN KEY (`Cotizante_Correo`) REFERENCES `cotizante` (`Correo_Cotizante`);

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `encuesta_ibfk_2` FOREIGN KEY (`Evento_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `administrador` (`idAdministrador`),
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`Cotizacion_No_Cotizacion`) REFERENCES `cotización` (`No_Cotizacion`),
  ADD CONSTRAINT `evento_ibfk_3` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `evento_servicio`
--
ALTER TABLE `evento_servicio`
  ADD CONSTRAINT `evento_servicio_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `evento_servicio_ibfk_2` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`Evento_Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
