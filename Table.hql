DROP TABLE IF EXISTS airline;
CREATE EXTERNAL TABLE airline (
  Year INT,
  Month INT,
  DayofMonth INT,
  DayOfWeek INT,
  DepTime STRING,
  CRSDepTime STRING,
  ArrTime STRING,
  CRSArrTime STRING,
  UniqueCarrier STRING,
  FlightNum STRING,
  TailNum STRING,
  ActualElapsedTime STRING,
  CRSElapsedTime STRING,
  AirTime STRING,
  ArrDelay INT,
  DepDelay INT,
  Origin STRING,
  Dest STRING,
  Distance INT,
  TaxiIn STRING,
  TaxiOut STRING,
  Cancelled INT,
  CancellationCode STRING,
  Diverted INT,
  CarrierDelay STRING,
  WeatherDelay STRING,
  NASDelay STRING,
  SecurityDelay STRING,
  LateAircraftDelay STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/maria_dev/ass2/'
TBLPROPERTIES ("skip.header.line.count"="1");

SELECT * FROM airline LIMIT 15;
