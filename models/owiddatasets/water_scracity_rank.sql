{{ config(materialized='table') }}

WITH ranked_products AS (
  SELECT
    RANK() OVER (ORDER BY water_scarcity_kg DESC) AS water_scarcity_rank,
    "Entity",
    "water_scarcity_kg"
  FROM
    public.environmental_food_impacts
)

SELECT
  "Entity",
  "water_scarcity_kg",
  "water_scarcity_rank"
FROM
  ranked_products