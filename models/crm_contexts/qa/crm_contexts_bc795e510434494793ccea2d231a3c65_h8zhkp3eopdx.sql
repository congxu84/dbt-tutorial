
{{ config(schema='edi_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx') }}

-- todo: systemType and systemId should be from EDI maintained mapping table
select 'Contact' as type, id, 'Salesforce' as systemType, '00D6A000001WYE8UAO' as systemId, name, email, _fivetran_synced
from {{ source('edi_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx', 'contact') }}

-- Lead table may not exist
{% set source_relation = adapter.get_relation(
      database=this.database,
      schema=this.schema,
      identifier='lead') %}

{% set table_exists=source_relation is not none %}

{% if table_exists %}

union all

select 'Lead' as type, id, 'Salesforce' as systemType, '00D6A000001WYE8UAO' as systemId, name, email, _fivetran_synced
from {{ source('edi_bc795e510434494793ccea2d231a3c65_h8zhkp3eopdx', 'lead') }}

{% endif %}
