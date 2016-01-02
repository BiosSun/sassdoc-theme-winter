{# item todo's #}
{% if item.todo.length > 0 %}
    <div class="item-todos">
        <h5 class="sub-heading">TODO's</h5>

        <ul class="list">
            {% for todo in item.todo %}
                <li>{{ todo | safe }}</li>
            {% endfor %}
        </ul>
    </div>
{% endif %}
