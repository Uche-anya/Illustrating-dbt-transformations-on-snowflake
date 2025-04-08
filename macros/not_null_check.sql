-- macros/not_null_check.sql
{% macro not_null_check(table_name, column_name) %}
  SELECT COUNT(*)
  FROM {{ table_name }}
  WHERE {{ column_name }} IS NULL
{% endmacro %}
