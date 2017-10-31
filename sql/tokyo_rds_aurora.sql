SELECT 
   q01.`Instance Index`
  ,q01.`Current Generation`
  ,q01.`Instance Type`
  ,q01.`PricePerUnit` AS `OnDemand Hrs`
  ,0                  AS `1yr No UpFront Quantity`
  ,q02.`PricePerUnit` AS `1yr No UpFront Hrs`
  ,q03.`PricePerUnit` AS `1yr Partial UpFront Quantity`
  ,q04.`PricePerUnit` AS `1yr Partial UpFront Hrs`
  ,q05.`PricePerUnit` AS `1yr All UpFront Quantity`
  ,0                  AS `1yr All UpFront Hrs`
  ,q06.`PricePerUnit` AS `3yr Partial UpFront Quantity`
  ,q07.`PricePerUnit` AS `3yr Partial UpFront Hrs`
  ,q08.`PricePerUnit` AS `3yr All UpFront Quantity`
  ,0                  AS `3yr All UpFront Hrs`
FROM (
  SELECT 
     SUBSTRING_INDEX(SUBSTRING(`Instance Type`, 4) , '.', 1) AS `Instance Index`
    ,`Current Generation`
    ,`Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'OnDemand'
    AND `Unit` = 'Hrs'
) q01
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `LeaseContractLength` = 'No Upfront'
    AND `RelatedTo` = '1yr'
) q02 ON q01.`Instance Type` = q02.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `LeaseContractLength` = 'Partial Upfront'
    AND `RelatedTo` = '1yr'
) q03 ON q01.`Instance Type` = q03.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `LeaseContractLength` = 'Partial Upfront'
    AND `RelatedTo` = '1yr'
) q04 ON q01.`Instance Type` = q04.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `LeaseContractLength` = 'All Upfront'
    AND `RelatedTo` = '1yr'
) q05 ON q01.`Instance Type` = q05.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `LeaseContractLength` = 'Partial Upfront'
    AND `RelatedTo` = '3yr'
) q06 ON q01.`Instance Type` = q06.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `LeaseContractLength` = 'Partial Upfront'
    AND `RelatedTo` = '3yr'
) q07 ON q01.`Instance Type` = q07.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    rds 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Database Engine` = 'Aurora MySQL' -- Aurora MySQL, MariaDB, MySQL
    AND `Database Edition` = ''
    AND `Deployment Option` = 'Single-AZ'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `LeaseContractLength` = 'All Upfront'
    AND `RelatedTo` = '3yr'
) q08 ON q01.`Instance Type` = q08.`Instance Type`

ORDER BY
      `Instance Index`
     ,`Current Generation`
     ,`Shared OnDemand Hrs`
