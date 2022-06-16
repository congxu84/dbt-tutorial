
{{ config(materialized='table', schema='edi_bc795e510434494793ccea2d231a3c65') }}

select *
from {{ ref('crm_contexts_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx') }}

union all

select *
from {{ ref('crm_contexts_bc795e510434494793ccea2d231a3c65_vaalah5lhyqw') }}
