{{ config(materialized='table') }}

-- File: models/daily_average_temperature.sql

-- Calculate daily average temperature
WITH daily_temperature AS (
  SELECT
    date,
    AVG(temperature) AS avg_temperature
  FROM
    weather_data_clean -- Replace with the actual name of your transformed data model
  GROUP BY
    date
)

-- Select the daily average temperature
SELECT
  date,
  avg_temperature
FROM
  daily_temperature
