WITH deduplicated AS (

    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY appointment_id
            ORDER BY created_at DESC
        ) AS rn

    FROM {{ ref('stg_appointments') }}

)

SELECT
    appointment_id,
    patient_id,
    doctor_id,
    scheduled_at,
    created_at,

    CASE
        WHEN status IN ('completed','done') THEN 'completed'
        WHEN status IN ('cancelled','canceled') THEN 'cancelled'
        WHEN status IN ('booked') THEN 'booked'
        WHEN status IN ('no_show') THEN 'no_show'
    END AS status,

    consultation_type

FROM 
    deduplicated
WHERE 
    rn = 1
