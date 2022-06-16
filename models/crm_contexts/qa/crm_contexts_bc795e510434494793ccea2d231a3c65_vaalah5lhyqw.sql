
{{ config(schema='edi_bc795e510434494793ccea2d231a3c65_vaalah5lhyqw') }}

select 'Contact' as type, id, 'Salesforce' as systemType, '00D0q0000009aFIEAY' as systemId, name, email, _fivetran_synced
from {{ source('edi_bc795e510434494793ccea2d231a3c65_vaalah5lhyqw', 'contact') }}

{% set source_relation = adapter.get_relation(
      database=this.database,
      schema=this.schema,
      identifier='lead') %}

{% set table_exists=source_relation is not none %}

{% if table_exists %}

union all

select 'Lead' as type, id, 'Salesforce' as systemType, '00D0q0000009aFIEAY' as systemId, name, email, _fivetran_synced
from {{ source('edi_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx', 'lead') }}

{% endif %}
