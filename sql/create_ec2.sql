-- step 1 create database
-- mysql> CREATE DATABASE aws_price;

-- step 2 create table
-- mysql>
CREATE TABLE ec2 (
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
  ,`LeaseContractLength`            varchar(128)
  ,`PurchaseOption`                 varchar(128)
  ,`OfferingClass`                  varchar(128)
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
  ,`Max Volume Size`                varchar(128)
  ,`Max IOPS/volume`                varchar(128)
  ,`Max IOPS Burst Performance`     varchar(128)
  ,`Max throughput/volume`          varchar(128)
  ,`Provisioned`                    varchar(128)
  ,`Tenancy`                        varchar(128)
  ,`EBS Optimized`                  varchar(128)
  ,`Operating System`               varchar(128)
  ,`License Model`                  varchar(128)
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
  ,`GPU`                            int
  ,`Instance Capacity - 10xlarge`   int
  ,`Instance Capacity - 2xlarge`    int
  ,`Instance Capacity - 4xlarge`    int
  ,`Instance Capacity - 8xlarge`    int
  ,`Instance Capacity - large`      int
  ,`Instance Capacity - medium`     int
  ,`Instance Capacity - xlarge`     int
  ,`Physical Cores`                 varchar(128)
  ,`Pre Installed S/W`              varchar(128)
  ,`Processor Features`             varchar(128)
  ,`Sockets`                        int
);
CREATE INDEX `Location` ON ec2(`Location`);
CREATE INDEX `Instance Type` ON ec2(`Instance Type`);

-- step 3 csv download
-- $ curl https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonEC2/current/index.csv -o ec2.csv

-- step 4 csv import 
-- $ mysqlimport --fields-terminated-by=',' --fields-enclosed-by='"' -h 127.0.0.1 -u root -p -d ec2 ec2.csv
-- or
-- mysql> LOAD DATA LOCAL INFILE '~/ec2.csv' INTO TABLE ec2 FIELDS TERMINATED BY ',' ENCLOSED BY '"'
