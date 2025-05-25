SELECT COUNT(*) AS total_cancel
FROM 2004_cleaned
WHERE Cancelled = 1;

---
SELECT
  CancellationCode,
  COUNT(*) AS CancelCount,
  ROUND(COUNT(*) * 100.0 / 127757, 2) AS CancelPercentage
FROM 2004_cleaned
WHERE Cancelled = 1
GROUP BY CancellationCode
ORDER BY CancelCount DESC;

---
SELECT
  UniqueCarrier,
  COUNT(*) AS CancelCount,
  ROUND(COUNT(*) * 100.0 / 127757, 2) AS CancelPercentage
FROM 2004_cleaned
WHERE Cancelled = 1
GROUP BY UniqueCarrier
ORDER BY CancelCount DESC;

---
SELECT
  Origin,
  COUNT(*) AS CancelCount,
  ROUND(COUNT(*) * 100.0 / 127757, 2) AS CancelPercentage
FROM 2004_cleaned
WHERE Cancelled = 1
GROUP BY Origin
ORDER BY CancelCount DESC;

---
SELECT
  Month,
  COUNT(*) AS CancelCount,
  ROUND(COUNT(*) * 100.0 / 127757, 2) AS CancelPercentage
FROM 2004_cleaned
WHERE Cancelled = 1
GROUP BY Month
ORDER BY CancelCount DESC;
