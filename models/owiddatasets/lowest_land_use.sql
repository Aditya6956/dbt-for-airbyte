{{ config(materialized='table') }}

WITH source_data AS (
    SELECT
        "Entity",
        MIN(land_use_1000kcal) as FOOD_BY_WHICH_LOWEST_LAND_USAGE
    FROM
        public.environmental_food_impacts
    GROUP BY
        "Entity"
    ORDER BY 2 ASC
    LIMIT 1
)

SELECT * FROM source_data