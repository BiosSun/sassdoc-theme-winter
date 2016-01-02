{# item throw #}
{% if item.throw.length > 0 %}
    <div class="item-throws">
        <h5 class="sub-heading">Throws</h5>

        <ul class="list">
            {% for _throw in item.throw %}
                <li>{{ _throw | safe }}</li>
            {% endfor %}
        </ul>
    </div>
{% endif %}
