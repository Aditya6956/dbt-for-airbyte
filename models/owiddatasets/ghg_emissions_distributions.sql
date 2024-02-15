{{ config(materialized='table') }}

WITH emissions_histogram AS (
  SELECT
    "ghg_kg"
  FROM
    public.environmental_food_impacts
)

SELECT
  width_bucket(ghg_kg, min_ghg, max_ghg, 10) AS emissions_bin,
  COUNT(*) AS count_in_bin
FROM (
  SELECT
    "ghg_kg",
    MIN(ghg_kg) OVER () AS min_ghg,
    MAX(ghg_kg) OVER () AS max_ghg
  FROM
    emissions_histogram
) AS stats
GROUP BY
  "emissions_bin"
ORDER BY
  "emissions_bin"