-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 01 Oca 2024, 20:05:15
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `uls_modeli_secimi_kds`
--

DELIMITER $$
--
-- Yordamlar
--
DROP PROCEDURE IF EXISTS `canakkale_demir_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `canakkale_demir_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu as "canakkale-izmir arası demir yolu mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 17$$

DROP PROCEDURE IF EXISTS `canakkale_deniz_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `canakkale_deniz_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu as "canakkale-izmir arası deniz yolu mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 17$$

DROP PROCEDURE IF EXISTS `canakkale_hava_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `canakkale_hava_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi as "canakkale-izmir arası ucus mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 17$$

DROP PROCEDURE IF EXISTS `canakkale_kara_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `canakkale_kara_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu as "canakkale-izmir arası kara yolu mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 17$$

DROP PROCEDURE IF EXISTS `cevre_enerji`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevre_enerji` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", cevresel_ozellikler.enerji_tuketimi_yuzde as "Enerji Tüketimi(%)"
FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id$$

DROP PROCEDURE IF EXISTS `cevre_gurultu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevre_gurultu` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", cevresel_ozellikler.gurultu_kirliligi_yuzde as "Gürültü Kirliliği(%)"
FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id$$

DROP PROCEDURE IF EXISTS `cevre_isi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevre_isi` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", cevresel_ozellikler.isi_kirliligi_yuzde as "Isı Kirliliği(%)"
FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id$$

DROP PROCEDURE IF EXISTS `cevre_ozon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevre_ozon` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", cevresel_ozellikler.ozn_tbk_zararli_gaz_emisyonu as "Ozon Tabakasına Zararlı Gazların Emisyonu(%)"
FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id$$

DROP PROCEDURE IF EXISTS `cevre_sera`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevre_sera` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", cevresel_ozellikler.sera_gazi_emisyonu as "Sera Gazı Emisyonu(%)"
FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id$$

DROP PROCEDURE IF EXISTS `cevre_su`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cevre_su` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", cevresel_ozellikler.su_kirliligi_yuzde as "Su Kirliliği(%)"
FROM ulastirma_modelleri LEFT JOIN cevresel_ozellikler ON ulastirma_modelleri.c_id = cevresel_ozellikler.c_id$$

DROP PROCEDURE IF EXISTS `ekonomik_arac_kapasitesi_max`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ekonomik_arac_kapasitesi_max` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", ekonomik_ozellikler.arac_kapasitesi_max_ton as "Maksimum Araç Kapasitesi"
FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id$$

DROP PROCEDURE IF EXISTS `ekonomik_maliyet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ekonomik_maliyet` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", ekonomik_ozellikler.maliyet as "Maliyet(Likert Ölçeği)"
FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id$$

DROP PROCEDURE IF EXISTS `ekonomik_min_arac_kapasite`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ekonomik_min_arac_kapasite` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", ekonomik_ozellikler.arac_kapasitesi_min_ton as "Minimum Araç Kapasitesi(ton)"
FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id$$

DROP PROCEDURE IF EXISTS `ekonomik_rekabet`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ekonomik_rekabet` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", ekonomik_ozellikler.rekabet_derecesi as "Rekabet"
FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id$$

DROP PROCEDURE IF EXISTS `istanbul_demir_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `istanbul_demir_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu as "İstanbul-İzmir demir yolu mesafesi"
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 34$$

DROP PROCEDURE IF EXISTS `istanbul_deniz_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `istanbul_deniz_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu as "İstanbul-İzmir deniz yolu mesafesi"
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 34$$

DROP PROCEDURE IF EXISTS `istanbul_hava_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `istanbul_hava_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi as "İstanbul-İzmir arası uçuş mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 34$$

DROP PROCEDURE IF EXISTS `istanbul_kara_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `istanbul_kara_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu as "İstanbul-İzmir arası kara yolu mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 34$$

DROP PROCEDURE IF EXISTS `ortalama_tasima_mesafesi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ortalama_tasima_mesafesi` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", ekonomik_ozellikler.ort_tasima_mesafesi_mil as "Ortalama Tasima Mesafesi(mil)"
FROM ulastirma_modelleri LEFT JOIN ekonomik_ozellikler ON ulastirma_modelleri.e_id = ekonomik_ozellikler.e_id$$

DROP PROCEDURE IF EXISTS `performans_erisilebilirlik`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `performans_erisilebilirlik` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", performans_ozellikleri.erisebilirlik as "Erişilebilirlik"
FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id$$

DROP PROCEDURE IF EXISTS `performans_esneklik`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `performans_esneklik` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", performans_ozellikleri.esneklik as "Esneklik"
FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id$$

