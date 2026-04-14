SELECT
    CAST(doctor_id AS STRING) AS doctor_id,
    CAST(specialty AS STRING) AS specialty,
    CAST(clinic_id AS STRING) AS clinic_id,
    PARSE_DATE('%d/%m/%Y', created_at) AS created_at
FROM 
    {{ ref('raw_doctors') }}