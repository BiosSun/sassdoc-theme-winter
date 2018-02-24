<table class="variables" id="id--{{ group_name }}-{{ type_name }}-variables">
    <thead>
        <tr>
            <th>变量</th>
            <th>类型</th>
            <th>默认值</th>
            <th>说明</th>
        </tr>
    </thead>
    <tbody>
        {% for item in items %}
            <tr>
                <td class="variables-item-name">
                    ${{ item.context.name }}
                </td>
                <td class="variables-item-types">
                    {% include "../annotations/type.swig" %}
                </td>
                <td class="variables-item-default">
                    <span class="item-value"><code>{{ item.context.value }}</code></span>
                </td>
                <td class="variables-item-description">
                    {% include "../annotations/description.swig" %}
                    {% include "../annotations/content.swig" %}
                    {% include "../annotations/parameter.swig" %}
                    {% include "../annotations/property.swig" %}
                    {% include "../annotations/output.swig" %}
                    {% include "../annotations/return.swig" %}
                    {% include "../annotations/example.swig" %}
                    {% include "../annotations/throw.swig" %}
                    {% include "../annotations/link.swig" %}

                    {% if display.require !== false %}
                        {% include "../annotations/require.swig" %}
                    {% endif %}

                    {% include "../annotations/see.swig" %}
                    {% include "../annotations/since.swig" %}
                    {% include "../annotations/todo.swig" %}
                </td>
            </tr>
        {% endfor %}
    </tbody>
</table>