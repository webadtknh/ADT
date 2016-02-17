#
# TABLE STRUCTURE FOR: dose
#

DROP TABLE IF EXISTS dose;

CREATE TABLE `dose` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `frequency` varchar(1) DEFAULT NULL,
  `Active` int(11) NOT NULL DEFAULT '1',
  `ccc_store_sp` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `ccc_store_sp` (`ccc_store_sp`),
  CONSTRAINT `dose_ibfk_1` FOREIGN KEY (`ccc_store_sp`) REFERENCES `ccc_store_service_point` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (1, '1/2BD', '0.5', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (2, '1/2OD', '0.5', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (3, '1/2QDS', '0.5', '4', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (4, '1/2TDS', '0.5', '3', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (5, '1am,1/2pm', '0.75', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (6, '1BD', '1', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (7, '1OD', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (8, '1QDS', '1', '4', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (9, '1TDS', '1', '3', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (10, '2am,1pm', '1.5', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (11, '2BD', '2', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (12, '2OD', '2', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (13, '2QDS', '2', '4', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (14, '2TDS', '2', '3', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (15, '3am,2pm', '2.5', '2', 0, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (16, '3BD', '3', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (17, '5BD', '5', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (18, 'apply od', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (19, 'gargle BD', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (20, 'gargle od', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (21, 'insert noc', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (22, '2.5ML BD', '5', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (23, '5ML OD', '5', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (24, '5ML QID', '5', '4', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (25, '1.5OD', '1.5', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (26, 'apply BD', '1', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (27, '10MLS OD', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (28, '5MLS TDS', '5', '3', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (29, '10MLS TDS', '1', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (30, '10mls BD', '1', '2', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (31, '3OD', '3', '1', 1, 2);
INSERT INTO dose (`id`, `Name`, `value`, `frequency`, `Active`, `ccc_store_sp`) VALUES (32, '4BD', '4', '2', 1, 2);


