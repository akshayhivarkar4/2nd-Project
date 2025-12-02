Use supply_chain_project;
#Order_and_Sales_KPI
#Q1_Orders_by _Region
SELECT Region, COUNT(DISTINCT Order_ID) AS Total_Orders
FROM `supply chain`
GROUP BY Region
ORDER BY Total_Orders DESC;
#Q2_Total_Orders
SELECT COUNT(Order_ID) AS Total_Orders FROM `supply chain`;
#Q3_Total_Sales_Revenue
SELECT SUM(Unit_Price * Quantity)/1000000 AS Total_Sales_Revenue_Million FROM `supply chain`;
#Q4_Average_Order_Value
SELECT SUM(Unit_Price * Quantity) / COUNT(DISTINCT Order_ID) AS Average_Order_Value FROM `supply chain`;
#Inventory_and_Stock_KPI
#Q5_Stock_on_hand
SELECT SUM(Stock_On_Hand) AS Total_Stock_On_Hand FROM `supply chain`;
#Q6_Reorder_Status
SELECT (COUNT(CASE WHEN Stock_On_Hand < Reorder_Level THEN 1 END) * 100.0 / COUNT(*)) AS Reorder_Status_Percentage
FROM `supply chain`;
#Q7_Average_Leadtime
SELECT AVG(Lead_Time_Days) AS Average_Lead_Time FROM `supply chain`;
#Q8_Inventory_Turnover_Ratio
SELECT SUM(Total_Cost) * 1.0 / SUM(Stock_On_Hand) AS Inventory_Turnover_Ratio FROM `supply chain`;
#Procurement_&_Cost_KPI
#Q9_Total_Procurement_Cost
SELECT SUM(Procurement_Cost)/1000000 AS Total_Procurement_Cost_in_Million FROM `supply chain`;
#Q10_Transportation_Cost
SELECT SUM(Transportation_Cost) AS Total_Transportation_Cost FROM `supply chain`;
#Q11_Total_Supply_Chain_Cost
SELECT SUM(Total_Cost) AS Total_Supply_chain_Cost FROM `supply chain`;
#Q12_Cost_per_Unit
SELECT SUM(Total_Cost) * 1.0 / SUM(Quantity) AS Cost_Per_Unit FROM `supply chain`;
#Logisitics_&_Delivery_KPI
#Q13_On_Time_Delivery_Status_%
SELECT (SUM(CASE WHEN Delivery_Status = 'On-Time' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS On_Time_Delivery_Percentage
FROM `supply chain`;
#Q14_Average_Delay_Days
SELECT avg(Delay_Days) as AVG_DELAY_DAYS FROM `supply chain`;
#Q15_Orders_by_Ship_Mode
SELECT Ship_Mode, COUNT(DISTINCT Order_ID) AS Total_Orders FROM `supply chain` GROUP BY Ship_Mode
ORDER BY Total_Orders DESC;
#Q16_Transport_Mode_Utilization
SELECT Transport_Mode, COUNT(DISTINCT Order_ID) AS Total_Orders FROM `supply chain`
GROUP BY Transport_Mode ORDER BY Total_Orders DESC;
#Demand_&_Fulfillment_KPI
#Q17_Forecast_Accuracy
SELECT 1 - (SUM(ABS(Forecast_Demand - Actual_Demand)) * 1.0 / SUM(Forecast_Demand)) AS Forecast_Accuracy
FROM `supply chain`;
#Q18_Fillrate
SELECT AVG(Fill_Rate) AS Avg_Fill_Rate FROM `supply chain` ;
#Q19_Backorder_Rate
SELECT ROUND((SUM(CASE WHEN Delivery_Status = 'Delayed' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),2) AS Backorder_Rate_Percent
FROM `supply chain`;
#Q20_Forecast_vs_Actual_Demand
SELECT YEAR(Order_Date) AS Year, MONTH(Order_Date) AS Month, SUM(Forecast_Demand) AS Total_Forecast_Demand,
SUM(Actual_Demand) AS Total_Actual_Demand FROM `supply chain`
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;












 









