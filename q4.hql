---1
SELECT 
  Origin, 
  Dest, 
  COUNT(*) AS ProblemCount
FROM 2004_cleaned
WHERE ArrDelay > 15 OR Cancelled = 1
GROUP BY Origin, Dest
ORDER BY ProblemCount DESC
LIMIT 10;

---
SELECT 
  UniqueCarrier, 
  COUNT(*) AS ProblemCount
FROM 2004_cleaned
WHERE ArrDelay > 15 OR Cancelled = 1
GROUP BY UniqueCarrier
ORDER BY ProblemCount DESC
LIMIT 10;

---
SELECT 
  FlightNum, 
  COUNT(*) AS ProblemCount
FROM 2004_cleaned
WHERE ArrDelay > 15 OR Cancelled = 1
GROUP BY FlightNum
ORDER BY ProblemCount DESC
LIMIT 10;

---2
SELECT
  SUM(CarrierDelay) AS TotalCarrierDelay,
  SUM(WeatherDelay) AS TotalWeatherDelay,
  SUM(NASDelay) AS TotalNASDelay,
  SUM(SecurityDelay) AS TotalSecurityDelay,
  SUM(LateAircraftDelay) AS TotalLateAircraftDelay,
  SUM(CarrierDelay + WeatherDelay + NASDelay + SecurityDelay + LateAircraftDelay) AS TotalDelay
FROM 2004_cleaned
WHERE ArrDelay > 15;

SELECT
  'CarrierDelay' AS DelayType, SUM(CarrierDelay) AS DelayMinutes FROM 2004_cleaned WHERE ArrDelay > 15
UNION ALL
SELECT
  'WeatherDelay', SUM(WeatherDelay) FROM 2004_cleaned WHERE ArrDelay > 15
UNION ALL
SELECT
  'NASDelay', SUM(NASDelay) FROM 2004_cleaned WHERE ArrDelay > 15
UNION ALL
SELECT
  'SecurityDelay', SUM(SecurityDelay) FROM 2004_cleaned WHERE ArrDelay > 15
UNION ALL
SELECT
  'LateAircraftDelay', SUM(LateAircraftDelay) FROM 2004_cleaned WHERE ArrDelay > 15;
