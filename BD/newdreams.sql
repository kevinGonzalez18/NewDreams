-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 05:54:43
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
    DECLARE cotizanteExists INT;

    SELECT COUNT(*) INTO cotizanteExists
    FROM cotizante
    WHERE Correo_Cotizante = p_Correo_Cotizante;

    IF cotizanteExists = 0 THEN
        INSERT INTO cotizante (Correo_Cotizante, Nombre_Cotizante, Apellido_Cotizante, Telefono_Cotizante)
        VALUES (p_Correo_Cotizante, p_Nombre_Cotizante, p_Apellido_Cotizante, p_Telefono_Cotizante);
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ENCUESTA` (IN `p_idEncuesta` INT, IN `p_Correo_Encuesta` VARCHAR(45), IN `p_Nombre_encuesta` VARCHAR(45), IN `p_Tipo_evento_encuesta` VARCHAR(45), IN `p_Satisfaccion_encuesta` INT, IN `p_Evento_idEvento` INT, IN `p_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Encuesta (idEncuesta, Correo_Encuesta, Nombre_encuesta, Tipo_evento_encuesta, Satisfaccion_encuesta, Evento_idEvento, Evento_Cliente_idCliente)
    VALUES (p_idEncuesta, p_Correo_Encuesta, p_Nombre_encuesta, p_Tipo_evento_encuesta, p_Satisfaccion_encuesta, p_Evento_idEvento, p_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_EVENTO` (IN `p_Tipo_evento` VARCHAR(45), IN `p_Valor_evento` INT, IN `p_Fecha_evento` DATETIME, IN `p_Descripcion_evento` VARCHAR(200), IN `p_Administrador_idAdministrador` INT, IN `p_Cotizacion_No_Cotizacion` CHAR(7), IN `p_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Evento (Tipo_evento, Valor_evento, Fecha_evento, Descripcion_evento, Administrador_idAdministrador, Cotizacion_No_Cotizacion, Cliente_idCliente, Precio_Final)
    VALUES (p_Tipo_evento, p_Valor_evento, p_Fecha_evento, p_Descripcion_evento, p_Administrador_idAdministrador, p_Cotizacion_No_Cotizacion, p_Cliente_idCliente, p_Valor_evento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_EVENTOSERVICIO` (IN `p_IdEvento` INT, IN `p_IdServicio` CHAR(4), IN `p_CantidadServicios` INT, IN `p_ValorTotal` INT)   BEGIN
    INSERT INTO evento_servicio (Evento_idEvento, Servicio_idServicio, Cantidad_Servicios, Valor_Total)
    VALUES (p_IdEvento, p_IdServicio, p_CantidadServicios, p_ValorTotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PAGOS` (IN `p_Nombre_Pagos` VARCHAR(45), IN `p_Apellido_Pagos` VARCHAR(45), IN `p_Dia_hora_pagos` DATETIME, IN `p_Valor_pagos` INT, IN `p_Evento_idEvento` INT, IN `p_Evento_Cliente_idCliente` CHAR(5))   BEGIN
    INSERT INTO Pagos (Nombre_Pagos, Apellido_Pagos, Dia_hora_pagos, Valor_pagos, Evento_idEvento, Evento_Cliente_idCliente)
    VALUES (p_Nombre_Pagos, p_Apellido_Pagos, p_Dia_hora_pagos, p_Valor_pagos, p_Evento_idEvento, p_Evento_Cliente_idCliente);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SERVICIO` (IN `p_Nombre_servicio` VARCHAR(100), IN `p_Valor_servicio` INT, IN `p_Tipo_servicio` VARCHAR(45))   BEGIN
    INSERT INTO Servicio (Valor_Servicio, Tipo_Servicio, Nombre_Servicio)
    VALUES (p_Valor_servicio, p_Tipo_servicio, p_Nombre_servicio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_ULTIMO_ID_EVENTO` (IN `clientID` CHAR(5), OUT `lastEventID` INT)   BEGIN
    SELECT idEvento INTO lastEventID
    FROM evento
    WHERE Cliente_idCliente = clientID
    ORDER BY Fecha_evento DESC
    LIMIT 1;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_EVENTO` (IN `p_idEvento` INT, IN `p_Valor_evento` INT, IN `p_Estado_evento` VARCHAR(45), IN `p_Descripcion_evento` VARCHAR(200))   BEGIN
    UPDATE Evento
    SET Valor_evento = p_Valor_evento,
        Estado_evento = p_Estado_evento,
        Descripcion_evento = p_Descripcion_evento,
        Precio_Final = p_Valor_evento
    WHERE idEvento = p_idEvento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_EVENTO_INTO_COTIZACION` ()   BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cotizacion_no_val CHAR(7);
    DECLARE cur CURSOR FOR SELECT Cotizacion_No_Cotizacion FROM evento;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    evento_loop: LOOP
        FETCH cur INTO cotizacion_no_val;
        IF done THEN
            LEAVE evento_loop;
        END IF;
        
        IF EXISTS (SELECT 1 FROM cotización WHERE No_Cotizacion = cotizacion_no_val) THEN
            UPDATE cotización SET Evento = 1 WHERE No_Cotizacion = cotizacion_no_val;
        END IF;
    END LOOP evento_loop;
    CLOSE cur;
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
('CL015', 'Habilitado', '$2a$10$QxbfmdPlYhoJiENlCecKXe54CYftev2xp3OhIxsLHkk24UHPKTzP.', 'dfelipebr737@gmail.com'),
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
('CL029', 'Habilitado', '$2a$10$Vfx7cuBlIQvSQANiMzvAd.hpssSodwWDZ1IHTreklgE/oyZQiqnli', 'alfsan@gmail.com'),
('CL030', 'Habilitado', '$2a$10$QZDHRfRBwnURVZrKeuRzu.d2VY.eRTHkVY5CNfiTRCN/Vy9nHdrGG', 'angesu@mail.com'),
('CL031', 'Habilitado', '$2a$10$YfMN3YSRKlpH.r.8Q0JsJuH7Tchj8.2h9nEYNxzZ6rdB9sfg00kL6', 'loreber@mail.com'),
('CL032', 'Habilitado', '$2a$10$YUx.UGzaYYSuJ.e1M9lt0.V.95npjsIws2IGxhk0nn9SGw/u7OBMu', 'Oreo@mail.com'),
('CL033', 'Habilitado', '$2a$10$neH2cxejwPQycpM1C8VT4.9uT.KyZbYQ6vQ0umfGSYEDiZaOrf2Ey', 'reamm@mail.com'),
('CL034', 'Habilitado', '$2a$10$.B48nP3RjktEPU5xr4w85.dcnz7LYlFqloonW6Jd1LXjmmO.kqEOi', 'albarracina@mail.com'),
('CL035', 'Habilitado', '$2a$10$sxKEM8GjuPrvVOAZUaxnEuEZ3WgfOhGd49YDtlRYdZocwFUFKY4y.', 'angero@mail.com'),
('CL037', 'Habilitado', '$2a$10$wTA91btExILneB951JCdKegc2R17VqB.uxWXCqRVjny5LqIHl2w4G', 'weekend@mail.co'),
('CL038', 'Habilitado', '$2a$10$bDuxUlXOv7r8zjEYddKVreafBa3D3SoFtwOLEzjvfOF0924SGEGTG', 'liann04209@gmail.com');

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
('COT1020', 'S20', 30, 30000),
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
('COT1028', 'S07', 10, 12000),
('COT1029', 'S01', 3, 21000),
('COT1029', 'S03', 3, 10500),
('COT1029', 'S05', 3, 30000),
('COT1029', 'S07', 3, 3600),
('COT1029', 'S021', 1, 10000),
('COT1029', 'S12', 1, 45000),
('COT1029', 'S20', 3, 6000),
('COT1030', 'S01', 3, 21000),
('COT1030', 'S03', 3, 10500),
('COT1030', 'S05', 3, 30000),
('COT1030', 'S07', 3, 3600),
('COT1030', 'S021', 1, 10000),
('COT1030', 'S12', 1, 45000),
('COT1030', 'S20', 30, 60000),
('COT1031', 'S01', 10, 70000),
('COT1031', 'S03', 10, 35000),
('COT1031', 'S05', 10, 100000),
('COT1031', 'S07', 10, 12000),
('COT1031', 'S12', 3, 135000),
('COT1031', 'S16', 10, 20000),
('COT1031', 'S20', 30, 60000),
('COT1032', 'S01', 3, 21000),
('COT1032', 'S03', 20, 70000),
('COT1032', 'S05', 10, 100000),
('COT1032', 'S07', 10, 12000),
('COT1032', 'S021', 1, 10000),
('COT1033', 'S01', 3, 21000),
('COT1033', 'S03', 20, 70000),
('COT1033', 'S05', 10, 100000),
('COT1033', 'S07', 10, 12000),
('COT1033', 'S021', 1, 10000),
('COT1034', 'S01', 10, 70000),
('COT1034', 'S03', 10, 35000),
('COT1034', 'S05', 10, 100000),
('COT1034', 'S07', 10, 12000),
('COT1034', 'S021', 1, 10000),
('COT1034', 'S12', 2, 90000),
('COT1034', 'S16', 10, 20000),
('COT1034', 'S20', 30, 60000),
('COT1035', 'S01', 10, 70000),
('COT1035', 'S03', 10, 35000),
('COT1035', 'S05', 10, 100000),
('COT1035', 'S07', 10, 12000),
('COT1035', 'S021', 1, 10000),
('COT1035', 'S12', 2, 90000),
('COT1035', 'S16', 10, 20000),
('COT1035', 'S20', 30, 60000),
('COT1036', 'S01', 10, 70000),
('COT1037', 'S01', 10, 70000),
('COT1037', 'S03', 10, 35000),
('COT1037', 'S05', 10, 100000),
('COT1037', 'S07', 10, 12000),
('COT1037', 'S20', 30, 60000),
('COT1038', 'S01', 3, 21000),
('COT1038', 'S03', 3, 10500),
('COT1038', 'S05', 3, 30000),
('COT1038', 'S07', 3, 3600),
('COT1038', 'S021', 1, 10000),
('COT1038', 'S20', 30, 60000),
('COT1039', 'S01', 10, 70000),
('COT1039', 'S03', 10, 35000),
('COT1039', 'S06', 10, 150000),
('COT1039', 'S021', 1, 10000),
('COT1040', 'S01', 10, 70000),
('COT1040', 'S05', 2, 20000),
('COT1040', 'S09', 1, 50000),
('COT1042', 'S01', 10, 70000),
('COT1042', 'S03', 10, 35000),
('COT1042', 'S05', 10, 100000),
('COT1043', 'S01', 2, 14000),
('COT1043', 'S04', 11, 132000),
('COT1043', 'S05', 10, 100000),
('COT1043', 'S09', 1, 50000),
('COT1044', 'S01', 10, 70000),
('COT1044', 'S06', 10, 150000),
('COT1044', 'S09', 1, 50000),
('COT1045', 'S02', 10, 150000),
('COT1045', 'S05', 2, 20000),
('COT1045', 'S09', 1, 50000),
('COT1046', 'S01', 10, 70000),
('COT1046', 'S05', 3, 30000),
('COT1046', 'S09', 1, 50000),
('COT1047', 'S01', 10, 70000),
('COT1047', 'S03', 10, 35000),
('COT1047', 'S05', 10, 100000),
('COT1047', 'S07', 10, 12000),
('COT1047', 'S09', 1, 50000),
('COT1047', 'S12', 5, 225000),
('COT1047', 'S16', 2, 4000),
('COT1047', 'S19', 1, 7000),
('COT1047', 'S20', 200, 400000),
('COT1048', 'S01', 10, 70000),
('COT1048', 'S03', 10, 35000),
('COT1048', 'S05', 10, 100000),
('COT1048', 'S07', 3, 3600),
('COT1048', 'S09', 1, 50000),
('COT1049', 'S01', 10, 70000),
('COT1049', 'S02', 10, 150000),
('COT1049', 'S05', 10, 100000),
('COT1049', 'S06', 10, 150000),
('COT1049', 'S09', 10, 500000),
('COT1049', 'S10', 10, 800000),
('COT1050', 'S01', 10, 70000),
('COT1050', 'S02', 10, 150000),
('COT1050', 'S05', 10, 100000),
('COT1050', 'S06', 10, 150000),
('COT1050', 'S09', 10, 500000),
('COT1050', 'S10', 10, 800000),
('COT1051', 'S01', 10, 70000),
('COT1051', 'S03', 10, 35000),
('COT1051', 'S05', 10, 100000),
('COT1051', 'S07', 10, 12000),
('COT1051', 'S09', 1, 50000),
('COT1051', 'S15', 10, 600000),
('COT1052', 'S01', 10, 70000),
('COT1052', 'S02', 10, 150000),
('COT1052', 'S05', 10, 100000),
('COT1052', 'S06', 10, 150000),
('COT1052', 'S09', 10, 500000),
('COT1052', 'S10', 10, 800000);

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
  `Deleted` tinyint(1) NOT NULL,
  `No_Aprobado` tinyint(1) NOT NULL,
  `Evento` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotización`
--

INSERT INTO `cotización` (`No_Cotizacion`, `Tipo_Cotizacion`, `Ubicacion`, `Fecha_Parcial_Evento_Cotización`, `Fecha_Hora_Cotizacion`, `Valor_Cotización`, `Cantidad_Personas_Cotización`, `Cotizante_Correo`, `Deleted`, `No_Aprobado`, `Evento`) VALUES
('COT1001', 'Xv años', 'Salon comunal kennedy', '2023-10-20 08:00:00', '2023-06-15 02:54:00', 5000000, 100, 'mauriciotorres@gmail.com', 1, 0, 1),
('COT1002', 'Grado', 'Salon comunal bella vista', '2024-06-23 06:00:00', '2023-04-18 03:35:00', 7000000, 150, 'pepitoperez@gmail.com', 0, 0, 1),
('COT1003', 'Boda', 'Salon comunal perseverancia', '2024-02-03 02:00:00', '2023-05-01 08:00:00', 3500000, 80, 'valentinapaez@gmail.com', 0, 0, 1),
('COT1004', 'Bautizo', 'Salon comunal puente aranda', '2023-07-15 07:30:00', '2023-07-28 10:15:00', 2500000, 70, 'santiagocastellanos@gmail.com', 0, 0, 1),
('COT1005', 'Xv años', 'Salon comunal bosa', '2023-12-30 12:45:00', '2023-08-02 02:30:00', 4500000, 80, 'mauriciotorres@gmail.com', 0, 0, 1),
('COT1006', 'Reunion Empresarial', 'Centro empresarial', '2024-06-27 16:30:00', '2024-05-16 16:32:52', 5000000, 30, 'alfsan@gmail.com', 1, 0, 0),
('COT1016', 'Comunion', 'La empresa buscarÃÂÃÂ¡ el lugar del evento', '2024-07-07 17:30:00', '2024-05-08 16:33:00', 937000, 30, 'loreber@mail.com', 0, 0, 1),
('COT1017', 'XV aÃ±os', 'La empresa buscarÃ¡ el lugar del evento', '2024-07-31 17:30:00', '2024-05-08 16:50:00', 1162000, 70, 'Zharick@mail.com', 1, 0, 0),
('COT1018', 'XV años', 'Kennedy, Carrera 30 calle 19, Roma', '2024-06-21 16:00:00', '2024-05-08 16:55:00', 222000, 30, 'DanielGa@mail.com', 0, 0, 1),
('COT1019', 'Bautizo', 'Salon comunal, Cra 81 h 76F 15, Bosa', '2024-07-11 18:30:00', '2024-05-08 17:07:00', 248000, 20, 'alfrecas@mail.com', 0, 0, 1),
('COT1020', 'Comunion', 'Mi casita', '2024-07-20 16:00:00', '2024-05-09 18:19:00', 566000, 50, 'Dana@mail.com', 0, 1, 0),
('COT1021', 'Bautizo', 'La empresa buscarÃÂÃÂ¡ el lugar del evento', '2024-06-21 14:00:00', '2024-05-09 18:31:00', 684000, 30, 'Oreo@mail.com', 0, 0, 1),
('COT1022', 'Boda', 'Salon comunal soacha', '2024-08-20 17:30:00', '2024-05-09 18:32:00', 1147000, 30, 'tom@mail.com', 0, 1, 0),
('COT1023', 'XVaÃ±os', 'La empresa buscará el lugar del evento', '2024-07-27 20:30:00', '2024-05-09 19:00:00', 247000, 100, 'reamm@mail.com', 0, 0, 1),
('COT1024', 'Grado', 'La empresa buscará el lugar del evento', '2024-06-20 20:30:00', '2024-05-09 19:07:00', 247000, 100, 'weekend@mail.co', 0, 0, 1),
('COT1025', 'XVaÃ±os', 'Salon comunal, Cra 81 h 76F 15, Bosa', '2024-07-27 18:30:00', '2024-05-15 12:19:00', 621000, 100, 'guillermoisa@mail.com', 0, 1, 0),
('COT1026', 'XVaÃ±os', 'La empresa buscará el lugar del evento', '2024-07-20 20:30:00', '2024-05-20 12:53:00', 247000, 30, 'estefania@mail.com', 0, 0, 0),
('COT1027', 'Grado', 'La empresa buscará el lugar del evento', '2025-01-05 17:30:00', '2024-05-27 15:52:00', 442000, 100, 'Yolgei@mail.com', 0, 0, 0),
('COT1028', 'XVaÃ±os', 'La empresa buscará el lugar del evento', '2024-06-26 17:30:00', '2024-05-27 16:01:00', 442000, 30, 'edwin@mail.com', 1, 0, 0),
('COT1029', 'Bautizo', 'La empresa buscará el lugar del evento', '2024-08-07 17:30:00', '2024-06-09 18:13:00', 126100, 30, 'cristian@mail.com', 0, 1, 0),
('COT1030', 'Bautizo', 'La empresa buscará el lugar del evento', '2024-08-07 17:30:00', '2024-06-09 18:13:00', 180100, 30, 'cristian@mail.com', 1, 0, 0),
('COT1031', 'Boda', 'La empresa buscará el lugar del evento', '2024-08-20 20:00:00', '2024-06-09 18:16:00', 432000, 100, 'fran@mail.com', 0, 1, 0),
('COT1032', 'Boda', 'La empresa buscará el lugar del evento', '2024-07-31 18:00:00', '2024-06-09 18:18:00', 213000, 30, 'angesu@mail.com', 1, 0, 0),
('COT1033', 'Boda', 'La empresa buscará el lugar del evento', '2024-07-31 18:00:00', '2024-06-09 18:18:00', 213000, 30, 'angesu@mail.com', 1, 0, 0),
('COT1034', 'Bautizo', 'La empresa buscará el lugar del evento', '2024-08-22 16:30:00', '2024-06-14 12:19:00', 397000, 100, 'jgalvis@mail.com', 0, 0, 0),
('COT1035', 'Bautizo', 'La empresa buscará el lugar del evento', '2024-08-22 16:30:00', '2024-06-14 12:19:00', 397000, 100, 'jgalvis@mail.com', 0, 0, 0),
('COT1036', 'Empresarial', 'La empresa buscará el lugar del evento', '2024-07-26 14:30:00', '2024-06-14 12:28:00', 637000, 30, 'albarracina@mail.com', 0, 0, 0),
('COT1037', 'Boda', 'La empresa buscará el lugar del evento', '2024-07-24 14:30:00', '2024-06-14 12:42:00', 277000, 90, 'angero@mail.com', 0, 0, 0),
('COT1038', 'Grado', 'La empresa buscará el lugar del evento', '2025-01-05 12:00:00', '2024-06-15 02:36:00', 135100, 30, 'dfelipebr737@gmail.com', 0, 0, 1),
('COT1039', 'Empresarial', 'La empresa buscará el lugar del evento', '2024-08-28 12:00:00', '2024-06-15 19:26:00', 265000, 30, 'Yolgei@mail.com', 0, 0, 0),
('COT1040', 'Comunion', 'La empresa buscará el lugar del evento', '2024-07-17 17:30:00', '2024-06-15 20:49:00', 140000, 30, 'angealva@mail.com', 0, 0, 0),
('COT1042', 'Boda', 'La empresa buscará el lugar del evento', '2024-08-15 17:30:00', '2024-06-15 21:29:00', 205000, 100, 'harrilo@gmail.com', 0, 0, 0),
('COT1043', 'Boda', 'La empresa buscará el lugar del evento', '2024-07-25 17:30:00', '2024-06-16 19:27:00', 296000, 30, 'angela@mail.com', 0, 0, 0),
('COT1044', 'Comunion', 'La empresa buscará el lugar del evento', '2024-07-31 17:30:00', '2024-06-16 19:30:00', 270000, 100, 'hamilton@mail.com', 0, 0, 0),
('COT1045', 'Empresarial', 'La empresa buscará el lugar del evento', '2024-08-14 12:00:00', '2024-06-16 19:50:00', 220000, 100, 'ruizh@mail.com', 0, 0, 0),
('COT1046', 'Boda', 'La empresa buscará el lugar del evento', '2024-08-14 20:00:00', '2024-06-16 19:58:00', 150000, 20, 'Newton@mail.com', 0, 0, 0),
('COT1047', 'Boda', 'Salon comunal Bella vista, Cra 28 s  # 54 b 25, Bella vista', '2024-09-18 14:30:00', '2024-06-16 20:07:00', 903000, 100, 'Marias@mail.com', 0, 0, 0),
('COT1048', 'XVaños', 'La empresa buscará el lugar del evento', '2024-07-31 20:30:00', '2024-06-16 20:43:00', 258600, 20, 'Klie@mail.com', 0, 0, 0),
('COT1049', 'XVaños', 'Salon de Eventos XYZ, Calle 123, Barrio ABC', '2024-07-27 22:30:00', '2024-06-16 23:26:00', 1770000, 50, 'juan.perez@example.com', 0, 0, 0),
('COT1050', 'XVaños', 'Salon de Eventos XYZ, Calle 123, Barrio ABC', '2024-07-27 22:30:00', '2024-06-16 23:35:00', 1770000, 50, 'juan.perez@example.com', 0, 1, 0),
('COT1051', 'Bautizo', 'La empresa buscará el lugar del evento', '2024-11-01 14:00:00', '2024-06-17 20:30:00', 867000, 30, 'liann04209@gmail.com', 0, 0, 1),
('COT1052', 'XVaños', 'Salon de Eventos XYZ, Calle 123, Barrio ABC', '2024-07-27 22:30:00', '2024-06-19 17:36:00', 1770000, 50, 'juan.perez@example.com', 0, 0, 0);

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
('albarracina@mail.com', 'Andres', 'Albarracin', '3659875421', 1, 0),
('Alfonso@mail.com', 'Alfonso', 'Lopez', '874512', 1, 0),
('alfrecas@mail.com', 'Alfredo', 'Castro Rodriguez', '875421', 1, 0),
('alfsan@gmail.com', 'Alfonso Alberto', 'Sanchez Morales', '3213950191', 1, 0),
('andresmartinez@gmail.com', 'Andres', 'Martinez', '3112104578', 1, 0),
('angealva@mail.com', 'Angelica', 'Alvarez', '12054152', 0, 0),
('angela@mail.com', 'Angela', 'Aguilar', '3112711549', 0, 0),
('Angelica@mail.com', 'Angelica', 'Martinez', '9884512', 1, 0),
('angero@mail.com', 'Angelica', 'Rodriguez', '1234567890', 1, 0),
('angesu@mail.com', 'Angelica', 'Suarez', '120354', 1, 0),
('asd@mail.com', 'santiago', 'lopez', '2014', 0, 0),
('asda@mail.com', 'ola', 'como', '31120', 0, 0),
('cristian@mail.com', 'Cristian', 'Cespedes', '3201548798', 0, 0),
('Dana@mail.com', 'Dana Marcela', 'Cespedes Triana', '4505', 1, 0),
('DanielGa@mail.com', 'Daniel Mauricio', 'Chambo Gaviria', '3202114578', 1, 0),
('dfelipebr737@gmail.com', 'Damian Felipe', 'Bernal Rodriguez', '3112711553', 1, 0),
('edilson@mail.com', 'Edilson', 'Maecha', '986532', 1, 0),
('edwin@mail.com', 'Edwin', 'Santos', '98653214', 0, 1),
('estefania@mail.com', 'Estefania', 'Gavaria', '3112065487', 1, 0),
('Felipe@mail.com', 'Felipe', 'Rodriguez', '895623', 0, 1),
('fran@mail.com', 'Fran', 'Staxx', '31391', 0, 0),
('franro@gmail.com', 'Francisco', 'Rojas Rey', '012345', 1, 0),
('franro@htomail.com', 'Francisco', 'Rojas', '0321457', 0, 0),
('Guillermo@mail.com', 'Guillermo', 'Camacho', '789632', 0, 0),
('guillermoisa@mail.com', 'Guillermo', 'Izasa', '875432', 0, 0),
('hamilton@mail.com', 'Hamilton', 'Sena', '3204589878', 0, 0),
('harrilo@gmail.com', 'Harrison ', 'Berrio', '3124589874', 0, 0),
('harrilo@mail.com', 'Harrison ', 'Lopez', '985421', 1, 0),
('Javier@mail.com', 'Javier', 'Rodriguez', '78523', 0, 0),
('jgalvis@mail.com', 'Julio', 'Galvis', '3213654987', 0, 0),
('juan.perez@example.com', 'Juan', 'Perez Gomez', '1234567890', 0, 0),
('Juliomar@mail.com', 'Julio', 'Martinez', '1230', 1, 0),
('Kevinsa@mail.com', 'Kevin', 'Salazar', '784512', 1, 0),
('kevinsanty@mail.com', 'Kevin Santiago', 'Gonzalez Romero', '3112458975', 1, 0),
('Klie@mail.com', 'Kylie', 'Jenner', '3025487854', 0, 0),
('liann04209@gmail.com', 'Yamile', 'Rodriguez', '3123730728', 1, 0),
('loreber@mail.com', 'Daiyan Lorena', 'Berrio Rodriguez', '3112754521', 1, 0),
('mariamartinez2@gmail.com', 'maria', 'martinez', '12345', 1, 0),
('mariamartinez@gmail.com', 'Maria', 'Martinez', '3224532545', 1, 0),
('Marias@mail.com', 'Maria', 'Santa', '3012548796', 0, 0),
('mauriciotorres@gmail.com', 'Mauricio', 'Torres', '3229851236', 1, 0),
('Newton@mail.com', 'Isaac', 'Newton', '3021547', 0, 0),
('Oreo@mail.com', 'Oreo', 'Rodriguez', '875432', 1, 0),
('pepitoperez@gmail.com', 'Pepito', 'Perez', '3224569875', 1, 0),
('reamm@mail.com', 'Ramm', 'Einstein', '10325', 1, 0),
('ruizh@mail.com', 'Hamilto', 'Ruiz', '3112015487', 0, 0),
('santiagocastellanos@gmail.com', 'Santiago', 'Castellanos', '3112365478', 1, 0),
('tom@mail.com', 'tom marvolo', 'holland', '3114758965', 0, 0),
('valentinapaez@gmail.com', 'Valentina', 'Paez', '3102548965', 1, 0),
('vivian@mail.com', 'Vivian', 'Hincapie', '87541', 0, 0),
('weekend@mail.co', 'Abel', 'Testafaye', '876532', 1, 0),
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
  `Descripcion_evento` varchar(200) DEFAULT NULL,
  `Administrador_idAdministrador` int(11) NOT NULL,
  `Cotizacion_No_Cotizacion` char(7) NOT NULL,
  `Cliente_idCliente` char(5) NOT NULL,
  `Precio_Final` int(11) NOT NULL,
  `encuesta_enviada` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `Tipo_evento`, `Valor_evento`, `Fecha_evento`, `Estado_evento`, `Descripcion_evento`, `Administrador_idAdministrador`, `Cotizacion_No_Cotizacion`, `Cliente_idCliente`, `Precio_Final`, `encuesta_enviada`) VALUES
(1, 'Xv años', 5500000, '2023-10-25 10:30:00', 'Realizado', 'Decoración totalmente neón, centros de mesa con ramosde flores fluorecentes, protocolo clasico, mariachis sorpresa\r\n  intervencion del padre, regalo de la madre, comida, hora loca, bebidas, fin', 1, 'COT1001', 'CL001', 0, 1),
(2, 'Grado', 0, '2024-06-23 06:00:00', 'Activo', 'Graduacion ingeniero aeronautico, ubicado en un avion dentro del hangar del aeropuerto, decoracion clasica, comida basica', 1, 'COT1002', 'CL002', 0, 0),
(3, 'Boda', 3000000, '2024-02-03 02:00:00', 'Realizado', 'Decoracion a blanco y negro, protocolo clasico, regal sorpresa de la familiade la novia', 1, 'COT1003', 'CL003', 0, 1),
(4, 'Bautizo', 2500000, '2023-07-15 07:30:00', 'Realizado', 'Bautizo clasico, comida con 3 carnes y 2 bebidas', 1, 'COT1004', 'CL004', 0, 1),
(5, 'Xv años', 5000000, '2023-12-30 12:45:00', 'Realizado', 'Ratatouille con vino añejo', 1, 'COT1005', 'CL005', 0, 1),
(14, 'Bautizo', 248000, '2024-07-11 18:30:00', 'Activo', NULL, 1, 'COT1019', 'CL017', 248000, 0),
(15, 'Comunion', 937000, '2024-07-07 17:30:00', 'Activo', NULL, 1, 'COT1016', 'CL031', 937000, 0),
(16, 'XV años', 222000, '2024-06-21 16:00:00', 'Realizado', NULL, 1, 'COT1018', 'CL020', 222000, 1),
(17, 'Bautizo', 496000, '2024-06-21 14:00:00', 'Activo', 'Miau', 1, 'COT1021', 'CL032', 496000, 0),
(18, 'XVaÃ±os', 247000, '2024-07-27 20:30:00', 'Activo', NULL, 1, 'COT1023', 'CL033', 247000, 0),
(19, 'Grado', 112800, '2025-01-05 12:00:00', 'Realizado', 'Descripcion corta', 1, 'COT1038', 'CL015', 112800, 1),
(20, 'Grado', 247000, '2024-06-20 20:30:00', 'Activo', 'Descripcion corta', 1, 'COT1024', 'CL037', 247000, 0),
(22, 'Bautizo', 867000, '2024-11-01 14:00:00', 'Realizado', 'Descripcion corta', 1, 'COT1051', 'CL038', 867000, 1);

--
-- Disparadores `evento`
--
DELIMITER $$
CREATE TRIGGER `set_default_estado_evento` BEFORE INSERT ON `evento` FOR EACH ROW BEGIN
    SET NEW.Estado_evento = 'Activo';
END
$$
DELIMITER ;

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
(3, 'S03', 0, 0),
(14, 'S01', 2, 14000),
(14, 'S03', 20, 70000),
(14, 'S05', 2, 20000),
(14, 'S07', 20, 24000),
(14, 'S13', 2, 90000),
(14, 'S20', 30, 30000),
(15, 'S01', 10, 70000),
(15, 'S03', 10, 35000),
(15, 'S05', 10, 100000),
(15, 'S07', 10, 12000),
(15, 'S15', 10, 600000),
(15, 'S20', 30, 30000),
(16, 'S01', 3, 21000),
(16, 'S03', 30, 105000),
(16, 'S05', 3, 30000),
(16, 'S07', 30, 36000),
(16, 'S20', 30, 30000),
(17, 'S01', 10, 70000),
(17, 'S03', 2, 7000),
(17, 'S05', 3, 30000),
(17, 'S07', 10, 12000),
(17, 'S20', 30, 30000),
(17, 'S12', 2, 90000),
(17, 'S13', 3, 135000),
(17, 'S16', 1, 2000),
(17, 'S04', 10, 120000),
(18, 'S01', 10, 70000),
(18, 'S03', 10, 35000),
(18, 'S05', 10, 100000),
(18, 'S07', 10, 12000),
(18, 'S20', 30, 30000),
(19, 'S01', 1, 7000),
(19, 'S03', 2, 7000),
(19, 'S05', 3, 30000),
(19, 'S07', 4, 4800),
(19, 'S021', 5, 50000),
(19, 'S20', 7, 14000),
(20, 'S01', 1, 7000),
(20, 'S03', 2, 7000),
(20, 'S05', 3, 30000),
(20, 'S07', 4, 4800),
(20, 'S20', 5, 10000),
(22, 'S01', 10, 70000),
(22, 'S03', 10, 35000),
(22, 'S05', 10, 100000),
(22, 'S07', 10, 12000),
(22, 'S09', 1, 50000),
(22, 'S15', 10, 600000);

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
('P0001', 1, 'Mauricio', 'Torres', '2023-10-25 10:30:00', 50000, 3, 'CL003'),
('P0002', 1, 'Pepito', 'Perez', '2024-06-23 06:00:00', 70000, 1, 'CL001'),
('P0003', 1, 'Valentina', 'Paez', '2024-02-03 02:00:00', 30000, 4, 'CL004'),
('P0004', 1, 'Santiago', 'Castellanos', '2023-07-28 10:15:00', 250000, 5, 'CL005'),
('P0005', 2, 'Mauricio', 'Torres', '2023-08-02 02:30:00', 450000, 3, 'CL003'),
('P0006', 2, 'Pepito', 'Perez', '2024-05-20 04:52:00', 50000, 1, 'CL001'),
('P0007', 3, 'Pepito', 'Perez', '2024-05-19 03:30:00', 50000, 1, 'CL001'),
('P0008', 4, 'Pepito', 'Perez', '2024-05-18 03:30:00', 500000, 1, 'CL001'),
('P0009', 1, 'Damian', 'Bernal', '2024-06-17 00:00:00', 50000, 19, 'CL015');

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
('S022', 15000, 'Piñata', 'Decoracion', 1),
('S023', 10000, 'Sillas de metal', 'Mesas y sillas', 1),
('S024', 10000, 'Espuma artificial', 'Decoracion', 0),
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
,`Evento` tinyint(1)
,`No_Aprobado` tinyint(1)
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
,`idCliente` char(5)
,`Precio_Final` int(11)
,`Nombres_Servicios` mediumtext
,`Valor_Servicios` mediumtext
,`Cantidad` mediumtext
,`Valor_Unitario` mediumtext
,`Tipo_Servicio` mediumtext
,`idServicio` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cotizaciones`
--
DROP TABLE IF EXISTS `vista_cotizaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cotizaciones`  AS SELECT `cot`.`No_Cotizacion` AS `No_Cotizacion`, `co`.`Nombre_Cotizante` AS `Nombre_Cotizante`, `co`.`Apellido_Cotizante` AS `Apellido_Cotizante`, `co`.`Telefono_Cotizante` AS `Telefono_Cotizante`, `co`.`Correo_Cotizante` AS `Correo_Cotizante`, `cot`.`Tipo_Cotizacion` AS `Tipo_Cotizacion`, `cot`.`Cantidad_Personas_Cotización` AS `Cantidad_Personas_Cotización`, `cot`.`Ubicacion` AS `Ubicacion`, `cot`.`Fecha_Parcial_Evento_Cotización` AS `Fecha_Parcial_Evento_Cotización`, `cot`.`Fecha_Hora_Cotizacion` AS `Fecha_Hora_Cotizacion`, `cot`.`Valor_Cotización` AS `Valor_Cotización`, `cot`.`Deleted` AS `Deleted`, `cot`.`Evento` AS `Evento`, `cot`.`No_Aprobado` AS `No_Aprobado`, group_concat(`s`.`Nombre_Servicio` separator ', ') AS `Servicios`, group_concat(`s`.`Valor_Servicio` separator ', ') AS `Valor_Unitario`, group_concat(`cots`.`Cantidad_Servicios` separator ', ') AS `Cantidad`, group_concat(`cots`.`Valor_Servicio` separator ', ') AS `Valor_Total`, group_concat(`s`.`Tipo_Servicio` separator ', ') AS `Tipo_Servicio` FROM (((`cotización` `cot` join `cotizacion_servicio` `cots` on(`cot`.`No_Cotizacion` = `cots`.`Cotizacion_No_Cotizacion`)) join `cotizante` `co` on(`co`.`Correo_Cotizante` = `cot`.`Cotizante_Correo`)) join `servicio` `s` on(`s`.`idServicio` = `cots`.`Servicio_idServicio`)) WHERE `cot`.`Evento` = 0 GROUP BY `cot`.`No_Cotizacion` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_evento`
--
DROP TABLE IF EXISTS `vista_evento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_evento`  AS SELECT `c`.`Nombre_Cotizante` AS `Nombre_Cotizante`, `c`.`Apellido_Cotizante` AS `Apellido_Cotizante`, `c`.`Correo_Cotizante` AS `Correo_Cotizante`, `c`.`Telefono_Cotizante` AS `Telefono_Cotizante`, `e`.`idEvento` AS `idEvento`, `e`.`Tipo_evento` AS `Tipo_evento`, `e`.`Fecha_evento` AS `Fecha_evento`, `e`.`Estado_evento` AS `Estado_evento`, `e`.`Descripcion_evento` AS `Descripcion_evento`, `ct`.`Cantidad_Personas_Cotización` AS `Cantidad_Personas_Cotización`, `cl`.`idCliente` AS `idCliente`, `e`.`Precio_Final` AS `Precio_Final`, group_concat(`s`.`Nombre_Servicio` separator ', ') AS `Nombres_Servicios`, group_concat(`es`.`Valor_Total` separator ', ') AS `Valor_Servicios`, group_concat(`es`.`Cantidad_Servicios` separator ', ') AS `Cantidad`, group_concat(`s`.`Valor_Servicio` separator ', ') AS `Valor_Unitario`, group_concat(`s`.`Tipo_Servicio` separator ', ') AS `Tipo_Servicio`, group_concat(`s`.`idServicio` separator ', ') AS `idServicio` FROM (((((`evento` `e` join `cliente` `cl` on(`cl`.`idCliente` = `e`.`Cliente_idCliente`)) join `cotizante` `c` on(`c`.`Correo_Cotizante` = `cl`.`Correo_cotizante`)) join `cotización` `ct` on(`ct`.`No_Cotizacion` = `e`.`Cotizacion_No_Cotizacion`)) join `evento_servicio` `es` on(`es`.`Evento_idEvento` = `e`.`idEvento`)) join `servicio` `s` on(`s`.`idServicio` = `es`.`Servicio_idServicio`)) GROUP BY `e`.`idEvento` ;

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
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `actualizar_estado_evento` ON SCHEDULE EVERY 1 HOUR STARTS '2024-06-15 21:13:16' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE evento
  SET Estado_evento = 'Realizado'
  WHERE Fecha_evento <= NOW() - INTERVAL 24 HOUR$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
