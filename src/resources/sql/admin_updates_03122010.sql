ALTER TABLE ADMIN.form add column start_new_event smallint DEFAULT NULL;
ALTER TABLE ADMIN.form add column event_type VARCHAR(255) DEFAULT NULL;
ALTER TABLE ADMIN.form_type ADD column global_identifier_name CHAR(36);
ALTER TABLE admin.flow ADD column global_identifier_name VARCHAR (128);
ALTER TABLE admin.form ADD column import_id BIGINT;
ALTER TABLE admin.form ADD column form_domain_id BIGINT;
ALTER TABLE admin.form_field ADD column import_id BIGINT;
ALTER TABLE admin.form_field ADD column global_identifier_name VARCHAR (128);
ALTER TABLE admin.form_field DROP column global_identifier_name;
ALTER TABLE admin.form_field add column global_identifier_name CHAR(36);

alter table admin.form add column import_type varchar(255);
alter table admin.form_field add column uuid varchar(36);
alter table admin.form_field add column parent_uuid varchar(36);
alter table admin.field_enumeration add column parent_uuid varchar(36);
alter table admin.field_enumeration add column uuid varchar(36);

alter table admin.form_field add column openmrs_parent_concept varchar(255);

alter table admin.form add column locale varchar(6);
alter table admin.form_field add column locale varchar(6);
alter table admin.field_enumeration add column locale varchar(6);
update admin.form set locale = 'en_US';
update admin.form_field set locale = 'en_US';
update admin.field_enumeration set locale = 'en_US';

alter table admin.page_item add column roles varchar(255);
ALTER TABLE admin.page_item ADD column import_id BIGINT;
ALTER TABLE admin.rule_definition ADD column import_id BIGINT;
alter table admin.page_item add column fkidentifier varchar(6);

alter table admin.form_field add column openmrs_concept varchar(255);
alter table admin.form_field add column openmrs_datatype varchar(255);
alter table admin.form_field add column openmrs_name varchar(255);

alter table admin.field_enumeration add column openmrs_concept varchar(255);

CREATE TABLE "ADMIN"."FORM_DOMAIN" ("ID" BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(255), "LAST_MODIFIED" TIMESTAMP, "CREATED" TIMESTAMP, "LAST_MODIFIED_BY" VARCHAR(255), "CREATED_BY" VARCHAR(255), "SITE_ID" BIGINT, "GLOBAL_IDENTIFIER_NAME" VARCHAR(128));
INSERT INTO admin.form_domain (id, name, last_modified, created, last_modified_by, created_by, site_id, global_identifier_name) VALUES (1,'Pregnancy (Mother only)','2005-01-24 00:00:00','2005-01-24 00:00:00','demo','demo',NULL,'4b84e8a9-0d1a-102c-937c-ea26008bba06');
INSERT INTO admin.form_domain (id, name, last_modified, created, last_modified_by, created_by, site_id, global_identifier_name) VALUES (2,'Newborn Only','2005-01-24 00:00:00','2005-01-24 00:00:00','demo','demo',NULL,'5acc897c-0d1a-102c-937c-ea26008bba06');
INSERT INTO admin.form_domain (id, name, last_modified, created, last_modified_by, created_by, site_id, global_identifier_name) VALUES (3,'All Patients','2005-01-24 00:00:00','2005-01-24 00:00:00','demo','demo',NULL,'5d35072c-0d1a-102c-937c-ea26008bba06');
INSERT INTO admin.form_domain (id, name, last_modified, created, last_modified_by, created_by, site_id, global_identifier_name) VALUES (4,'Mother and Infant',NULL,NULL,NULL,NULL,NULL,'5fedf36d-0d1a-102c-937c-ea26008bba06');

update admin.form set form_domain_id = 3;

 "OPENMRS_CONCEPT" VARCHAR(255), "OPENMRS_DATATYPE" VARCHAR(255),
 "OPENMRS_NAME" VARCHAR(255), "UUID" VARCHAR(36),
 "PARENT_UUID" VARCHAR(36), "OPENMRS_PARENT_CONCEPT" VARCHAR(255), "LOCALE" VARCHAR(6));

 ALTER TABLE admin.field_enumeration ADD column import_id BIGINT;
select id, label, global_identifier_name from admin.form;


*// update tables w/ uuid.

update admin.form set global_identifier_name = (GENERATE_UUID()) where id = 115;
update admin.form set global_identifier_name = (GENERATE_UUID()) where id = 116;
