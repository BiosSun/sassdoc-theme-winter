{% if package.repository|isGitHub %}
    <a class="item-source-link" href="{{ package.repository|getRepositoryFileLink(package.version, sourceLinkPrefix + item.file.path, item.commentRange.start, item.commentRange.end) }}" target="_blank">source</a>
{% endif %}
