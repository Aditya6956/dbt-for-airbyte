{{ config(materialized='table') }}

WITH extracted_data AS (
  SELECT
    _airbyte_ab_id AS record_id,
    (_airbyte_data::jsonb)->>'Date' AS date,
    (_airbyte_data::jsonb)->>'Temp' AS temp,
    (_airbyte_data::jsonb)->>'Time' AS time,
    (_airbyte_data::jsonb)->>'Wind' AS wind,
    (_airbyte_data::jsonb)->>'Humidity' AS humidity,
    (_airbyte_data::jsonb)->>'Pressure' AS pressure,
    (_airbyte_data::jsonb)->>'Dew Point' AS dew_point,
    (_airbyte_data::jsonb)->>'Wind Gust' AS wind_gust,
    (_airbyte_data::jsonb)->>'Conditions' AS conditions,
    (_airbyte_data::jsonb)->>'Wind Speed' AS wind_speed,
    (_airbyte_data::jsonb)->>'Precipitation' AS precipitation,
    (_airbyte_data::jsonb)->>'_ab_source_file_url' AS source_file_url,
    (_airbyte_data::jsonb)->>'_ab_source_file_last_modified' AS source_file_last_modified,
    _airbyte_emitted_at AS emitted_at

  FROM
    public._airbyte_raw_output
)

SELECT

  date::date AS Date,
  temp::float AS Temperature,
  time AS Time,
  wind::text AS Wind,
  humidity::integer AS Humidity,
  pressure::float AS Pressure,
  dew_point::float AS Dew_point,
  wind_gust::float AS Wind_gust,
  conditions::text AS Conditions,
  wind_speed::float AS Wind_speed,
  precipitation::float AS Precipitation
FROM
  extracted_data
