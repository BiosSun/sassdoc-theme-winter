{# item author #}
{% if item.author.length > 0 %}
    <div class="item-authors">
        <h5 class="title">Author{% if item.author.length > 1 %}s{% endif %}</h5>

        <ul class="list">
            {% for author in item.author %}
            <li>{{ author | safe }}</li>
            {% endfor %}
        </ul>
    </div>
{% endif %}
