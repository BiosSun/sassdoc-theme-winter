{# variable item type #}
{% if item.type %}
    <span class="item-types">
        {% for type in item.type %}
            <span class="item-type" title="type">
                {% if type == "*" %}
                    any
                {% else %}
                    {{ type }}
                {% endif %}
            </span>
        {% endfor %}
    </span>
{% endif %}
