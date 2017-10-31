SELECT 
     SUBSTRING_INDEX(`Instance Type`, '.', 1) AS `Instance Index`
    ,`Instance Type`
    ,`Instance Family`
    ,`Current Generation`
    ,`vCPU`
    ,`Physical Processor`
    ,`Processor Architecture`
    -- ,`Processor Features`
    ,`Clock Speed`
    ,`Memory`
    ,`Storage`
    -- ,`Storage Media`
    -- ,`Volume Type`
    -- ,`Max Volume Size`
    -- ,`Max IOPS/volume`
    -- ,`Max IOPS Burst Performance`
    -- ,`Max throughput/volume`
    -- ,`Provisioned`
    -- ,`EBS Optimized`
    ,`Dedicated EBS Throughput`
    ,`Network Performance`
    ,`Enhanced Networking Supported`
    ,`GPU`
FROM 
  ec2 
WHERE 
        `Location` = 'Asia Pacific (Tokyo)'
    AND `Operating System` = 'Linux'
    AND `TermType` = 'OnDemand'
    AND `Tenancy` = 'Shared'
ORDER BY
     `Instance Index`
    ,`Current Generation`
    ,`PricePerUnit`
