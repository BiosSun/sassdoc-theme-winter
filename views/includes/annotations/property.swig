{% if item.property.length > 0 %}
    <div class="item-parameters item-propertys">
        <h5 class="sub-heading">Propertys</h5>

        <dl class="item-parameters">
            {% for property in item.property %}
            <dt class="item-parameter-heading">
                <strong class="item-parameter-name">
                    <code>${{ property.name }}</code>
                </strong>

                {% spaceless %}
                    {% for type in property.type %}
                        <span class="item-parameter-type">
                            {% if type == "*" %}
                                Any
                            {% else %}
                                {{ type | capitalize }}
                            {% endif %}
                        </span>
                    {% endfor %}
                {% endspaceless %}

                {% spaceless %}
                    {% if property.default %}
                        <span class="item-parameter-default" title="{{ property.default }}">
                            Default: <code>{{ property.default }}</code>
                        </span>
                    {% endif %}
                {% endspaceless %}
            </dt>
            <dd class="item-parameter-description{% if not property.description %} visually-hidden{% endif %}">
                {{ property.description | default('none') | safe }}
            </dd>
            {% endfor %}
        </dl>
    </div>
{% endif %}
