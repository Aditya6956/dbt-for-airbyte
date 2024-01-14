{{ config(materialized='table') }}

WITH wind_speed_trends AS (
  SELECT
    date,
    wind_speed
  FROM
    public.weather_data_clean
  WHERE
    wind_speed IS NOT NULL
)

SELECT
  date,
  wind_speed,
  LAG(wind_speed) OVER (ORDER BY date) AS previous_day_wind_speed,
  LEAD(wind_speed) OVER (ORDER BY date) AS next_day_wind_speed
FROM
  wind_speed_trends
