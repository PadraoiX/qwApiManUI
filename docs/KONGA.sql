CREATE SCHEMA "public";

CREATE SEQUENCE "public".konga_api_health_checks_id_seq;

CREATE SEQUENCE "public".konga_email_transports_id_seq;

CREATE SEQUENCE "public".konga_kong_nodes_id_seq;

CREATE SEQUENCE "public".konga_kong_services_id_seq;

CREATE SEQUENCE "public".konga_kong_snapshot_schedules_id_seq;

CREATE SEQUENCE "public".konga_kong_snapshots_id_seq;

CREATE SEQUENCE "public".konga_kong_upstream_alerts_id_seq;

CREATE SEQUENCE "public".konga_netdata_connections_id_seq;

CREATE SEQUENCE "public".konga_passports_id_seq;

CREATE SEQUENCE "public".konga_settings_id_seq;

CREATE SEQUENCE "public".konga_users_id_seq;

CREATE TABLE "public".konga_api_health_checks ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	api_id               text   ,
	api                  json   ,
	health_check_endpoint text   ,
	notification_endpoint text   ,
	active               bool   ,
	"data"               json   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_api_health_checks_pkey PRIMARY KEY ( id ),
	CONSTRAINT konga_api_health_checks_api_id_key UNIQUE ( api_id ASC ) 
 );

CREATE TABLE "public".konga_email_transports ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	name                 text   ,
	description          text   ,
	"schema"             json   ,
	settings             json   ,
	active               bool   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_email_transports_pkey PRIMARY KEY ( id ),
	CONSTRAINT konga_email_transports_name_key UNIQUE ( name ASC ) 
 );

CREATE TABLE "public".konga_kong_nodes ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	name                 text   ,
	"type"               text   ,
	kong_admin_url       text   ,
	netdata_url          text   ,
	kong_api_key         text   ,
	jwt_algorithm        text   ,
	jwt_key              text   ,
	jwt_secret           text   ,
	username             text   ,
	"password"           text   ,
	kong_version         text   ,
	health_checks        bool   ,
	health_check_details json   ,
	active               bool   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_kong_nodes_pkey PRIMARY KEY ( id )
 );

CREATE TABLE "public".konga_kong_services ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	service_id           text   ,
	kong_node_id         text   ,
	description          text   ,
	tags                 json   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_kong_services_pkey PRIMARY KEY ( id ),
	CONSTRAINT konga_kong_services_service_id_key UNIQUE ( service_id ASC ) 
 );

CREATE TABLE "public".konga_kong_snapshot_schedules ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	"connection"         integer   ,
	active               bool   ,
	cron                 text   ,
	"lastRunAt"          date   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_kong_snapshot_schedules_pkey PRIMARY KEY ( id )
 );

CREATE TABLE "public".konga_kong_snapshots ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	name                 text   ,
	kong_node_name       text   ,
	kong_node_url        text   ,
	kong_version         text   ,
	"data"               json   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_kong_snapshots_pkey PRIMARY KEY ( id ),
	CONSTRAINT konga_kong_snapshots_name_key UNIQUE ( name ASC ) 
 );

CREATE TABLE "public".konga_kong_upstream_alerts ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	upstream_id          text   ,
	"connection"         integer   ,
	email                bool   ,
	slack                bool   ,
	cron                 text   ,
	active               bool   ,
	"data"               json   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_kong_upstream_alerts_pkey PRIMARY KEY ( id ),
	CONSTRAINT konga_kong_upstream_alerts_upstream_id_key UNIQUE ( upstream_id ASC ) 
 );

CREATE TABLE "public".konga_netdata_connections ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	"apiId"              text   ,
	url                  text   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_netdata_connections_pkey PRIMARY KEY ( id )
 );

CREATE TABLE "public".konga_passports ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	protocol             text   ,
	"password"           text   ,
	provider             text   ,
	identifier           text   ,
	tokens               json   ,
	"user"               integer   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	CONSTRAINT konga_passports_pkey PRIMARY KEY ( id )
 );

CREATE TABLE "public".konga_settings ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	"data"               json   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_settings_pkey PRIMARY KEY ( id )
 );

CREATE TABLE "public".konga_users ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY,
	username             text   ,
	email                text   ,
	"firstName"          text   ,
	"lastName"           text   ,
	"admin"              bool   ,
	node_id              text   ,
	active               bool   ,
	"activationToken"    text   ,
	node                 integer   ,
	"createdAt"          timestamptz   ,
	"updatedAt"          timestamptz   ,
	"createdUserId"      integer   ,
	"updatedUserId"      integer   ,
	CONSTRAINT konga_users_pkey PRIMARY KEY ( id ),
	CONSTRAINT konga_users_email_key UNIQUE ( email ASC ) ,
	CONSTRAINT konga_users_username_key UNIQUE ( username ASC ) 
 );

