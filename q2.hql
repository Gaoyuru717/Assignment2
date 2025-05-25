SELECT
  SUM(CarrierDelay) AS Carrier,
  SUM(WeatherDelay) AS Weather,
  SUM(NASDelay) AS NAS,
  SUM(SecurityDelay) AS Security,
  SUM(LateAircraftDelay) AS LateAircraft
FROM 2004_cleaned
WHERE Cancelled = 0;

---
SELECT 'CarrierDelay' AS DelayType, 18833073 AS TotalMinutes, ROUND(18833073 / 73088325 * 100, 2) AS Percentage
UNION ALL
SELECT 'WeatherDelay', 5037460, ROUND(5037460 / 73088325 * 100, 2)
UNION ALL
SELECT 'NASDelay', 24472354, ROUND(24472354 / 73088325 * 100, 2)
UNION ALL
SELECT 'SecurityDelay', 179219, ROUND(179219 / 73088325 * 100, 2)
UNION ALL
SELECT 'LateAircraftDelay', 24566219, ROUND(24566219 / 73088325 * 100, 2)
ORDER BY TotalMinutes DESC;
