{# variable item type #}
{% if item.type %}
    <span class="item-types">
        {% for type in item.type %}
            <span class="item-type" title="type">
                {% if item.type == "*" %}
                    Any
                {% else %}
                    {{ type | capitalize }}
                {% endif %}
            </span>
        {% endfor %}
    </span>
{% endif %}
