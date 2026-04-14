SELECT
    doctor_id,
    specialty,
    clinic_id,
    created_at
FROM 
    {{ ref('stg_doctors') }}