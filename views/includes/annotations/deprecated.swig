{# sub header #}
{% if 'deprecated'|in(item) %}
    <div class="item-sub-header">
        <div class="content-wrapper">
            <div class="item-deprecated"><strong>Deprecated!</strong> {{ item.deprecated | safe }}</div>
        </div>
    </div>
{% endif %}
