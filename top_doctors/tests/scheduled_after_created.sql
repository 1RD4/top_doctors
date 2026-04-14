SELECT 
  *
FROM 
  {{ ref('fct_appointments') }}
WHERE
   scheduled_at <= created_at