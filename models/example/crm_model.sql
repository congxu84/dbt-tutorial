
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select *
from {{ source('edi_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx', 'contact') }}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