DROP PROCEDURE IF EXISTS `performans_hiz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `performans_hiz` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", performans_ozellikleri.hiz as "Hız"
FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id$$

DROP PROCEDURE IF EXISTS `performans_kayip_hasar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `performans_kayip_hasar` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", performans_ozellikleri.kayip_hasar_ihtimali as "Kayıp ve Hasar İhtimali"
FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id$$

DROP PROCEDURE IF EXISTS `performans_tutarlilik`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `performans_tutarlilik` ()   SELECT ulastirma_modelleri.u_model_adi as "Ulaştırma Modeli", performans_ozellikleri.tutarlilik as "Tutarlılık"
FROM ulastirma_modelleri LEFT JOIN performans_ozellikleri ON ulastirma_modelleri.p_id = performans_ozellikleri.p_id$$

DROP PROCEDURE IF EXISTS `sevkiyat_sehir_sayisi`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sevkiyat_sehir_sayisi` ()   SELECT COUNT(sevkiyat_yapilan_iller.plaka) AS "Sevkiyat Yapılan Toplam İl"
FROM sevkiyat_yapilan_iller$$

DROP PROCEDURE IF EXISTS `tekirdag_demir_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tekirdag_demir_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu as "tekirdağ-izmir arası demir yolu mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 59$$

DROP PROCEDURE IF EXISTS `tekirdag_deniz_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tekirdag_deniz_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu as "tekirdağ-izmir arası deniz mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 59$$

DROP PROCEDURE IF EXISTS `tekirdag_hava_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tekirdag_hava_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi as "tekirdağ-izmir arası ucus mesafesi."
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 59$$

DROP PROCEDURE IF EXISTS `tekirdag_kara_yolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tekirdag_kara_yolu` ()   SELECT sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu as "tekirdağ-izmir kara yolu uzaklık"
FROM sevkiyat_yapilan_iller
WHERE sevkiyat_yapilan_iller.plaka = 59$$

DROP PROCEDURE IF EXISTS `toplam_mil_demiryolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `toplam_mil_demiryolu` ()   SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_demir_yolu) as "demir yolu toplam mil"
FROM sevkiyat_yapilan_iller$$

DROP PROCEDURE IF EXISTS `toplam_mil_denizyolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `toplam_mil_denizyolu` ()   SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_deniz_yolu) as "Toplam Mil Deniz Yolu"
FROM sevkiyat_yapilan_iller$$

DROP PROCEDURE IF EXISTS `toplam_mil_havayolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `toplam_mil_havayolu` ()   SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_ucus_mesafesi) AS "Toplam Ucus Mesafesi"
FROM sevkiyat_yapilan_iller$$

DROP PROCEDURE IF EXISTS `toplam_mil_karayolu`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `toplam_mil_karayolu` ()   SELECT SUM(sevkiyat_yapilan_iller.izmire_uzaklik_kara_yolu) as "toplam karayolu uzaklik"
FROM sevkiyat_yapilan_iller$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cevresel_ozellikler`
--

