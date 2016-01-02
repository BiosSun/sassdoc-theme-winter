{# item access #}
{% if display.access.length > 1 and item.access != 'public' %}
    <span class="item-access" title="this item access is {{ item.access }}.">{{ item.access.substring(0, 2) }}</span>
{% endif %}
