/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : yugo

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2018-11-11 14:59:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户', '6', 'add_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户', '6', 'change_user');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户', '6', 'delete_user');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 地址', '7', 'add_address');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 地址', '7', 'change_address');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 地址', '7', 'delete_address');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 商品图片', '8', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 商品图片', '8', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 商品图片', '8', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 商品SPU', '9', 'add_goods');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 商品SPU', '9', 'change_goods');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 商品SPU', '9', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 商品', '10', 'add_goodssku');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 商品', '10', 'change_goodssku');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 商品', '10', 'delete_goodssku');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 商品种类', '11', 'add_goodstype');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 商品种类', '11', 'change_goodstype');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 商品种类', '11', 'delete_goodstype');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 订单商品', '12', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 订单商品', '12', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 订单商品', '12', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 订单', '13', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 订单', '13', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 订单', '13', 'delete_orderinfo');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_yg_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_yg_user_id` FOREIGN KEY (`user_id`) REFERENCES `yg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-11-04 10:18:25.770272', '1', '蔬菜', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-11-04 10:18:40.254345', '2', '水果', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-11-04 10:19:24.246053', '3', '肉类', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-11-04 10:20:30.951150', '1', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-11-04 10:20:45.664498', '1', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-11-04 10:20:59.335520', '2', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-11-04 10:21:17.257606', '2', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-11-04 10:21:31.166676', '3', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-11-04 10:21:47.735143', '3', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-11-04 10:21:59.032421', '4', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-11-04 10:22:15.484225', '4', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-11-04 10:22:33.809604', '5', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-11-04 10:22:56.198663', '5', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-11-04 11:14:44.611039', '6', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2018-11-04 11:15:02.986209', '6', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2018-11-04 11:15:15.461164', '7', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2018-11-04 11:15:36.223085', '7', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2018-11-04 11:17:07.718475', '8', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2018-11-04 11:17:39.078636', '8', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2018-11-04 11:17:53.798140', '9', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2018-11-04 11:18:20.247328', '9', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2018-11-05 13:27:32.614485', '2', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2018-11-05 13:27:42.034967', '3', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"image\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2018-11-06 14:22:38.183190', '1', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2018-11-06 14:22:52.486151', '1', 'GoodsSKU object', '2', '[]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2018-11-06 14:22:55.747789', '1', 'GoodsSKU object', '2', '[]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2018-11-06 14:23:08.446083', '9', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2018-11-06 14:23:13.736432', '8', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2018-11-06 14:23:19.799258', '7', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2018-11-06 14:23:27.025563', '6', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2018-11-06 14:23:33.242236', '5', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2018-11-06 14:23:38.698581', '4', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2018-11-06 14:23:44.581349', '3', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2018-11-06 14:23:51.585306', '2', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2018-11-07 11:18:49.418048', '9', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2018-11-07 11:18:59.463969', '8', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2018-11-07 11:19:05.732841', '7', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2018-11-07 11:19:11.512292', '6', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2018-11-07 11:19:19.910994', '5', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"price\", \"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2018-11-07 11:19:29.019544', '4', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"price\", \"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2018-11-07 11:19:39.391992', '3', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"price\", \"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2018-11-07 11:19:56.352061', '2', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2018-11-07 11:20:05.582215', '1', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"price\", \"unite\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2018-11-07 11:20:59.835636', '10', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2018-11-07 11:21:23.248289', '10', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2018-11-07 11:21:26.812525', '10', 'GoodsSKU object', '2', '[]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2018-11-07 11:21:44.474314', '11', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2018-11-07 11:22:02.235295', '11', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2018-11-07 11:22:18.591068', '12', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2018-11-07 11:22:43.054770', '12', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2018-11-07 11:22:51.524227', '13', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2018-11-07 11:23:11.859159', '13', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2018-11-07 11:23:19.741243', '14', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2018-11-07 11:23:42.244328', '14', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2018-11-07 11:23:50.834872', '15', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2018-11-07 11:24:12.577048', '15', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2018-11-09 13:45:39.345526', '201811092145121', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2018-11-09 13:45:39.406588', '201811092141171', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2018-11-09 13:45:39.439616', '201811092137302', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2018-11-09 13:45:39.468632', '201811092134422', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2018-11-09 13:45:39.493659', '201811092132592', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2018-11-09 13:45:39.523721', '201811071936301', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2018-11-09 14:12:57.983446', '201811092208031', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2018-11-09 14:12:58.186722', '201811092146271', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2018-11-09 14:22:34.681279', '16', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2018-11-09 14:22:58.989363', '16', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2018-11-09 14:23:29.563978', '17', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2018-11-09 14:23:53.788367', '17', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2018-11-09 14:24:08.124562', '18', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2018-11-09 14:24:24.655188', '18', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2018-11-09 14:24:42.377833', '19', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2018-11-09 14:24:57.102400', '19', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2018-11-09 14:25:11.272781', '20', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2018-11-09 14:25:27.942343', '20', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2018-11-09 14:25:52.772476', '21', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2018-11-09 14:26:04.067649', '21', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2018-11-09 14:26:32.080606', '22', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2018-11-09 14:26:52.375722', '22', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2018-11-09 14:27:10.102581', '23', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2018-11-09 14:27:37.842860', '23', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2018-11-09 14:27:50.021431', '23', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2018-11-09 14:28:12.163204', '24', 'Goods object', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2018-11-09 14:28:34.190360', '24', 'GoodsSKU object', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2018-11-10 06:40:18.502358', '2', 'GoodsSKU object', '2', '[{\"changed\": {\"fields\": [\"stock\"]}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2018-11-10 07:18:45.035601', '201811092215431', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2018-11-10 07:18:45.162714', '201811092213131', 'OrderInfo object', '3', '', '13', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2018-11-10 08:47:00.258514', '5', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2018-11-10 08:49:47.174100', '5', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2018-11-10 08:50:35.112780', '5', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2018-11-10 08:52:08.438662', '5', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2018-11-10 08:56:58.061423', '5', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2018-11-10 08:58:18.240174', '5', 'Goods object', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'goodstype');
INSERT INTO `django_content_type` VALUES ('12', 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('13', 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'user', 'address');
INSERT INTO `django_content_type` VALUES ('6', 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-11-04 10:16:24.195957');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-11-04 10:16:25.046049');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-11-04 10:16:28.856237');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-11-04 10:16:29.526334');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-11-04 10:16:29.566311');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-11-04 10:16:29.616306');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-11-04 10:16:29.656292');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-11-04 10:16:29.696292');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-11-04 10:16:29.746295');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-11-04 10:16:29.786296');
INSERT INTO `django_migrations` VALUES ('11', 'user', '0001_initial', '2018-11-04 10:16:36.463260');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2018-11-04 10:16:38.223324');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2018-11-04 10:16:38.313329');
INSERT INTO `django_migrations` VALUES ('14', 'goods', '0001_initial', '2018-11-04 10:16:43.843723');
INSERT INTO `django_migrations` VALUES ('15', 'order', '0001_initial', '2018-11-04 10:16:44.463763');
INSERT INTO `django_migrations` VALUES ('16', 'order', '0002_auto_20181104_1816', '2018-11-04 10:16:50.754151');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2018-11-04 10:16:51.384192');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for yg_address
-- ----------------------------
DROP TABLE IF EXISTS `yg_address`;
CREATE TABLE `yg_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yg_address_user_id_1d13f465_fk_yg_user_id` (`user_id`),
  CONSTRAINT `yg_address_user_id_1d13f465_fk_yg_user_id` FOREIGN KEY (`user_id`) REFERENCES `yg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_address
-- ----------------------------
INSERT INTO `yg_address` VALUES ('1', '2018-11-05 13:40:24.261172', '2018-11-05 13:40:24.261172', '0', '小张', '四川省 成都市 金牛区', '641400', '18888888888', '1', '2');
INSERT INTO `yg_address` VALUES ('2', '2018-11-07 11:34:51.853430', '2018-11-07 11:34:51.854431', '0', '小张', '四川省成都高新区天府软件园D区世纪城南路216号', '610000', '18888888888', '1', '1');
INSERT INTO `yg_address` VALUES ('3', '2018-11-07 11:35:48.931233', '2018-11-07 11:35:48.931233', '0', '小张', '四川省宜宾市四川理工学院(白酒学院)', '644000', '18888888888', '0', '1');

-- ----------------------------
-- Table structure for yg_goods
-- ----------------------------
DROP TABLE IF EXISTS `yg_goods`;
CREATE TABLE `yg_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_goods
-- ----------------------------
INSERT INTO `yg_goods` VALUES ('1', '2018-11-04 10:20:30.917139', '2018-11-04 10:20:30.917139', '0', '菠菜', '');
INSERT INTO `yg_goods` VALUES ('2', '2018-11-04 10:20:59.239086', '2018-11-04 10:20:59.239086', '0', '洋葱', '');
INSERT INTO `yg_goods` VALUES ('3', '2018-11-04 10:21:31.165676', '2018-11-04 10:21:31.165676', '0', '豆角', '');
INSERT INTO `yg_goods` VALUES ('4', '2018-11-04 10:21:59.032421', '2018-11-04 10:21:59.032421', '0', '柠檬', '');
INSERT INTO `yg_goods` VALUES ('5', '2018-11-04 10:22:33.677814', '2018-11-10 08:58:18.121090', '0', '生菜', '');
INSERT INTO `yg_goods` VALUES ('6', '2018-11-04 11:14:44.610038', '2018-11-04 11:14:44.610038', '0', '苹果', '');
INSERT INTO `yg_goods` VALUES ('7', '2018-11-04 11:15:15.342010', '2018-11-04 11:15:15.343006', '0', '梨', '');
INSERT INTO `yg_goods` VALUES ('8', '2018-11-04 11:17:07.664986', '2018-11-04 11:17:07.664986', '0', '虾', '');
INSERT INTO `yg_goods` VALUES ('9', '2018-11-04 11:17:53.674956', '2018-11-04 11:17:53.674956', '0', '鱼', '');
INSERT INTO `yg_goods` VALUES ('10', '2018-11-07 11:20:59.705348', '2018-11-07 11:20:59.705348', '0', '西兰花', '');
INSERT INTO `yg_goods` VALUES ('11', '2018-11-07 11:21:44.439217', '2018-11-07 11:21:44.439217', '0', '西红柿', '');
INSERT INTO `yg_goods` VALUES ('12', '2018-11-07 11:22:18.557971', '2018-11-07 11:22:18.557971', '0', '苦瓜', '');
INSERT INTO `yg_goods` VALUES ('13', '2018-11-07 11:22:51.406978', '2018-11-07 11:22:51.406978', '0', '黄瓜', '');
INSERT INTO `yg_goods` VALUES ('14', '2018-11-07 11:23:19.669832', '2018-11-07 11:23:19.669832', '0', '香蕉', '');
INSERT INTO `yg_goods` VALUES ('15', '2018-11-07 11:23:50.718887', '2018-11-07 11:23:50.718887', '0', '猕猴桃', '');
INSERT INTO `yg_goods` VALUES ('16', '2018-11-09 14:22:34.559612', '2018-11-09 14:22:34.559612', '0', '本地柠檬', '');
INSERT INTO `yg_goods` VALUES ('17', '2018-11-09 14:23:29.535719', '2018-11-09 14:23:29.535719', '0', '葡萄', '');
INSERT INTO `yg_goods` VALUES ('18', '2018-11-09 14:24:08.000246', '2018-11-09 14:24:08.000246', '0', '草莓', '');
INSERT INTO `yg_goods` VALUES ('19', '2018-11-09 14:24:42.266004', '2018-11-09 14:24:42.266004', '0', '柑橘', '');
INSERT INTO `yg_goods` VALUES ('20', '2018-11-09 14:25:11.139035', '2018-11-09 14:25:11.139035', '0', '桃', '');
INSERT INTO `yg_goods` VALUES ('21', '2018-11-09 14:25:52.750393', '2018-11-09 14:25:52.750393', '0', '枣', '');
INSERT INTO `yg_goods` VALUES ('22', '2018-11-09 14:26:31.952820', '2018-11-09 14:26:31.952820', '0', '新疆梨', '');
INSERT INTO `yg_goods` VALUES ('23', '2018-11-09 14:27:10.069558', '2018-11-09 14:27:37.712481', '0', '青苹果', '');
INSERT INTO `yg_goods` VALUES ('24', '2018-11-09 14:28:12.064078', '2018-11-09 14:28:12.064078', '0', '樱桃', '');

