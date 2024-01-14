{{ config(materialized='table') }}

-- File: models/monthly_precipitation_sum.sql

-- Calculate monthly precipitation sum
WITH monthly_precipitation AS (
  SELECT
    DATE_TRUNC('month', Date) AS month,
    SUM(precipitation) AS total_precipitation
  FROM
    public.weather_data_clean
  GROUP BY
    month
)

-- Select the monthly precipitation sum
SELECT
  month,
  total_precipitation
FROM
  monthly_precipitation
