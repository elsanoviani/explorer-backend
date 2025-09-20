-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "_prisma_migrations" ---------------------------
CREATE TABLE `_prisma_migrations`( 
	`id` VarChar( 36 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`checksum` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`finished_at` DateTime NULL DEFAULT NULL,
	`migration_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`logs` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`rolled_back_at` DateTime NULL DEFAULT NULL,
	`started_at` DateTime NOT NULL DEFAULT 'CURRENT_TIMESTAMP(3)',
	`applied_steps_count` Int( 0 ) UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "Folder" ---------------------------------------
CREATE TABLE `Folder`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`parent_id` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "File" -----------------------------------------
CREATE TABLE `File`( 
	`id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`type` VarChar( 191 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`folder_id` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- Dump data of "_prisma_migrations" -----------------------
BEGIN;

INSERT INTO `_prisma_migrations`(`id`,`checksum`,`finished_at`,`migration_name`,`logs`,`rolled_back_at`,`started_at`,`applied_steps_count`) VALUES 
( '5345c288-7716-4a4d-b2d8-80076e392497', '68af19f842ba2149957aba9d1512265661ec630b8f145f9b62f0a1488a5ef7df', '2025-09-20 02:52:46.639', '20250920025246_add_files_or_tags', NULL, NULL, '2025-09-20 02:52:46.617', '1' ),
( 'e855e7db-5137-4a99-9238-e18954ed463f', 'dfcf68b73aae3a67b9500fa8b2a7f2104ff0d3f6755c83ac22588c7cf981ab41', '2025-09-19 06:55:25.246', '20250919065525_init', NULL, NULL, '2025-09-19 06:55:25.212', '1' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "Folder" -----------------------------------
BEGIN;

INSERT INTO `Folder`(`id`,`name`,`parent_id`) VALUES 
( '1', 'Root', NULL ),
( '2', 'Documents', '1' ),
( '3', 'Pictures', '1' ),
( '4', 'Music', '1' ),
( '5', 'Work', '2' ),
( '6', 'Vacation', '3' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "File" -------------------------------------
BEGIN;

INSERT INTO `File`(`id`,`name`,`type`,`folder_id`) VALUES 
( '1', 'README.md', 'text', '1' ),
( '2', 'index.html', 'html', '2' ),
( '3', 'style.css', 'css', '2' ),
( '4', 'guide.pdf', 'pdf', '6' ),
( '5', 'indie.html', 'html', '4' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "Folder_parent_id_fkey" ------------------------
CREATE INDEX `Folder_parent_id_fkey` USING BTREE ON `Folder`( `parent_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "File_folder_id_fkey" --------------------------
CREATE INDEX `File_folder_id_fkey` USING BTREE ON `File`( `folder_id` );
-- -------------------------------------------------------------


-- CREATE LINK "Folder_parent_id_fkey" -------------------------
ALTER TABLE `Folder`
	ADD CONSTRAINT `Folder_parent_id_fkey` FOREIGN KEY ( `parent_id` )
	REFERENCES `Folder`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "File_folder_id_fkey" ---------------------------
ALTER TABLE `File`
	ADD CONSTRAINT `File_folder_id_fkey` FOREIGN KEY ( `folder_id` )
	REFERENCES `Folder`( `id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


