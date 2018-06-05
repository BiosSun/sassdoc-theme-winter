{# item example #}
{% if item.example.length > 0 %}
    <div class="item-examples">
        <h5 class="sub-heading">示例</h5>

        {% for example in item.example %}
            <div class="item-example">
                {% if example.description %}
                    <div class="example-description">{{ example.description | safe }}</div>
                {% endif %}

                <div class="example-code">
                    <pre><code class="lang-{{ example.type }}">{{ example.code | safe }}</code></pre>
                </div>
            </div>
        {% endfor %}
    </div>
{% endif %}
