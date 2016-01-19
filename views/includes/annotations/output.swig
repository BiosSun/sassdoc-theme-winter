{% if item.output %}
    <div class="item-output">
        <h5 class="sub-heading">输出说明</h5>
        {{ item.output|safe }}
    </div>
{% endif %}
