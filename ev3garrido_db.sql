-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 06:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ev3garrido_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `antoniaapp_consulta`
--

CREATE TABLE `antoniaapp_consulta` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `motivo` longtext NOT NULL,
  `diagnostico` longtext DEFAULT NULL,
  `mascota_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `antoniaapp_dueño`
--

CREATE TABLE `antoniaapp_dueño` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `antoniaapp_dueño`
--

INSERT INTO `antoniaapp_dueño` (`id`, `nombre`, `rut`, `direccion`, `telefono`) VALUES
(1, 'Brandon Isaac Beltrán Sepúlveda', '21.934.288-8', 'Los Aromos 0877', '+56 9 2897 4890'),
(2, 'Joaquín Yulian Hernández Santander', '21.559.202-2', 'Av. Siempre Viva 424', '+56 9 4978 6992'),
(3, 'Ángelica Antonia Garrido Cancino', '21.233.542-3', 'no me se tu rut y puse cualquier wea 123', '+56 9 8654 3689');

-- --------------------------------------------------------

--
-- Table structure for table `antoniaapp_mascota`
--

CREATE TABLE `antoniaapp_mascota` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especie` varchar(100) NOT NULL,
  `raza` varchar(100) NOT NULL,
  `foto_mascota` varchar(100) DEFAULT NULL,
  `dueño_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `antoniaapp_mascota`
--

INSERT INTO `antoniaapp_mascota` (`id`, `nombre`, `especie`, `raza`, `foto_mascota`, `dueño_id`) VALUES
(2, 'pepito', 'perro', 'nose', 'mascotas/04dfcc1945d2d10406688db28165b085.jpg', 1),
(3, 'alfredo', 'gato', 'hola', 'mascotas/meu-gato-é-praticamente-o-gato-do-meme-v0-n9dleoj8dgfc1_m5rz4Tl.jpg', 2),
(4, 'alfonso', 'gato', 'parau', 'mascotas/images.jpg', 2),
(5, 'Brandon', 'Perro', 'tontito', 'mascotas/depositphotos_26089317-stock-photo-cute-small-dog.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `antoniaapp_veterinario`
--

CREATE TABLE `antoniaapp_veterinario` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `antoniaapp_veterinario`
--

INSERT INTO `antoniaapp_veterinario` (`id`, `nombre`, `especialidad`, `telefono`) VALUES
(1, 'Ángelica Antonia Garrido Cancino', 'Cirugía.', '+56 9 8654 3689');

-- --------------------------------------------------------

--
-- Table structure for table `antoniaapp_veterinario_mascotas_atendidas`
--

CREATE TABLE `antoniaapp_veterinario_mascotas_atendidas` (
  `id` bigint(20) NOT NULL,
  `veterinario_id` bigint(20) NOT NULL,
  `mascota_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add dueño', 7, 'add_dueño'),
