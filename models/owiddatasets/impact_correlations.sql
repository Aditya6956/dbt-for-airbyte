{{ config(materialized='table') }}

WITH impact_correlations as (
    SELECT
        CORR(ghg_1000kcal, land_use_1000kcal) AS GHG_LAND_USE_CORRELATION,
        CORR(eutrophication_1000kcal, water_scarcity_1000kcal) AS EUTROPHICATION_WATER_SCARCITY_CORRELATION,
        CORR(water_1000kcal, biodiversity_1000kcal) AS WATER_BIODIVERSITY_CORRELATION
    FROM
        public.environmental_food_impacts
)

SELECT * FROM impact_correlations