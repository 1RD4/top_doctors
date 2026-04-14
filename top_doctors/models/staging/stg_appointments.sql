SELECT
    CAST(appointment_id AS STRING) AS appointment_id,
    CAST(patient_id AS STRING) AS patient_id,
    CAST(doctor_id AS STRING) AS doctor_id,
    PARSE_DATE('%d/%m/%Y', scheduled_at) AS scheduled_at,
    PARSE_DATE('%d/%m/%Y', created_at) AS created_at,
    LOWER(TRIM(status)) AS status,
    LOWER(TRIM(consultation_type)) AS consultation_type
FROM 
    {{ ref('raw_appointments') }}
