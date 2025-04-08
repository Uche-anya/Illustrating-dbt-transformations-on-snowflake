-- models/staging/customers_stg.sql
WITH null_check AS (
  -- Check for NULL values in the email column
  {{ not_null_check('landing.customers', 'email') }}
),
SELECT
     customerid,
     firstname,
     lastname,
     email,
     phone,
     address,
     city,
     state,
     zipcode,
     updated_at,
     concat(firstname, ' ', lastname) AS customername
FROM
   {{ source('landing', 'customers') }};


























