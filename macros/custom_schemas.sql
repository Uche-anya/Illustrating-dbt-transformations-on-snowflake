{% macro generate_schema_name(custom_schema_name, node) %}
    {% if custom_schema_name is none %}
        {% if "staging" in node.path %}
            dbt_processing_schema
        {% elif "facts" in node.path %}
            dbt_processing_schema
        {% else %}
            my_dbt_schema
        {% endif %}
    {% else %}
        {{ custom_schema_name }}
    {% endif %}
{% endmacro %}
