create schema GCPMigrationMeta;
use GCPMigrationMeta;
create table config_table(
id bigint primary key auto_increment,
table_name varchar(50) not null,
table_key char(40) as (sha1(table_name)) stored,

 -- Source and targets
source_project varchar(150) not null default 'datamigrationproject-483310',
gcs_path varchar(500) not null, -- path in GCS bucket,
target_path varchar(500) not null,   -- Delta target in Databricks,

 -- Control flags
active_flag tinyint(1) not null default 1,  -- tables that are required for migation are marked as 1 
load_flag tinyint(1) not null default 1,

  -- Two-stage statuses
bq_to_gcs_status enum('NOT_STARTED','IN_PROGRESS','COMPLETED','FAILED') DEFAULT 'NOT_STARTED',
gcs_to_bronze_status enum('NOT_STARTED','IN_PROGRESS','COMPLETED','FAILED') DEFAULT 'NOT_STARTED',

  -- Common timestamps
last_run_ts datetime null,
last_success_ts datetime null,
error_message text null,

created_ts datetime not null default current_timestamp,
updated_ts datetime null on update current_timestamp,

unique key uk_table_name (table_name)
);


