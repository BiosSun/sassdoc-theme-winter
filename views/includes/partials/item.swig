<section class="item{% if 'deprecated'|in(item) %} deprecated{% endif %}" id="id--{{ group_name }}-{{ type_name }}-{{ item.context.name }}"
         data-group="{{ item.group }}"
         data-access="{{ item.access }}"
         data-type="{{ item.context.type }}">
    <header class="item-header">
        {# item name #}
        <h4 class="item-name">
            {% include "./item-source-link.swig" %}

            {% include "../annotations/access.swig" %}
            {% include "./item-name.swig" %}

            {# item version #}
            {% if item.since.length > 0 %}
                <span class="item-version">
                    {{ item.since[item.since.length - 1].version | safe }}
                </span>
            {% endif %}

            {% include "../annotations/alias.swig" %}

            {% include "../annotations/type.swig" %}
        </h4>
    </header>

    {% include "../annotations/deprecated.swig" %}

    <div class="item-body">
        {% include "../annotations/description.swig" %}
        {% include "../annotations/content.swig" %}
        {% include "../annotations/parameter.swig" %}
        {% include "../annotations/property.swig" %}
        {% include "../annotations/output.swig" %}
        {% include "../annotations/return.swig" %}
        {% include "../annotations/example.swig" %}
        {% include "../annotations/throw.swig" %}
        {% include "../annotations/link.swig" %}
        {% include "../annotations/require.swig" %}
        {% include "../annotations/see.swig" %}
        {% include "../annotations/since.swig" %}
        {% include "../annotations/todo.swig" %}
    </div>
</section>
