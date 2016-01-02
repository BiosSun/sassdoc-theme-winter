{% set title_displayed = false %}
{% for require in item.require %}
    {% set isDisplay = display.access.indexOf(require.item.access) != -1 %}
    {% set isAlias = not display.alias and require.item.alias %}
    {% if isDisplay and not isAlias or require.external %}
        {% if not title_displayed %}
            {% set title_displayed = true %}
            <div class="item-requires">
                <h5 class="sub-heading">Requires</h5>
                <ul class="list">
        {% endif %}

        {% if require.external %}
            <li>
                <span>[external]</span>
                {% if require.url %}
                    <a href="{{ require.url }}"><code>{{ require.name }}</code></a>  {{ require.description }}</li>
                {% else %}
                    <code>{{ require.name }}</code>
                {% endif %}

                {% if require.description %}
                    &mdash; {{ require.description }}
                {% endif %}
            </li>
        {% else %}
            <li>
                <span class="require-type" data-type="{{ require.item.context.type }}">{{ require.item.context.type[0] }}</span>
                <a class="require-name" href="#id--{{ require.item.group[0] }}-{{ require.item.context.type }}-{{ require.item.context.name }}"><code>{{ require.item.context.name }}</code></a>
                {% if require.description %}
                    &mdash; {{ require.description }}
                {% endif %}
            </li>
        {% endif %}
    {% endif %}
{% endfor %}
{% if title_displayed %}
        </ul>
    </div>
{% endif %}
