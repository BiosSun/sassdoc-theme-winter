{# item return #}
{% if item.return %}
    <div class="item-return">
        <h5 class="sub-heading">
            返回值

            {% for type in item.return.type %}
            <span class="item-return-type">
                {% if type == "*" %}
                    Any
                {% else %}
                    {{ type | capitalize }}
                {% endif %}
            </span>
            {% endfor %}
        </h5>

        <div class="item-return">
            {% if item.return.description %}
                {{ item.return.description | safe }}
            {% endif %}
        </div>
    </div>
{% endif %}
