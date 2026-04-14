{{ config(
    materialized='incremental',
    unique_key='appointment_id',
    incremental_strategy='merge',
    partition_by={
        'field': 'scheduled_at',
        'data_type': 'date',
        'granularity': 'day'
    },
    cluster_by=['doctor_id', 'patient_id', 'status']
) }}

SELECT
    appointment_id,
    patient_id,
    doctor_id,
    scheduled_at,
    created_at,
    status,
    consultation_type
    FROM 
    {{ ref('int_appointments_clean') }}

{% if is_incremental() %}
    WHERE created_at > (
        SELECT MAX(created_at) FROM {{ this }}
    )
    OR scheduled_at > (
        SELECT MAX(scheduled_at) FROM {{ this }}
    )
{% endif %}
