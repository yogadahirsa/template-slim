DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE `penilaian` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pendaftar_id` int(9) UNSIGNED NOT NULL,
  `penilai_id` int(9) UNSIGNED NOT NULL,
  `penilaian_kinerja` JSON,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `penjurian`;
CREATE TABLE `penjurian` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pendaftar_id` int(9) UNSIGNED NOT NULL,
  `penilai_id` int(9) UNSIGNED NOT NULL,
  `tahap` smallint(3) UNSIGNED NOT NULL,
  `penjurian` JSON,
  PRIMARY KEY (`id`)
);

fadlanmuzakki@Gmail.com:539516

alter table penjurian add is_accepted smallint(3) default 1;