-- ----------------------------
-- Table structure for yg_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `yg_goods_image`;
CREATE TABLE `yg_goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yg_goods_image_sku_id_bcbc5c45_fk_yg_goods_sku_id` (`sku_id`),
  CONSTRAINT `yg_goods_image_sku_id_bcbc5c45_fk_yg_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `yg_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_goods_image
-- ----------------------------

-- ----------------------------
-- Table structure for yg_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `yg_goods_sku`;
CREATE TABLE `yg_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yg_goods_sku_goods_id_970f0ac0_fk_yg_goods_id` (`goods_id`),
  KEY `yg_goods_sku_type_id_e3d9cf1e_fk_yg_goods_type_id` (`type_id`),
  CONSTRAINT `yg_goods_sku_goods_id_970f0ac0_fk_yg_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `yg_goods` (`id`),
  CONSTRAINT `yg_goods_sku_type_id_e3d9cf1e_fk_yg_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `yg_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_goods_sku
-- ----------------------------
INSERT INTO `yg_goods_sku` VALUES ('1', '2018-11-04 10:20:45.622479', '2018-11-07 11:20:05.465590', '0', '菠菜', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '4.00', '500克', 'images/product/01.jpg', '12', '21', '1', '1', '1');
INSERT INTO `yg_goods_sku` VALUES ('2', '2018-11-04 10:21:17.234588', '2018-11-10 06:40:18.404958', '0', '豆角', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '3.00', '500克', 'images/product/03.jpg', '997', '24', '1', '2', '1');
INSERT INTO `yg_goods_sku` VALUES ('3', '2018-11-04 10:21:47.733142', '2018-11-07 11:19:39.283539', '0', '洋葱', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '6.00', '500克', 'images/product/02.jpg', '4', '11', '1', '3', '1');
INSERT INTO `yg_goods_sku` VALUES ('4', '2018-11-04 10:22:15.482241', '2018-11-07 11:19:28.910720', '0', '柠檬', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '7.00', '500克', 'images/product/04.jpg', '11', '13', '1', '4', '2');
INSERT INTO `yg_goods_sku` VALUES ('5', '2018-11-04 10:22:56.196663', '2018-11-07 11:19:19.671710', '0', '生菜', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '2.00', '500克', 'images/product/05.jpg', '5', '21', '1', '5', '1');
INSERT INTO `yg_goods_sku` VALUES ('6', '2018-11-04 11:15:02.963210', '2018-11-07 11:19:11.369763', '0', '苹果', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '6.00', '500克', 'images/product/06.jpg', '993', '56', '1', '6', '2');
INSERT INTO `yg_goods_sku` VALUES ('7', '2018-11-04 11:15:36.220081', '2018-11-07 11:19:05.620798', '0', '梨', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '5.00', '500克', 'images/product/09.jpg', '199', '101', '1', '7', '2');
INSERT INTO `yg_goods_sku` VALUES ('8', '2018-11-04 11:17:39.051600', '2018-11-07 11:18:59.434825', '0', '虾', '哒哒哒哒哒哒虾', '20.00', '500克', 'images/product/goods018.jpg', '45', '10', '1', '8', '3');
INSERT INTO `yg_goods_sku` VALUES ('9', '2018-11-04 11:18:20.229315', '2018-11-07 11:18:49.150842', '0', '鱼', '哒哒哒哒哒哒鱼', '8.00', '500克', 'images/product/goods020.jpg', '10', '5', '1', '9', '3');
INSERT INTO `yg_goods_sku` VALUES ('10', '2018-11-07 11:21:23.159730', '2018-11-07 11:21:26.792429', '0', '西兰花', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '6.00', '500克', 'images/product/07.jpg', '60', '19', '1', '10', '1');
INSERT INTO `yg_goods_sku` VALUES ('11', '2018-11-07 11:22:02.221281', '2018-11-07 11:22:02.221281', '0', '西红柿', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '3.00', '500克', 'images/product/010.jpg', '45', '35', '1', '11', '1');
INSERT INTO `yg_goods_sku` VALUES ('12', '2018-11-07 11:22:43.031627', '2018-11-07 11:22:43.032613', '0', '苦瓜', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '3.00', '500克', 'images/product/011.jpg', '62', '28', '1', '12', '1');
INSERT INTO `yg_goods_sku` VALUES ('13', '2018-11-07 11:23:11.831927', '2018-11-07 11:23:11.831927', '0', '黄瓜', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '2.00', '500克', 'images/product/012.jpg', '81', '74', '1', '13', '1');
INSERT INTO `yg_goods_sku` VALUES ('14', '2018-11-07 11:23:42.217296', '2018-11-07 11:23:42.217296', '0', '香蕉', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '5.00', '500克', 'images/product/goods009.jpg', '27', '13', '1', '14', '2');
INSERT INTO `yg_goods_sku` VALUES ('15', '2018-11-07 11:24:12.558036', '2018-11-07 11:24:12.558036', '0', '猕猴桃', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '7.00', '500克', 'images/product/goods012.jpg', '20', '6', '1', '15', '2');
INSERT INTO `yg_goods_sku` VALUES ('16', '2018-11-09 14:22:58.970290', '2018-11-09 14:22:58.970290', '0', '本地柠檬', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '6.00', '500克', 'images/product/goods001.jpg', '100', '19', '1', '16', '2');
INSERT INTO `yg_goods_sku` VALUES ('17', '2018-11-09 14:23:53.680059', '2018-11-09 14:23:53.680059', '0', '葡萄', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '6.00', '500克', 'images/product/goods002.jpg', '100', '30', '1', '17', '2');
INSERT INTO `yg_goods_sku` VALUES ('18', '2018-11-09 14:24:24.632170', '2018-11-09 14:24:24.632170', '0', '草莓', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '5.00', '500克', 'images/product/goods003.jpg', '100', '15', '1', '18', '2');
INSERT INTO `yg_goods_sku` VALUES ('19', '2018-11-09 14:24:57.083400', '2018-11-09 14:24:57.083400', '0', '柑橘', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '4.00', '500克', 'images/product/goods004.jpg', '100', '23', '1', '19', '2');
INSERT INTO `yg_goods_sku` VALUES ('20', '2018-11-09 14:25:27.923343', '2018-11-09 14:25:27.923343', '0', '桃', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '4.00', '500克', 'images/product/goods005.jpg', '150', '31', '1', '20', '2');
INSERT INTO `yg_goods_sku` VALUES ('21', '2018-11-09 14:26:04.048634', '2018-11-09 14:26:04.048634', '0', '枣', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '3.00', '500克', 'images/product/goods006.jpg', '200', '50', '1', '21', '2');
INSERT INTO `yg_goods_sku` VALUES ('22', '2018-11-09 14:26:52.350704', '2018-11-09 14:26:52.350704', '0', '新疆梨', '1111', '6.00', '500克', 'images/product/goods007.jpg', '200', '57', '1', '22', '2');
INSERT INTO `yg_goods_sku` VALUES ('23', '2018-11-09 14:27:50.003180', '2018-11-09 14:27:50.003180', '0', '青苹果', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '4.00', '500克', 'images/product/goods010.jpg', '160', '56', '1', '23', '2');
INSERT INTO `yg_goods_sku` VALUES ('24', '2018-11-09 14:28:34.169356', '2018-11-09 14:28:34.169356', '0', '樱桃', '生菜营养含量丰富，含有大量β胡萝卜素、抗氧化物、维生素B1、B6 、维生素E、维生素C，还有大量膳食纤维素和微量元素如镁、磷、钙及少量的铁、铜、锌。加强蛋白质和脂肪的消化与吸收，改善肠胃的血液循环可以常吃生菜.生菜性质甘凉，因其茎叶中含有莴苣素，故味微苦，有清热提神、镇痛催眠、降低胆固醇、辅助治疗神经衰弱等功效。生菜中含有甘露醇等有效成分，有利尿和促进血液循环、清肝利胆及养胃的功效', '7.00', '500克', 'images/product/goods017.jpg', '56', '21', '1', '24', '2');

-- ----------------------------
-- Table structure for yg_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `yg_goods_type`;
CREATE TABLE `yg_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_goods_type
-- ----------------------------
INSERT INTO `yg_goods_type` VALUES ('1', '2018-11-04 10:18:25.740249', '2018-11-04 10:18:25.740249', '0', '蔬菜', 'vegetables', 'type/1.jpg');
INSERT INTO `yg_goods_type` VALUES ('2', '2018-11-04 10:18:40.220317', '2018-11-04 10:18:40.220317', '0', '水果', 'fruit', 'type/2.jpg');
INSERT INTO `yg_goods_type` VALUES ('3', '2018-11-04 10:19:24.223041', '2018-11-04 10:19:24.223041', '0', '肉类', 'meet', 'type/3.jpg');

