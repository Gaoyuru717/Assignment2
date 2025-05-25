CREATE OR REPLACE VIEW 2004_cleaned AS
SELECT
    Year,
    Month,
    DayofMonth,
    DayOfWeek,
    CRSDepTime,
    DepTime,
    CRSArrTime,
    ArrTime,
    UniqueCarrier,
    FlightNum,
    TailNum,
    ActualElapsedTime,
    CRSElapsedTime,
    AirTime,
    ArrDelay,
    DepDelay,
    Origin,
    Dest,
    Distance,
    TaxiIn,
    TaxiOut,
    Cancelled,
    CancellationCode,
    Diverted,
    CarrierDelay,
    WeatherDelay,
    NASDelay,
    SecurityDelay,
    LateAircraftDelay
FROM
    airline
WHERE
    CRSDepTime IS NOT NULL AND CRSArrTime IS NOT NULL
    AND (
        Cancelled = 1
        OR (CarrierDelay IS NOT NULL OR WeatherDelay IS NOT NULL OR NASDelay IS NOT NULL
            OR SecurityDelay IS NOT NULL OR LateAircraftDelay IS NOT NULL)
        OR (ArrDelay IS NOT NULL AND DepDelay IS NOT NULL)
    );

---
SELECT * FROM 2004_cleaned LIMIT 16;
