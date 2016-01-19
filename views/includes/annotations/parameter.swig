{% if item.parameter.length > 0 %}
    <div class="item-parameters">
        <h5 class="sub-heading">参数</h5>

        <dl class="item-parameters">
            {% for parameter in item.parameter %}
            <dt class="item-parameter-heading">
                <strong class="item-parameter-name">
                    <code>${{ parameter.name }}</code>
                </strong>

                {% spaceless %}
                    {% for type in parameter.type %}
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
                    {% if parameter.default %}
                        <span class="item-parameter-default" title="{{ parameter.default }}">
                            Default: <code>{{ parameter.default }}</code>
                        </span>
                    {% endif %}
                {% endspaceless %}
            </dt>
            <dd class="item-parameter-description{% if not parameter.description %} visually-hidden{% endif %}">
                {{ parameter.description | default('none') | safe }}
            </dd>
            {% endfor %}
        </dl>
    </div>
{% endif %}
