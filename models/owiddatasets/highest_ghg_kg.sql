{{ config(materialized='table') }}

WITH source_data as (
    SELECT
        "Entity",
        MAX(ghg_kg) AS FOOD_BY_WHICH_MAX_GREEN_HOUSE_GAS_EMITTED
    FROM
        public.environmental_food_impacts
    GROUP BY
        "Entity"
    ORDER BY 2 DESC
    LIMIT 1
)

SELECT * FROM source_data