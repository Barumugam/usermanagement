
#--- INVENTORY_MASTER---
CREATE TABLE INVENTORY_MASTER (
AUTOGEN_INVENTORY_MASTER_ID BIGINT NOT NULL AUTO_INCREMENT,
INVENTORY_TYPE	VARCHAR(10),
NAME	VARCHAR(20),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CREATED_BY VARCHAR(20),
UPDATED_BY VARCHAR(20),
PRIMARY KEY(AUTOGEN_INVENTORY_MASTER_ID));

#--INVENTORY_MAPPING ---
CREATE TABLE INVENTORY_MAPPING(
AUTOGEN_INVENTORY_MAPPING_ID BIGINT NOT NULL AUTO_INCREMENT,
INVENTORY_REGION_ID BIGINT,
INVENTORY_CENTER_ID BIGINT,
INVENTORY_CLIENT_ID BIGINT,
INVENTORY_PROCESS_ID BIGINT,
INVENTORY_REGION_NAME VARCHAR(30),
INVENTORY_CENTER_NAME VARCHAR(30),
INVENTORY_CLIENT_NAME VARCHAR(30),
INVENTORY_PROCESS_NAME VARCHAR(30),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_INVENTORY_MAPPING_ID));

#----USERS-----
CREATE TABLE USERS (
AUTOGEN_USERS_ID BIGINT NOT NULL AUTO_INCREMENT,
EMPLOYEE_ID VARCHAR(20) NOT NULL,
PASSWORD	VARCHAR(500) NOT NULL, 
FIRST_NAME VARCHAR(30) NULL, 
LAST_NAME	VARCHAR(30),
EMAIL	VARCHAR(30),
MOBILE_NUMBER	VARCHAR(20),
STATUS	VARCHAR(10),
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_USERS_ID),
UNIQUE KEY (EMPLOYEE_ID));

#-- USER DETAILS
CREATE TABLE USERS_DETAILS (
AUTOGEN_USERS_DETAILS_ID BIGINT NOT NULL AUTO_INCREMENT,
AUTOGEN_USERS_ID BIGINT,
SUPERVISOR_USERS_ID	BIGINT,
INVENTORY_REGION_ID	BIGINT,
INVENTORY_CENTER_ID	BIGINT,
INVENTORY_PROCESS_ID	BIGINT,
INVENTORY_CATEGORY_ID	BIGINT,
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_USERS_DETAILS_ID));

#------USER_CLIENT_MAP ----------
CREATE TABLE USER_CLIENT_MAP (
AUTOGEN_USER_CLIENT_MAP_ID BIGINT NOT NULL AUTO_INCREMENT,
AUTOGEN_USERS_DETAILS_ID	BIGINT,
INVENTORY_CLIENT_ID	BIGINT,
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_USER_CLIENT_MAP_ID));

#----USER_GROUPS---
CREATE TABLE USER_GROUPS (
AUTOGEN_USER_GROUPS_ID BIGINT NOT NULL AUTO_INCREMENT,
GROUP_NAME	VARCHAR(30),
GROUP_ID	VARCHAR(20),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_USER_GROUPS_ID));

#----USER_GROUPS_MAP---
CREATE TABLE USER_GROUPS_MAP (
AUTOGEN_USER_GROUPS_MAP_ID BIGINT NOT NULL AUTO_INCREMENT,
AUTOGEN_USER_GROUPS_ID BIGINT NOT NULL,
AUTOGEN_USERS_ID	BIGINT,
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_USER_GROUPS_MAP_ID));

  #-------CLIENT_DETAILS ----
 CREATE TABLE CLIENT_DETAILS(
 AUTOGEN_CLIENT_DETAILS_ID BIGINT NOT NULL AUTO_INCREMENT,
 INVENTORY_CLIENT_ID BIGINT,
 INVENTORY_CLIENT_NAME VARCHAR(20), 
 EMAIL VARCHAR(20),
 MOBILE_NUMBER VARCHAR(20),
 INVENTORY_REGION_ID BIGINT,
 INVENTORY_REGION_NAME VARCHAR(20),
 INVENTORY_CENTER_ID BIGINT,
 INVENTORY_CENTER_NAME VARCHAR(20), 
 LOGO	LONGBLOB NULL, 
 REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 CREATED_BY VARCHAR(20),
 UPDATED_BY VARCHAR(20),
 PRIMARY KEY (AUTOGEN_CLIENT_DETAILS_ID));
 
   #-------CONTACT_DETAILS ----
 CREATE TABLE CONTACT_DETAILS(
 AUTOGEN_CONTACT_DETAILS_ID BIGINT NOT NULL AUTO_INCREMENT,
 AUTOGEN_CLIENT_DETAILS_ID BIGINT,
 PERSON_NAME VARCHAR(20), 
 EMAIL VARCHAR(20),
 MOBILE_NUMBER VARCHAR(20),
 NOTIFICATION_STATUS VARCHAR(20),
 REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 CREATED_BY VARCHAR(20),
 UPDATED_BY VARCHAR(20),
 PRIMARY KEY (AUTOGEN_CONTACT_DETAILS_ID));
 
   
