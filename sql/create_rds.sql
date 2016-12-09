-- step 1 create database
-- mysql> CREATE DATABASE aws_price;

-- step 2 create table
-- mysql>
REATE TABLE rds (
   `SKU`                            varchar(128)
  ,`OfferTermCode`                  varchar(128)
  ,`RateCode`                       varchar(128)
  ,`TermType`                       varchar(128)
  ,`PriceDescription`               varchar(128)
  ,`EffectiveDate`                  varchar(128)
  ,`StartingRange`                  varchar(128)
  ,`EndingRange`                    varchar(128)
  ,`Unit`                           varchar(128)  
  ,`PricePerUnit`                   float
  ,`Currency`                       varchar(128)
  ,`RelatedTo`                      varchar(128)
  ,`LeaseContractLength`            varchar(128)
  ,`PurchaseOption`                 varchar(128)
  ,`Product Family`                 varchar(128)
  ,`serviceCode`                    varchar(128)
  ,`Location`                       varchar(128)
  ,`Location Type`                  varchar(128)
  ,`Instance Type`                  varchar(128)
  ,`Current Generation`             varchar(128)
  ,`Instance Family`                varchar(128)
  ,`vCPU`                           int
  ,`Physical Processor`             varchar(128)
  ,`Clock Speed`                    int
  ,`Memory`                         varchar(128)
  ,`Storage`                        varchar(128)
  ,`Network Performance`            varchar(128)
  ,`Processor Architecture`         varchar(128)
  ,`Storage Media`                  varchar(128)
  ,`Volume Type`                    varchar(128)
  ,`Min Volume Size`                varchar(128)
  ,`Max Volume Size`                varchar(128)
  ,`Engine Code`                    int
  ,`Database Engine`                varchar(128)
  ,`Database Edition`               varchar(128)
  ,`License Model`                  varchar(128)
  ,`Deployment Option`              varchar(128)
  ,`Group`                          varchar(128)
  ,`Group Description`              varchar(128)
  ,`Transfer Type`                  varchar(128)
  ,`From Location`                  varchar(128) 
  ,`From Location Type`             varchar(128)
  ,`To Location`                    varchar(128)
  ,`To Location Type`               varchar(128)
  ,`usageType`                      varchar(128)
  ,`operation`                      varchar(128)
  ,`Dedicated EBS Throughput`       varchar(128)
  ,`Enhanced Networking Supported`  varchar(128)
  ,`Processor Features`             varchar(128)
);
CREATE INDEX `Location` ON rds(`Location`);
CREATE INDEX `Instance Type` ON rds(`Instance Type`);

-- step 3 csv download
-- $ curl https:--pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonRDS/current/index.csv -o rds.csv

-- step 4 csv import 
-- $ mysqlimport --fields-terminated-by=',' --fields-enclosed-by='"' -h 127.0.0.1 -u root -p -d rds rds.csv 
-- or
-- mysql> LOAD DATA LOCAL INFILE '~/rds.csv' INTO TABLE rds FIELDS TERMINATED BY ',' ENCLOSED BY '"'
