
{% macro duplicate_check(table_name, column_name) %}
  SELECT {{ column_name }}, COUNT(*)
  FROM {{ table_name }}
  GROUP BY {{ column_name }}
  HAVING COUNT(*) > 1
{% endmacro %}
