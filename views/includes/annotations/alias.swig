{# item aliased #}
    {% if display.alias && item.aliased.length > 0 %}
    <span class="item-aliased">
        别名:
        {% for alias in item.aliased %}
            <a href="#{{ item.context.type }}-{{ alias }}">{{ alias }}</a>
            {% if not loop.last %}, {% endif %}
        {% endfor %}
    </span>
{% endif %}
