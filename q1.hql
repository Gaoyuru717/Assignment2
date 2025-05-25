WITH flights_with_period AS (
  SELECT *,
    CASE
      WHEN CRSDepTime BETWEEN 500 AND 1159 THEN 'Morning'
      WHEN CRSDepTime BETWEEN 1200 AND 1759 THEN 'Afternoon'
      WHEN CRSDepTime BETWEEN 1800 AND 2359 THEN 'Evening'
      ELSE 'Night'
    END AS DepPeriod
  FROM 2004_cleaned
)

SELECT
  DepPeriod,
  ROUND(AVG(DepDelay), 2) AS Avg_DepDelay,
  COUNT(*) AS Flight_Count
FROM flights_with_period
GROUP BY DepPeriod
ORDER BY Avg_DepDelay ASC;

---2
SELECT
  DayOfWeek,
  ROUND(100.0 * SUM(CASE WHEN DepDelay <= 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS OnTimePercentage,
  COUNT(*) AS Flight_Count
FROM 2004_cleaned
GROUP BY DayOfWeek
ORDER BY DayOfWeek;

--3 month
SELECT
  Month,
  ROUND(100.0 * SUM(CASE WHEN DepDelay <= 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS OnTimePercentage,
  COUNT(*) AS Flight_Count
FROM 2004_cleaned
GROUP BY Month
ORDER BY Month;

--3.2 season
SELECT
  CASE 
    WHEN Month IN (12, 1, 2) THEN 'Winter'
    WHEN Month IN (3, 4, 5) THEN 'Spring'
    WHEN Month IN (6, 7, 8) THEN 'Summer'
    ELSE 'Fall'
  END AS Season,
  ROUND(100.0 * SUM(CASE WHEN DepDelay <= 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS OnTimePercentage,
  COUNT(*) AS Flight_Count
FROM 2004_cleaned
GROUP BY CASE 
    WHEN Month IN (12, 1, 2) THEN 'Winter'
    WHEN Month IN (3, 4, 5) THEN 'Spring'
    WHEN Month IN (6, 7, 8) THEN 'Summer'
    ELSE 'Fall'
  END
ORDER BY Season;
