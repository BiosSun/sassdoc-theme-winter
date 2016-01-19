{# item example #}
{% if item.example.length > 0 %}
    <div class="item-examples">
        <h5 class="sub-heading">示例</h5>

        {% for example in item.example %}
            <div class="item-example">
                {% if example.description %}
                    <div class="example-description">{{ example.description | safe }}</div>
                {% endif %}

                <pre class="example-code" data-language="{{ example.type }}"><code>{{ example.code | safe }}</code></pre>
            </div>
        {% endfor %}
    </div>
{% endif %}
