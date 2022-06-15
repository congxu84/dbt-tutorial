
-- Use the `ref` function to select from other models

select *
from {{ source('edi_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx', 'account') }}
