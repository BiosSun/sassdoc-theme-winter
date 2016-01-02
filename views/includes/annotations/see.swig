{% set title_displayed = false %}
{% for see in item.see %}
    {% set isDisplay = display.access.indexOf(see.access) != -1 %}
    {% set isAlias = not display.alias and see.alias %}
    {% if isDisplay and not isAlias %}
        {% if not title_displayed %}
            {% set title_displayed = true %}
            <div class="item-see">
                <h5 class="sub-heading">See</h5>
                <ul class="list">
        {% endif %}

        <li>
            <span>[{{ see.context.type }}]</span>
            <a href="#{{ see.context.type }}-{{ see.context.name }}">
                <code>{{ see.context.name }}</code>
            </a>
        </li>
    {% endif %}
{% endfor %}
{% if title_displayed %}
        </ul>
    </div>
{% endif %}