(26, 'Can change dueño', 7, 'change_dueño'),
(27, 'Can delete dueño', 7, 'delete_dueño'),
(28, 'Can view dueño', 7, 'view_dueño'),
(29, 'Can add consulta', 8, 'add_consulta'),
(30, 'Can change consulta', 8, 'change_consulta'),
(31, 'Can delete consulta', 8, 'delete_consulta'),
(32, 'Can view consulta', 8, 'view_consulta'),
(33, 'Can add mascota', 9, 'add_mascota'),
(34, 'Can change mascota', 9, 'change_mascota'),
(35, 'Can delete mascota', 9, 'delete_mascota'),
(36, 'Can view mascota', 9, 'view_mascota'),
(37, 'Can add veterinario', 10, 'add_veterinario'),
(38, 'Can change veterinario', 10, 'change_veterinario'),
(39, 'Can delete veterinario', 10, 'delete_veterinario'),
(40, 'Can view veterinario', 10, 'view_veterinario');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$QVLSV3sL4ao4kbSTgiC9qg$tUJEqOff4f8vLGQcZ1j7/w76sOHUz0oqOG5eoCuyojE=', '2025-11-14 04:14:57.000000', 0, 'Antonia', '', '', '', 0, 1, '2025-11-14 04:14:49.000000'),
(2, 'pbkdf2_sha256$1000000$TRDwhTlniW1wPqtUVtqiGq$e7r0UhdM47oHwlamXGqA95kJlSZ0pGdh/lugjnQQvlw=', '2025-11-14 04:26:11.000000', 1, 'admin', '', '', '', 1, 1, '2025-11-14 04:25:55.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'AntoniaApp', 'consulta'),
(7, 'AntoniaApp', 'dueño'),
(9, 'AntoniaApp', 'mascota'),
(10, 'AntoniaApp', 'veterinario'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-11-14 03:29:50.000000'),
(2, 'auth', '0001_initial', '2025-11-14 03:29:50.000000'),
(3, 'admin', '0001_initial', '2025-11-14 03:29:50.000000'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-11-14 03:29:50.000000'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-14 03:29:50.000000'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-11-14 03:29:50.000000'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-11-14 03:29:50.000000'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-11-14 03:29:50.000000'),
(9, 'auth', '0004_alter_user_username_opts', '2025-11-14 03:29:50.000000'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-11-14 03:29:50.000000'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-11-14 03:29:50.000000'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-11-14 03:29:50.000000'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-11-14 03:29:50.000000'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-11-14 03:29:50.000000'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-11-14 03:29:50.000000'),
(16, 'auth', '0011_update_proxy_permissions', '2025-11-14 03:29:50.000000'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-11-14 03:29:50.000000'),
(18, 'sessions', '0001_initial', '2025-11-14 03:29:51.000000'),
(19, 'AntoniaApp', '0001_initial', '2025-11-14 03:39:30.000000');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('pc6woudg3g8smot4ymiaomxu1nd2151x', '.eJxVjMsOwiAQAP9lz4aAPFp69N5vIMsuSNVAUtqT8d9Nkx70OjOZNwTctxL2ntawMExwhcsvi0jPVA_BD6z3JqjVbV2iOBJx2i7mxul1O9u_QcFeYALDpJTXLrpRe2KjMUvKg8qoBhtHsqzRKpIyGedscl5atoZ9ZqeMNhE-X-ANN6E:1vJlNz:echdf3lgvlKHW8GI3N3iZtqF9QEolYdF6OMEEkldG4Y', '2025-11-28 04:26:11.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antoniaapp_consulta`
--
ALTER TABLE `antoniaapp_consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AntoniaApp_consulta_mascota_id_39c35593_fk_AntoniaApp_mascota_id` (`mascota_id`);

--
-- Indexes for table `antoniaapp_dueño`
--
ALTER TABLE `antoniaapp_dueño`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indexes for table `antoniaapp_mascota`
--
ALTER TABLE `antoniaapp_mascota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AntoniaApp_mascota_dueño_id_1b3aee37_fk_AntoniaApp_dueño_id` (`dueño_id`);

--
-- Indexes for table `antoniaapp_veterinario`
--
ALTER TABLE `antoniaapp_veterinario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indexes for table `antoniaapp_veterinario_mascotas_atendidas`
--
ALTER TABLE `antoniaapp_veterinario_mascotas_atendidas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AntoniaApp_veterinario_m_veterinario_id_mascota_i_ca3f049f_uniq` (`veterinario_id`,`mascota_id`),
  ADD KEY `AntoniaApp_veterinar_mascota_id_3254f648_fk_AntoniaAp` (`mascota_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antoniaapp_consulta`
--
ALTER TABLE `antoniaapp_consulta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `antoniaapp_dueño`
--
ALTER TABLE `antoniaapp_dueño`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `antoniaapp_mascota`
--
ALTER TABLE `antoniaapp_mascota`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `antoniaapp_veterinario`
--
ALTER TABLE `antoniaapp_veterinario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `antoniaapp_veterinario_mascotas_atendidas`
--
ALTER TABLE `antoniaapp_veterinario_mascotas_atendidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antoniaapp_consulta`
--
ALTER TABLE `antoniaapp_consulta`
  ADD CONSTRAINT `AntoniaApp_consulta_mascota_id_39c35593_fk_AntoniaApp_mascota_id` FOREIGN KEY (`mascota_id`) REFERENCES `antoniaapp_mascota` (`id`);

--
-- Constraints for table `antoniaapp_mascota`
--
ALTER TABLE `antoniaapp_mascota`
  ADD CONSTRAINT `AntoniaApp_mascota_dueño_id_1b3aee37_fk_AntoniaApp_dueño_id` FOREIGN KEY (`dueño_id`) REFERENCES `antoniaapp_dueño` (`id`);

--
-- Constraints for table `antoniaapp_veterinario_mascotas_atendidas`
--
ALTER TABLE `antoniaapp_veterinario_mascotas_atendidas`
  ADD CONSTRAINT `AntoniaApp_veterinar_mascota_id_3254f648_fk_AntoniaAp` FOREIGN KEY (`mascota_id`) REFERENCES `antoniaapp_mascota` (`id`),
  ADD CONSTRAINT `AntoniaApp_veterinar_veterinario_id_6f55dfdb_fk_AntoniaAp` FOREIGN KEY (`veterinario_id`) REFERENCES `antoniaapp_veterinario` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
