SELECT
  scheduled_at,
  doctor_id,
  COUNT(*) as cnt
FROM 
    {{ ref('fct_appointments') }}
GROUP BY 
    scheduled_at,
    doctor_id
HAVING 
    COUNT(*) > 50