#---CLIENT REPORT MAP---
CREATE TABLE CLIENT_REPORT_MAP(
AUTOGEN_CLIENT_REPORT_MAP_ID BIGINT NOT NULL AUTO_INCREMENT,
AUTOGEN_CONTACT_DETAILS_ID BIGINT,
INVENTORY_PROCESS_ID BIGINT,
INVENTORY_PROCESS_NAME VARCHAR(20), 
AUTOGEN_REPORT_MASTER_ID BIGINT,
REPORT_NAME VARCHAR(20),
AUTOGEN_FREQUENCY_MASTER_ID BIGINT,
FREQUENCY_NAME VARCHAR(20),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_CLIENT_REPORT_MAP_ID));
 
 
 
 
 ------------------------------------------------------------------
 
 
 #--REPORT_MASTER ---
CREATE TABLE REPORT_MASTER(
AUTOGEN_REPORT_MASTER_ID BIGINT NOT NULL AUTO_INCREMENT,
REPORT_NAME	VARCHAR(30),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_REPORT_MASTER_ID));

#--FREQUENCY_MASTER ---
CREATE TABLE FREQUENCY_MASTER(
AUTOGEN_FREQUENCY_MASTER_ID BIGINT NOT NULL AUTO_INCREMENT,
FREQUENCY_NAME	VARCHAR(30),
DURATION_DAYS_COUNT	VARCHAR(30),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_FREQUENCY_MASTER_ID));



#[------------------------------------------------------------------------End----------------------





#----------Misc--------------
#--ROLES--
CREATE TABLE ROLES (
AUTOGEN_ROLES_ID	BIGINT NOT NULL AUTO_INCREMENT,
ROLE_NAME VARCHAR(30),
STATUS	VARCHAR(10),
CREATED_BY VARCHAR(30),
UPDATED_BY VARCHAR(30),
REC_ADD_DT	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_ROLES_ID),
UNIQUE KEY (ROLE_NAME));

INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('SYSTEM_ADMIN', 'ACTIVE');
INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('QA_LEAD', 'ACTIVE');
INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('AUDITOR', 'ACTIVE');
INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('AGENT', 'ACTIVE');
INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('CLIENT', 'ACTIVE');
INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('SUPERVISOR_AGENT', 'ACTIVE');
INSERT INTO ROLES (ROLE_NAME, STATUS) VALUES('SURVEY_AGENT', 'ACTIVE');
#----USER_ROLES_MAP---
CREATE TABLE USER_ROLES_MAP (
AUTOGEN_USER_ROLES_MAP_ID BIGINT NOT NULL AUTO_INCREMENT,
AUTOGEN_USERS_ID	BIGINT,
AUTOGEN_ROLES_ID	BIGINT,
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
REC_ADD_DT	DATETIME DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	DATETIME ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_USER_ROLES_MAP_ID));



#--AGENT_CATEGORY ---
CREATE TABLE AGENT_CATEGORY(
AUTOGEN_AGENT_CATEGORY_ID BIGINT NOT NULL AUTO_INCREMENT,
NAME	VARCHAR(30),
STATUS	VARCHAR(10) DEFAULT 'ACTIVE',
REC_ADD_DT	DATETIME DEFAULT CURRENT_TIMESTAMP,
REC_UPDATE_DT	DATETIME ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (AUTOGEN_REPORT_MASTER_ID));


