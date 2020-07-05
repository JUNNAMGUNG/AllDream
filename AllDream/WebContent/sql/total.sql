/*CREATE DATABASE IF NOT EXISTS alldream
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE alldream;

CREATE TABLE IF NOT EXISTS state(
	no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT "sequence",
	StateTitle VARCHAR(50)
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE user (
	userID	varchar(20) COMMENT '아이디',
	userPassword varchar(20) NULL COMMENT '패스워드',
	userName varchar(20) NULL COMMENT '사용자이름',
	userAge	int(11)	NULL	COMMENT '나이',
	userGender varchar(20)	NULL	COMMENT '성별',
	userEmail	varchar(50)	NULL	COMMENT '이메일',
	userProfile	varchar(50)	NULL	COMMENT '프로필'
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE chat(
	chatID INT PRIMARY KEY AUTO_INCREMENT,
	fromID VARCHAR(20),
	toID VARCHAR(20),
	chatContent VARCHAR(100),
	chatTime DATETIME,
	chatRead INT
)DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE feed (
	no int AUTO_INCREMENT PRIMARY key,
	id nvarchar(255) ,
	content nvarchar(255),
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS notice(
	no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT "sequence",
	NoticeTitle VARCHAR(32),
	NoticeDesc VARCHAR(500),
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)DEFAULT character SET utf8 COLLATE utf8_general_ci;

SET @COUNT=0;
UPDATE notice SET notice.no=@COUNT:=@COUNT+1;*/

CREATE DATABASE IF NOT EXISTS alldream
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE alldream;

CREATE TABLE IF NOT EXISTS state(
	no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT "sequence",
	StateTitle VARCHAR(50)
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE user (
	userID varchar(20),
	userPassword varchar(20) NULL,
	userName varchar(20) NULL,
	userAge int(11) NULL,
	userGender varchar(20) NULL,
	userEmail varchar(50) NULL,
	userProfile varchar(50) NULL,
	userText varchar(50) NULL
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE CHAT(
	chatID INT PRIMARY KEY AUTO_INCREMENT,
	fromID VARCHAR(20),
	toID VARCHAR(20),
	chatContent VARCHAR(100),
	chatTime DATETIME,
	chatRead INT
)DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE feed (
	no int AUTO_INCREMENT PRIMARY key,
	id nvarchar(255) ,
	content nvarchar(255),
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS notice(
	no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT "sequence",
	NoticeTitle VARCHAR(32),
	NoticeDesc VARCHAR(500),
	ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)DEFAULT character SET utf8 COLLATE utf8_general_ci;

SET @COUNT=0;
UPDATE notice SET notice.no=@COUNT:=@COUNT+1;