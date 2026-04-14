SELECT
    patient_id,
    created_at,
    country_id
FROM 
    {{ ref('stg_patients') }}