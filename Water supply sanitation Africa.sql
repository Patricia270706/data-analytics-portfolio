 1. Average water availability (liters per capita per day) for each country.
 
SELECT Country, AVG(`Water Availability (liters per capita per day)`) AS Average_Water_Availability
FROM water_supply_sanitation_africa 
GROUP BY Country;

2. Details of communities where at least one water point is non-functional. 

SELECT * 
FROM water_supply_sanitation_africa
WHERE `Number of Non-Functional Water Points` > 0;

3. Information for the top five communities with the highest annual sanitation maintenance costs.

SELECT `Community Name`, Country, `Annual Maintenance Cost (USD)`
FROM water_supply_sanitation_africa
ORDER BY `Annual Maintenance Cost (USD)` DESC
LIMIT 5;

4. Total number of functional and non-functional water points per country.
 
SELECT Country, 
SUM(`Number of Functional Water Points`) AS Total_Functional_Water_Points, 
SUM(`Number of Non-Functional Water Points`) AS Total_Non_Functional_Water_Points
FROM water_supply_sanitation_africa 
GROUP BY Country;

5. Communities with a high incidence of waterborne diseases (>20%)

SELECT `Community Name`, Country, `Waterborne Diseases Incidence Rate (%)`
FROM water_supply_sanitation_africa 
WHERE `Waterborne Diseases Incidence Rate (%)` > 20;

6. Average distance to the water source per region 

SELECT Region, AVG(`Average Distance to Water Source (km)`) AS Average_Distance_km
FROM water_supply_sanitation_africa 
GROUP BY Region;

7. Communities that receive both government and NGO support 

SELECT `Community Name`, Country
FROM water_supply_sanitation_africa 
WHERE `Government Support` = 'Yes' AND `NGO Support` = 'Yes';

8. Community with the highest population per country 

SELECT Country, `Community Name`, Population
FROM (
SELECT Country, `Community Name`, Population,
RANK() OVER (PARTITION BY Country ORDER BY Population DESC) AS rnk 
FROM water_supply_sanitation_africa 
) ranked
WHERE rnk = 1;