-- ----------------------------
-- Table structure for yg_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `yg_order_goods`;
CREATE TABLE `yg_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yg_order_goods_order_id_db4510a5_fk_yg_order_info_order_id` (`order_id`),
  KEY `yg_order_goods_sku_id_7fd6bc03_fk_yg_goods_sku_id` (`sku_id`),
  CONSTRAINT `yg_order_goods_order_id_db4510a5_fk_yg_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `yg_order_info` (`order_id`),
  CONSTRAINT `yg_order_goods_sku_id_7fd6bc03_fk_yg_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `yg_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_order_goods
-- ----------------------------
INSERT INTO `yg_order_goods` VALUES ('18', '2018-11-10 07:18:58.514877', '2018-11-10 07:58:00.248399', '0', '1', '3.00', '豆角好啊,真是好啊!', '201811101518581', '2');
INSERT INTO `yg_order_goods` VALUES ('19', '2018-11-10 08:59:37.275033', '2018-11-10 08:59:37.275033', '0', '1', '3.00', '', '201811101659371', '2');
INSERT INTO `yg_order_goods` VALUES ('20', '2018-11-10 08:59:37.340508', '2018-11-10 08:59:37.340508', '0', '1', '6.00', '', '201811101659371', '22');
INSERT INTO `yg_order_goods` VALUES ('21', '2018-11-10 08:59:37.344511', '2018-11-10 08:59:37.344511', '0', '1', '2.00', '', '201811101659371', '13');

-- ----------------------------
-- Table structure for yg_order_info
-- ----------------------------
DROP TABLE IF EXISTS `yg_order_info`;
CREATE TABLE `yg_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `yg_order_info_addr_id_3f774226_fk_yg_address_id` (`addr_id`),
  KEY `yg_order_info_user_id_26c5874a_fk_yg_user_id` (`user_id`),
  CONSTRAINT `yg_order_info_addr_id_3f774226_fk_yg_address_id` FOREIGN KEY (`addr_id`) REFERENCES `yg_address` (`id`),
  CONSTRAINT `yg_order_info_user_id_26c5874a_fk_yg_user_id` FOREIGN KEY (`user_id`) REFERENCES `yg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_order_info
-- ----------------------------
INSERT INTO `yg_order_info` VALUES ('2018-11-10 07:18:58.497867', '2018-11-10 07:58:00.391073', '0', '201811101518581', '3', '1', '3.00', '10.00', '5', '2018111022001432100500550349', '2', '1');
INSERT INTO `yg_order_info` VALUES ('2018-11-10 08:59:37.066208', '2018-11-10 08:59:37.345512', '0', '201811101659371', '3', '3', '11.00', '10.00', '1', '', '2', '1');

-- ----------------------------
-- Table structure for yg_user
-- ----------------------------
DROP TABLE IF EXISTS `yg_user`;
CREATE TABLE `yg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_user
-- ----------------------------
INSERT INTO `yg_user` VALUES ('1', 'pbkdf2_sha256$36000$5UEamKBjoOgO$AlkmvvTWIeIDxrNBoLpd+M3+kmnqRzUQVTfmTLuth6o=', '2018-11-10 08:20:52.611973', '1', 'miao', '', '', '', '1', '1', '2018-11-04 10:17:36.013020', '2018-11-04 10:17:36.042963', '2018-11-04 10:17:36.042963', '0');
INSERT INTO `yg_user` VALUES ('2', 'pbkdf2_sha256$36000$qTGkTl8fA6cU$IW/f/yMKZ2XJL9cwBidsTuUASe6D22P77RSbfsU/0Vw=', '2018-11-08 13:17:18.819432', '0', 'huangpro', '', '', 'zj20162325@163.com', '0', '1', '2018-11-05 13:36:47.938517', '2018-11-05 13:36:47.973526', '2018-11-05 13:36:56.438428', '0');

-- ----------------------------
-- Table structure for yg_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `yg_user_groups`;
CREATE TABLE `yg_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yg_user_groups_user_id_group_id_b2256984_uniq` (`user_id`,`group_id`),
  KEY `yg_user_groups_group_id_5b66c2fd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `yg_user_groups_group_id_5b66c2fd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `yg_user_groups_user_id_002ad5e9_fk_yg_user_id` FOREIGN KEY (`user_id`) REFERENCES `yg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for yg_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `yg_user_user_permissions`;
CREATE TABLE `yg_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yg_user_user_permissions_user_id_permission_id_57d8c56b_uniq` (`user_id`,`permission_id`),
  KEY `yg_user_user_permiss_permission_id_f7c93382_fk_auth_perm` (`permission_id`),
  CONSTRAINT `yg_user_user_permiss_permission_id_f7c93382_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `yg_user_user_permissions_user_id_aad9893c_fk_yg_user_id` FOREIGN KEY (`user_id`) REFERENCES `yg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yg_user_user_permissions
-- ----------------------------
