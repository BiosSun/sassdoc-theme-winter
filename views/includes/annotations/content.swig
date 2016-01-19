{# item content #}
{% if 'content' | in(item) %}
    <div class="item-content">
        <h5 class="sub-heading">@Content</h5>
        <p>该混入类允许传入额外的内容（通过<code>@content</code>指令）。</p>
        {% if item.content !== "" %}{{ item.content }}{% endif %}
    </div>
{% endif %}
