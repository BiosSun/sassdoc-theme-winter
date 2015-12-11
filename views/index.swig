<!DOCTYPE html>
<html lang="{% if package.lang %}{{ package.lang }}{% else %}en{% endif %}">
    <head>
        <meta charset="utf-8" />
        <title>{{ package.title }}{% if package.description %} - {{ package.description }}{% endif %}</title>
        <link rel="stylesheet" href="assets/css/main.css" />
    </head>

    <body>

        {##
         # You can access any variable you set in your configuration file from the `view` object.
         # Basically your configuration file is passed to the view as the `view` object.
         #}
        {{ view.test_variable }}

        {# document content #}
        <article class="document">

            {# document header #}
            <header class="document-header">
                <div class="content-wrapper">
                    <h1 class="document-title">
                        {{ package.title }}
                        {% if package.version %}<span>{{ package.version }}</span>{% endif %}
                    </h1>
                </div>
            </header>

            {% if data.length == 0 %}
                <section class="empty-section">
                    <div class="content-wrapper">
                        <p>Seems like nothing has been documented yet!</p>
                    </div>
                </section>
            {% else %}
                {% for group_name, group in data.byGroupAndType %}
                <section class="document-group" id="id--{{ group_name }}">
                    <header class="document-group-header">
                        <div class="content-wrapper">
                            <h2 class="document-group-name">{{ groups[group_name] }}</h2>
                        </div>
                    </header>

                    {% for type_name, items in group %}

                        <section class="document-type" id="id--{{ group_name }}-{{ type_name }}">
                            <header class="document-type-header">
                                <div class="content-wrapper">
                                    <h3 class="document-type-name">{{ type_name }}</h3>
                                </div>
                            </header>

                            {% for item in items %}
                            <section class="document-item{% if 'deprecated'|in(item) %} deprecated{% endif %}" id="id--{{ group_name }}-{{ type_name }}-{{ item.context.name }}"
                                     data-group="{{ item.group }}"
                                     data-access="{{ item.access }}"
                                     data-type="{{ item.context.type }}">
                                    <header class="document-item-header">
                                        <div class="content-wrapper">
                                            {# item access #}
                                            {% if display.access.length > 1 %}
                                                <span class="document-item-access" title="this item access is {{ item.access }}.">
                                                    {{ item.access.substring(0, 2) }}
                                                </span>
                                            {% endif %}

                                            {# item name #}
                                            <h4 class="document-item-name">
                                                <a href="#{{ item.context.type }}-{{ item.context.name }}">{{ item.context.name }}</a>
                                            </h4>

                                            {# item version #}
                                            {% if item.since.length > 0 %}
                                                <span class="document-item-version">
                                                    {{ item.since[item.since.length - 1].version | safe }}
                                                </span>
                                            {% endif %}

                                            {# item aliased #}
                                            {% if display.alias && item.aliased.length > 0 %}
                                                <span class="document-item-aliased">
                                                    Aliases:
                                                    {% for alias in item.aliased %}
                                                        <a href="#{{ item.context.type }}-{{ alias }}">{{ alias }}</a>
                                                        {% if not loop.last %}, {% endif %}
                                                    {% endfor %}
                                                </span>
                                            {% endif %}

                                            {# variable item type #}
                                            {% if item.type %}
                                                <span class="document-item-types">
                                                    {% for type in item.type %}
                                                        <span class="document-item-type">
                                                            {% if item.type == "*" %}
                                                                Any
                                                            {% else %}
                                                                {{ type | capitalize }}
                                                            {% endif %}
                                                        </span>
                                                    {% endfor %}
                                                </span>
                                            {% endif %}
                                        </div>
                                    </header>

                                    {# sub header #}
                                    {% if 'deprecated'|in(item) %}
                                        <div class="document-item-sub-header">
                                            <div class="content-wrapper">
                                                <div class="document-item-deprecated"><strong>Deprecated!</strong> {{ item.deprecated|safe }}</div>
                                            </div>
                                        </div>
                                    {% endif %}

                                    <div class="document-item-body">
                                        <div class="content-wrapper">
                                            {# item description #}
                                            {% if item.description %}
                                                <div class="document-item-description">{{ item.description | safe }}</div>
                                            {% endif %}

                                            {# item content #}
                                            {% if 'content' | in(item) %}
                                                <div class="document-item-content">
                                                    <h5 class="sub-heading">Content</h5>
                                                    <p>该混入类允许传入额外的内容（通过<code>@content</code>指令）。</p>
                                                    {% if item.content !== "" %}{{ item.content }}{% endif %}
                                                </div>
                                            {% endif %}

                                            {% if item.parameter.length > 0 %}
                                                <div class="document-item-parameters">
                                                    <h5 class="sub-heading">Parameters</h5>

                                                    <dl class="item-parameters">
                                                        {% for parameter in item.parameter %}
                                                        <dt class="item-parameter-heading">
                                                            <strong class="item-parameter-name">
                                                                <code>${{ parameter.name }}</code>
                                                            </strong>

                                                            {% for type in parameter.type %}
                                                                <span class="item-parameter-type">
                                                                    {% if type == "*" %}
                                                                        Any
                                                                    {% else %}
                                                                        {{ type | capitalize }}
                                                                    {% endif %}
                                                                </span>
                                                            {% endfor %}

                                                            {% if parameter.default %}
                                                                <span class="item-parameter-default" title="{{ parameter.default }}">
                                                                    Default: <code>{{ parameter.default }}</code>
                                                                </span>
                                                            {% endif %}
                                                        </dt>
                                                        <dd class="item-parameter-description{% if not parameter.description %} visually-hidden{% endif %}">
                                                            {{ parameter.description | default('none') | safe }}
                                                        </dd>
                                                        {% endfor %}
                                                    </dl>
                                                </div>
                                            {% endif %}

                                            {% if item.property.length > 0 %}
                                                <div class="document-item-parameters document-item-propertys">
                                                    <h5 class="sub-heading">Propertys</h5>

                                                    <dl class="item-parameters">
                                                        {% for property in item.property %}
                                                        <dt class="item-parameter-heading">
                                                            <strong class="item-parameter-name">
                                                                <code>${{ property.name }}</code>
                                                            </strong>

                                                            {% for type in property.type %}
                                                                <span class="item-parameter-type">
                                                                    {% if type == "*" %}
                                                                        Any
                                                                    {% else %}
                                                                        {{ type | capitalize }}
                                                                    {% endif %}
                                                                </span>
                                                            {% endfor %}

                                                            {% if property.default %}
                                                                <span class="item-parameter-default" title="{{ property.default }}">
                                                                    Default: <code>{{ property.default }}</code>
                                                                </span>
                                                            {% endif %}
                                                        </dt>
                                                        <dd class="item-parameter-description{% if not property.description %} visually-hidden{% endif %}">
                                                            {{ property.description | default('none') | safe }}
                                                        </dd>
                                                        {% endfor %}
                                                    </dl>
                                                </div>
                                            {% endif %}

                                            {% if item.output %}
                                                <div class="document-item-output">
                                                    <h3 class="sub-heading">Output</h3>
                                                    {{ item.output|safe }}
                                                </div>
                                            {% endif %}

                                            {# item return #}
                                            {% if item.return %}
                                                <div class="document-item-return">
                                                    <h5 class="sub-heading">
                                                        Returns

                                                        {% for type in item.return.type %}
                                                        <span class="item-return-type">
                                                            {% if type == "*" %}
                                                                Any
                                                            {% else %}
                                                                {{ type | capitalize }}
                                                            {% endif %}
                                                        </span>
                                                        {% endfor %}
                                                    </h5>

                                                    <div class="item-return">
                                                        {% if item.return.description %}
                                                            {{ item.return.description | safe }}
                                                        {% endif %}
                                                    </div>
                                                </div>
                                            {% endif %}

                                            {# item example #}
                                            {% if item.example.length > 0 %}
                                                <div class="document-item-examples">
                                                    <h5 class="sub-heading">Example</h5>

                                                    {% for example in item.example %}
                                                        <div class="document-item-example">
                                                            {% if example.description %}
                                                                <div class="example-description">{{ example.description | safe }}</div>
                                                            {% endif %}

                                                            <pre class="example-code language-{{ example.type }}">
                                                                <code>{{ example.code | escape | safe }}</code>
                                                            </pre>
                                                        </div>
                                                    {% endfor %}
                                                </div>
                                            {% endif %}

                                            {# item throw #}
                                            {% if item.throw.length > 0 %}
                                                <div class="document-item-throws">
                                                    <h5 class="sub-heading">Throws</h5>

                                                    <ul class="list">
                                                        {% for _throw in item.throw %}
                                                            <li>{{ _throw | safe }}</li>
                                                        {% endfor %}
                                                    </ul>
                                                </div>
                                            {% endif %}

                                            {# item links #}
                                            {% if item.link.length > 0 %}
                                                <div class="document-item-links">
                                                    <h5 class="sub-heading">Links</h5>

                                                    <ul class="list">
                                                        {% for link in item.link %}
                                                            <li>
                                                                <a href="{{ link.url }}">
                                                                    {% if link.caption %}
                                                                        {{ link.caption }}
                                                                    {% else %}
                                                                        {{ link.url }}
                                                                    {% endif %}
                                                                </a>
                                                            </li>
                                                        {% endfor %}
                                                    </ul>
                                                </div>
                                            {% endif %}

                                            {% set title_displayed = false %}
                                            {% for require in item.require %}
                                                {% set isDisplay = display.access.indexOf(require.item.access) != -1 %}
                                                {% set isAlias = not display.alias and require.item.alias %}
                                                {% if isDisplay and not isAlias or require.external %}
                                                    {% if not title_displayed %}
                                                        {% set title_displayed = true %}
                                                        <div class="document-item-requires">
                                                            <h5 class="sub-heading">Requires</h5>
                                                            <ul class="list">
                                                    {% endif %}

                                                    {% if require.external %}
                                                        <li>
                                                            <span>[external]</span>
                                                            {% if require.url %}
                                                                <a href="{{ require.url }}"><code>{{ require.name }}</code></a>  {{ require.description }}</li>
                                                            {% else %}
                                                                <code>{{ require.name }}</code>
                                                            {% endif %}

                                                            {% if require.description %}
                                                                &mdash; {{ require.description }}
                                                            {% endif %}
                                                        </li>
                                                    {% else %}
                                                        <li>
                                                            <span class="item__cross-type">[{{ require.item.context.type }}]</span>
                                                            <a href="#{{ require.item.context.type }}-{{ require.item.context.name }}"><code>{{ require.item.context.name }}</code></a>
                                                            {% if require.description %}
                                                                &mdash; {{ require.description }}
                                                            {% endif %}
                                                        </li>
                                                    {% endif %}
                                                {% endif %}
                                            {% endfor %}
                                            {% if title_displayed %}
                                                    </ul>
                                                </div>
                                            {% endif %}

                                            {% set title_displayed = false %}
                                            {% for see in item.see %}
                                                {% set isDisplay = display.access.indexOf(see.access) != -1 %}
                                                {% set isAlias = not display.alias and see.alias %}
                                                {% if isDisplay and not isAlias %}
                                                    {% if not title_displayed %}
                                                        {% set title_displayed = true %}
                                                        <div class="document-item-see">
                                                            <h5 class="sub-heading">See</h5>
                                                            <ul class="list">
                                                    {% endif %}

                                                    <li>
                                                        <span>[{{ see.context.type }}]</span>
                                                        <a href="#{{ see.context.type }}-{{ see.context.name }}">
                                                            <code>{{ see.context.name }}</code>
                                                        </a>
                                                    </li>
                                                {% endif %}
                                            {% endfor %}
                                            {% if title_displayed %}
                                                    </ul>
                                                </div>
                                            {% endif %}

                                            {# item since #}
                                            {% if item.since.length > 1 %}
                                                <div class="document-item-changelogs">
                                                    <h5 class="sub-heading">Changelog</h5>

                                                    <ul class="list">
                                                        {% for since in item.since %}
                                                            <li>{{ since.version }}{% if since.description %} &mdash; {{ since.description | safe }}{% endif %}</li>
                                                        {% endfor %}
                                                    </ul>
                                                </div>
                                            {% endif %}

                                            {# item todo's #}
                                            {% if item.todo.length > 0 %}
                                                <div class="document-item-todos">
                                                    <h5 class="sub-heading">TODO's</h5>

                                                    <ul class="list">
                                                        {% for todo in item.todo %}
                                                            <li>{{ todo | safe }}</li>
                                                        {% endfor %}
                                                    </ul>
                                                </div>
                                            {% endif %}
                                        </div>
                                    </div>

                                    <footer class="document-item-footer">
                                        <div class="content-wrapper">
                                            {# item author #}
                                            {% if item.author.length > 0 %}
                                                <div class="document-item-authors">
                                                    <h5 class="title">Author{% if item.author.length > 1 %}s{% endif %}</h5>

                                                    <ul class="list">
                                                        {% for author in item.author %}
                                                        <li>{{ author | safe }}</li>
                                                        {% endfor %}
                                                    </ul>
                                                </div>
                                            {% endif %}
                                        </div>
                                    </footer>
                                </section>
                            {% endfor %}
                        </section>

                    {% endfor %}
                </section>
                {% endfor %}
            {% endif %}

            {# document footer #}
            <footer>
                <div class="content-wrapper">
                    <span class="copyright">
                        © {{ now.year }}, {{ package.title }}. All rights reserved.
                    </span>
                    <span class="watermark">
                        Built with
                        <a href="https://github.com/SassDoc/sassdoc">SassDoc</a>
                        and
                        <a href="https://github.com/BiosSun/sassdoc-theme-winter">SassDoc Theme Winter</a>.
                    </span>
                </div>
            </footer>
        </article>

        <script src="assets/js/main.js"></script>
    </body>
</html>