DROP TABLE IF EXISTS `cevresel_ozellikler`;
CREATE TABLE IF NOT EXISTS `cevresel_ozellikler` (
  `c_id` int NOT NULL,
  `gurultu_kirliligi_yuzde` int NOT NULL,
  `su_kirliligi_yuzde` int NOT NULL,
  `isi_kirliligi_yuzde` int NOT NULL,
  `enerji_tuketimi_yuzde` int NOT NULL,
  `ozn_tbk_zararli_gaz_emisyonu` int NOT NULL,
  `sera_gazi_emisyonu` int NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `cevresel_ozellikler`
--

INSERT INTO `cevresel_ozellikler` (`c_id`, `gurultu_kirliligi_yuzde`, `su_kirliligi_yuzde`, `isi_kirliligi_yuzde`, `enerji_tuketimi_yuzde`, `ozn_tbk_zararli_gaz_emisyonu`, `sera_gazi_emisyonu`) VALUES
(35001, 57, 48, 78, 83, 62, 86),
(35002, 35, 27, 40, 47, 58, 38),
(35003, 77, 23, 94, 91, 80, 90),
(35004, 28, 78, 53, 62, 57, 55);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ekonomik_ozellikler`
--

DROP TABLE IF EXISTS `ekonomik_ozellikler`;
CREATE TABLE IF NOT EXISTS `ekonomik_ozellikler` (
  `e_id` int NOT NULL,
  `maliyet` int NOT NULL,
  `rekabet_derecesi` int NOT NULL,
  `ort_tasima_mesafesi_mil` int NOT NULL,
  `arac_kapasitesi_min_ton` int NOT NULL,
  `arac_kapasitesi_max_ton` int NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `ekonomik_ozellikler`
--

INSERT INTO `ekonomik_ozellikler` (`e_id`, `maliyet`, `rekabet_derecesi`, `ort_tasima_mesafesi_mil`, `arac_kapasitesi_min_ton`, `arac_kapasitesi_max_ton`) VALUES
(44001, 6, 9, 515, 10, 25),
(44002, 5, 4, 617, 50, 120000),
(44003, 8, 6, 885, 5, 125),
(44004, 4, 4, 1367, 1000, 60000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `performans_ozellikleri`
--

DROP TABLE IF EXISTS `performans_ozellikleri`;
CREATE TABLE IF NOT EXISTS `performans_ozellikleri` (
  `p_id` int NOT NULL,
  `hiz` int NOT NULL,
  `esneklik` int NOT NULL,
  `kayip_hasar_ihtimali` int NOT NULL,
  `tutarlilik` int NOT NULL,
  `erisebilirlik` int NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `performans_ozellikleri`
--

INSERT INTO `performans_ozellikleri` (`p_id`, `hiz`, `esneklik`, `kayip_hasar_ihtimali`, `tutarlilik`, `erisebilirlik`) VALUES
(61001, 6, 9, 3, 8, 9),
(61002, 5, 4, 5, 6, 4),
(61003, 9, 6, 2, 9, 6),
(61004, 3, 2, 4, 4, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sevkiyat_yapilan_iller`
--

DROP TABLE IF EXISTS `sevkiyat_yapilan_iller`;
CREATE TABLE IF NOT EXISTS `sevkiyat_yapilan_iller` (
  `plaka` int NOT NULL,
  `il_ad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `izmire_uzaklik_kara_yolu` int NOT NULL,
  `izmire_uzaklik_ucus_mesafesi` int NOT NULL,
  `izmire_uzaklik_deniz_yolu` int NOT NULL,
  `izmire_uzaklik_demir_yolu` int NOT NULL,
  PRIMARY KEY (`plaka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `sevkiyat_yapilan_iller`
--

INSERT INTO `sevkiyat_yapilan_iller` (`plaka`, `il_ad`, `izmire_uzaklik_kara_yolu`, `izmire_uzaklik_ucus_mesafesi`, `izmire_uzaklik_deniz_yolu`, `izmire_uzaklik_demir_yolu`) VALUES
(17, 'Çanakkale', 198, 126, 203, 126),
(34, 'İstanbul', 298, 214, 320, 204),
(59, 'Tekirdağ', 241, 187, 356, 321);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ulastirma_modelleri`
--

DROP TABLE IF EXISTS `ulastirma_modelleri`;
CREATE TABLE IF NOT EXISTS `ulastirma_modelleri` (
  `u_id` int NOT NULL,
  `u_model_adi` varchar(50) COLLATE utf8mb3_turkish_ci NOT NULL,
  `e_id` int NOT NULL,
  `p_id` int NOT NULL,
  `c_id` int NOT NULL,
  PRIMARY KEY (`u_id`),
  KEY `e_id` (`e_id`),
  KEY `p_id` (`p_id`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `ulastirma_modelleri`
--

INSERT INTO `ulastirma_modelleri` (`u_id`, `u_model_adi`, `e_id`, `p_id`, `c_id`) VALUES
(1, 'KARA YOLU', 44001, 61001, 35001),
(2, 'DEMİR YOLU', 44002, 61002, 35002),
(3, 'HAVA YOLU', 44003, 61003, 35003),
(4, 'DENİZ YOLU', 44004, 61004, 35004);

--
-- Tetikleyiciler `ulastirma_modelleri`
--
DROP TRIGGER IF EXISTS `uls_model_ad_buyuk_harf`;
DELIMITER $$
CREATE TRIGGER `uls_model_ad_buyuk_harf` BEFORE INSERT ON `ulastirma_modelleri` FOR EACH ROW SET new.u_model_adi = UPPER(new.u_model_adi)
$$
DELIMITER ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ulastirma_modelleri`
--
ALTER TABLE `ulastirma_modelleri`
  ADD CONSTRAINT `c_ulastirma` FOREIGN KEY (`c_id`) REFERENCES `cevresel_ozellikler` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_ulastirma` FOREIGN KEY (`e_id`) REFERENCES `ekonomik_ozellikler` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `p_ulastirma` FOREIGN KEY (`p_id`) REFERENCES `performans_ozellikleri` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
