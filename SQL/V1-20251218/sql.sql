
1216-软件包上传, -------------------------------------  已个更新2个环境

# 64
INSERT INTO `aika`.`app` (

  `name`,
  `url`,
  `icon_url`,
  `package_name`,
  
  `size`,
  `size_info`,
    `md5`,
	
  `ver`,
  `ver_code`

) 
VALUES
  (

    '全民K歌',
    'http://cdn.breakspeaker.com/global/com.tencent.karaoketv_5.6.4.1.apk',
    'http://cdn.breakspeaker.com/global/karaoketv_5641.png',
    'com.tencent.karaoketv',
	
    '46269115',
    '45M',
   'cf9298357350f56a63722056489aaa2a',
   
    '5.6.4.1',
    '264'
   
  ) ;



#65

INSERT INTO `aika`.`app` (

  `name`,
  `url`,
  `icon_url`,
  `package_name`,
  
    `ver`,
  `ver_code`,
  
  `size`,
  `size_info`,
    `md5`
	


) 
VALUES
  (

    'Stingray',
    'http://cdn.breakspeaker.com/global/com.stingray.karaoke.ikarao_6.6.3.apk',
    'http://cdn.breakspeaker.com/global/stingray_663.png',
    'com.stingray.karaoke.ikarao',
	
	'6.6.3',
    '60603',
	
    '18704072',
    '18M',
   '4179f94eccd471c46a180bcdfd958417'
   

  ) ;



#66

INSERT INTO `aika`.`app` (
`id`,
  `name`,
  `url`,
  `icon_url`,
  `package_name`,
  
    `ver`,
  `ver_code`,
  
  `size`,
  `size_info`,
    `md5`
	


) 
VALUES
  (
	'66',
    'Anghami',
    'http://cdn.breakspeaker.com/global/com.anghami_8.0.4.xapk',
    'http://cdn.breakspeaker.com/global/anghami_802.png',
    'com.anghami',
	
	'8.0.4',
    '8000040',
	
    '89613589',
    '86M',
   '33afabbb524b46c0dae38692c31a505b'
   

  ) ;

##################################################################




# 30,31,32  appid要改 -----------------------------------未执行prd 



INSERT INTO `aika`.`app_rule` (
 
  `model`,
  `region`,
  `sn_group`,
  `app_id`,
  
  `app_name`,
  `app_type`,
  `op`
) 
VALUES
  (

    'WBT1002',
    'US',
    '1',
    'xxxxxxx',
    
    '全民K歌',
    'extra',
    'install'
   
  ) ;






INSERT INTO `aika`.`app_rule` (
 
  `model`,
  `region`,
  `sn_group`,
  `app_id`,
  
  `app_name`,
  `app_type`,
  `op`
) 
VALUES
  (

    'WBT1002',
    'US',
    '1',
    'xxxxxxx',
    
    'Stingray',
    'extra',
    'install'
   
  ) ;





INSERT INTO `aika`.`app_rule` (
 
  `model`,
  `region`,
  `sn_group`,
  `app_id`,
  
  `app_name`,
  `app_type`,
  `op`
) 
VALUES
  (

    'WBT1002',
    'SA',
    '8',
    'XXXXX',
    
    'Anghami',
    'extra',
    'install'
   
  ) ;
  
  
  
  
  
INSERT INTO `aika`.`app_rule` (
 
  `model`,
  `region`,
  `sn_group`,
  `app_id`,
  
  `app_name`,
  `app_type`,
  `op`
) 
VALUES
  (

    'WBT1002',
    'US',
    '8',
    'XXXXX',
    
    'Anghami',
    'extra',
    'install'
   
  ) ;

###############################################################################


上生产时: 执行下面语句.

 



UPDATE `aika`.`app_group` SET `country_codes` = 'US,CA,MX,BR,AR,CL,CO,PE,VE,UY,PY,BO,EC,GF,SR,AU,NZ,FJ,PG,WS,TO,SB,VU,ZA,NG,KE,MA,DZ,ET,GH,CI,UG,TZ,AO,ZW,NA,ZM,SN,TN,SS,JP,IN,SG,ID,PK,NP,LK,HK,QA,KW,BH,OM,JO,LB,SY,IQ,YE,EG,IL,TR,IR,GB,DE,FR,IT,ES,NL,BE,SE,NO,DK,FI,CH,AT,IE,PT,GR,PL,CZ,HU,RO,BG,UA,SK' WHERE `id` = '1'; 


INSERT INTO `aika`.`app_group` (`country_codes`, `group_name`, `home`, `extra`, `extra_no`, `region`, `lang`) VALUES ('SA', '沙特阿拉伯组', 'YouTube \Spotify\Local Media\KaraFun', '', 'Starmaker/Smule/music player/Apple Music', 'SA', 'en'); 


INSERT INTO `aika`.`app_rule` (

  `model`,
  `region`,
  `sn_group`,
  `position`,
  `app_id`,
  `app_name`,
  `app_type`,
  `op`
  
) 

SELECT 
`model`,
  'SA' AS `region`,
  10 AS `sn_group`,
  `position`,
  
  `app_id`,
  `app_name`,
  `app_type`,
  `op`
  FROM `aika`.`app_rule` 
  WHERE region = 'US' AND `status`=1
  ;
  
  
  全民K歌,Stingray 64,65不要. 要删除. 不在SA组. 
  
  
  
  UPDATE `aika`.`app_rule` SET `app_type` = 'extra_no' WHERE `id` = '5'; 
  
  
  
  
  


###########################################################################################







# 1218 -  节日推歌相关  ---------------------------  已个更新2个环境

-- 1. 创建holiday表（节日表）

CREATE TABLE `holiday` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `holiday_name` varchar(200) NOT NULL COMMENT '节日名称-中文',
  `holiday_name_en` varchar(200) DEFAULT NULL COMMENT '节日名称-英文',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1-启用，0-禁用）',
  `priority` int DEFAULT '1' COMMENT '优先级（1-10，数字越大优先级越高）',
  `remark` text COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_holiday_name` (`holiday_name`),
  KEY `idx_holiday_name_en` (`holiday_name_en`),
  KEY `idx_status` (`status`),
  KEY `idx_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='节日表';

-- 2. 创建holiday_song_relate表（节日歌曲关联表）

CREATE TABLE `holiday_song_relate` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `holiday_id` bigint NOT NULL COMMENT '节日ID',
  `song_id` int NOT NULL COMMENT '歌曲ID（引用song表的id）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1-启用，0-禁用）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_holiday_song` (`holiday_id`,`song_id`),
  KEY `idx_holiday_id` (`holiday_id`),
  KEY `idx_song_id` (`song_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='节日歌曲关联表';



-- 3. 修改holiday_info表，添加holiday_id字段

ALTER TABLE `holiday_info` ADD COLUMN `holiday_id` BIGINT DEFAULT NULL COMMENT '节日ID（引用holiday表的id）' AFTER `id`;
ALTER TABLE `holiday_info` ADD KEY `idx_holiday_id` (`holiday_id`);
