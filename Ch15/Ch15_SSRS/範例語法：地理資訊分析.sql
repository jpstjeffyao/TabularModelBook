Select 
  [StoreName]
  ,Geometry::STGeomFromText('POINT ('+Cast([STX] as varchar)+' '+Cast([STY] as Varchar)+')',0) as Location
  ,TotalSales
  ,MarginRate
  from [ASIAMINER_BI20].[dbo].[Stores] a
  Left Join 
  (
     Select  [StoreId]
      ,Sum([SalesAmount]) as TotalSales
      ,(Sum([SalesAmount])-Sum([ProductCost]))/Cast(Sum([SalesAmount]) as Numeric(18,2)) as MarginRate
     from [ASIAMINER_BI20].[dbo].[TrxDetails]
     Group by  [StoreId]
  ) b
  on a.[StoreId]=b.[StoreId]
  Where [AdministrativeAreaName]='台北市'

