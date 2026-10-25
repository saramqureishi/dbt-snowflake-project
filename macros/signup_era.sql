{% macro signup_era(date_column) %}
    case
        when {{ date_column }} < '2026-03-01' then 'Early'
        when {{ date_column }} < '2026-04-01' then 'Mid'
        else 'Late'
    end
{% endmacro %}
