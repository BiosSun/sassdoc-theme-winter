{% if package.repository
        && package.repository.type === 'git'
        && package.repository.homepage
        && package.repository.homepage.indexOf('github') !== -1 %}
    <a class="item-source-link" href="{{ package.repository.homepage}}/blob/{{ package.version }}/{{ item.file.path | url_encode }}#L{{ item.commentRange.start }}-L{{ item.commentRange.end }}" target="_blank">source</a>
{% endif %}
