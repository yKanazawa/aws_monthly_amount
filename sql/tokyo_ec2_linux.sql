SELECT 
   q01.`Instance Index`
  ,q01.`Current Generation`
  ,q01.`Instance Type`
  ,q01.`PricePerUnit` AS `Shared OnDemand Hrs`
  ,0                  AS `Shared 1yr No UpFront Quantity`
  ,q02.`PricePerUnit` AS `Shared 1yr No UpFront Hrs`
  ,q03.`PricePerUnit` AS `Shared 1yr Partial UpFront Quantity`
  ,q04.`PricePerUnit` AS `Shared 1yr Partial UpFront Hrs`
  ,q05.`PricePerUnit` AS `Shared 1yr All UpFront Quantity`
  ,0                  AS `Shared 1yr All UpFront Hrs`
  ,q06.`PricePerUnit` AS `Shared 3yr Partial UpFront Quantity`
  ,q07.`PricePerUnit` AS `Shared 3yr Partial UpFront Hrs`
  ,q08.`PricePerUnit` AS `Shared 3yr All UpFront Quantity`
  ,0                  AS `Shared 3yr All UpFront Hrs`
  ,q09.`PricePerUnit` AS `Dedicated OnDemand Hrs`
  ,0                  AS `Dedicated 1yr No UpFront Quantity`
  ,q10.`PricePerUnit` AS `Dedicated 1yr No UpFront Hrs`
  ,q11.`PricePerUnit` AS `Dedicated 1yr Partial UpFront Quantity`
  ,q12.`PricePerUnit` AS `Dedicated 1yr Partial UpFront Hrs`
  ,q13.`PricePerUnit` AS `Dedicated 1yr All UpFront Quantity`
  ,0                  AS `Dedicated 1yr All UpFront Hrs`
  ,q14.`PricePerUnit` AS `Dedicated 3yr Partial UpFront Quantity`
  ,q15.`PricePerUnit` AS `Dedicated 3yr Partial UpFront Hrs`
  ,q16.`PricePerUnit` AS `Dedicated 3yr All UpFront Quantity`  
  ,0                  AS `Dedicated 3yr All UpFront Hrs`
FROM (
  SELECT 
     SUBSTRING_INDEX(`Instance Type`, '.', 1) AS `Instance Index`
    ,`Current Generation`
    ,`Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'OnDemand'
    AND `Unit` = 'Hrs'
    AND `Tenancy` = 'Shared'
) q01
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `PurchaseOption` = 'No Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '1yr'
) q02 ON q01.`Instance Type` = q02.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '1yr'
) q03 ON q01.`Instance Type` = q03.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '1yr'
) q04 ON q01.`Instance Type` = q04.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'All Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '1yr'
) q05 ON q01.`Instance Type` = q05.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '3yr'
) q06 ON q01.`Instance Type` = q06.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '3yr'
) q07 ON q01.`Instance Type` = q07.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'All Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Shared'
    AND `LeaseContractLength` = '3yr'
) q08 ON q01.`Instance Type` = q08.`Instance Type`
LEFT JOIN (
  SELECT 
	 `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'OnDemand'
    AND `Unit` = 'Hrs'
    AND `Tenancy` = 'Dedicated'
) q09 ON q01.`Instance Type` = q09.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `PurchaseOption` = 'No Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '1yr'
) q10 ON q01.`Instance Type` = q10.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '1yr'
) q11 ON q01.`Instance Type` = q11.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '1yr'
) q12 ON q01.`Instance Type` = q12.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'All Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '1yr'
) q13 ON q01.`Instance Type` = q13.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '3yr'
) q14 ON q01.`Instance Type` = q14.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Hrs'
    AND `PurchaseOption` = 'Partial Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '3yr'
) q15 ON q01.`Instance Type` = q15.`Instance Type`
LEFT JOIN (
  SELECT 
     `Instance Type`
    ,`PricePerUnit`
  FROM 
    ec2 
  WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'Reserved'
    AND `Unit` = 'Quantity'
    AND `PurchaseOption` = 'All Upfront'
    AND `OfferingClass` = 'standard' -- standard, convertive    
    AND `Tenancy` = 'Dedicated'
    AND `LeaseContractLength` = '3yr'
) q16 ON q01.`Instance Type` = q16.`Instance Type`
ORDER BY
      `Instance Index`
     ,`Current Generation`
     ,`Shared OnDemand Hrs`
