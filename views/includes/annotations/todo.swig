{# item todo's #}
{% if item.todo.length > 0 %}
    <div class="item-todos">
        <h5 class="sub-heading">待处理任务</h5>

        <ul class="list">
            {% for todo in item.todo %}
                <li>{{ todo | safe }}</li>
            {% endfor %}
        </ul>
    </div>
{% endif %}
