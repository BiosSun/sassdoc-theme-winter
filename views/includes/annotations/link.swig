{# item links #}
{% if item.link.length > 0 %}
    <div class="item-links">
        <h5 class="sub-heading">Links</h5>

        <ul class="list">
            {% for link in item.link %}
                <li>
                    <a href="{{ link.url }}" target="_blank">
                        {% if link.caption %}
                            {{ link.caption }}
                        {% else %}
                            {{ link.url }}
                        {% endif %}
                    </a>
                </li>
            {% endfor %}
        </ul>
    </div>
{% endif %}
