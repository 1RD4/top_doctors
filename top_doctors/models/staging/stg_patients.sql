SELECT
    CAST(patient_id AS STRING) AS patient_id,
    PARSE_DATE('%d/%m/%Y', created_at) AS created_at,
    CAST(country AS STRING) AS country_id,
FROM 
    {{ ref('raw_patients') }}