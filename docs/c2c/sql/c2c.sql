-- Create syntax for TABLE 'report_task'
CREATE TABLE `report_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `report_user_id` int(11) NOT NULL,
  `report_content` varchar(255) NOT NULL DEFAULT '',
  `target_id` int(11) NOT NULL,
  `vote_result` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'report_task_vote'
CREATE TABLE `report_task_vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(11) NOT NULL,
  `report_task_id` int(11) NOT NULL,
  `vote_result` tinyint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'reviewer_task_status'
CREATE TABLE `reviewer_task_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(11) NOT NULL,
  `report_task_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- Create syntax for TABLE 'reward_coin'
CREATE TABLE `reward_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
