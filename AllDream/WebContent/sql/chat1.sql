CREATE DATABASE IF NOT EXISTS chat1
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE chat1;

CREATE TABLE user (
	no int AUTO_INCREMENT PRIMARY key,
	userID	varchar(20) COMMENT '���̵�',
	userPassword	varchar(20)	NULL	COMMENT '�н�����',
	userName	varchar(20)	NULL	COMMENT '������̸�',
	userAge	int(11)	NULL	COMMENT '����',
	userGender varchar(20)	NULL	COMMENT '����',
	userEmail	varchar(50)	NULL	COMMENT '�̸���',
	userProfile	varchar(50)	NULL	COMMENT '������',
  	ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) DEFAULT character SET utf8 COLLATE utf8_general_ci;

CREATE TABLE chat(
	chatID INT PRIMARY KEY AUTO_INCREMENT,
	fromID VARCHAR(20),
	toID VARCHAR(20),
	chatContent VARCHAR(100),
	chatTime DATETIME,
	chatReed INT);

CREATE TABLE feed (
	no int AUTO_INCREMENT PRIMARY key,
	id int ,
	content nvarchar(255),
	ts	datetime
) DEFAULT character SET utf8 COLLATE utf8_general_ci;