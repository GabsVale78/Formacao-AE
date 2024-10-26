{% macro round_decimals(column_name, scale=2) %}

    (round({{ column_name }},2))::numeric(16, {{ scale }})

{% endmacro %}
