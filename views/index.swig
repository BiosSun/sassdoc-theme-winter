{% extends './layouts/base.swig' %}

{% block content %}

    {% if fragments && fragments.document %}
        <section class="fragment" id="id--fragment-document">
            <div class="content-wrapper">
                {{ fragments.document | safe }}
            </div>
        </section>
    {% endif %}

    {% for group_name in data.byGroupAndType | getKeysBySort(display.sort.group) %}
        {% set group = data.byGroupAndType[group_name] %}
        <section class="group" id="id--{{ group_name }}">
            <header class="group-header">
                <div class="content-wrapper">
                    <h2 class="group-name">{{ groups[group_name] }}</h2>
                </div>
            </header>

            {% if fragments && fragments.group && fragments.group[group_name] %}
                <section class="fragment" id="id--fragment-{{ group_name }}">
                    <div class="content-wrapper">
                        {{ fragments.group[group_name] | safe }}
                    </div>
                </section>
            {% endif %}

            {% for type_name in group | getKeysBySort(display.sort.type) %}
                {% set items = group[type_name] %}
                <section class="type" id="id--{{ group_name }}-{{ type_name }}">
                    <header class="type-header">
                        <div class="content-wrapper">
                            <h3 class="type-name">{{ (type_name + 's') | capitalize }}</h3>
                        </div>
                    </header>

                    {% for item in items %}
                        {% include "./includes/partials/item.swig" %}
                    {% endfor %}
                </section>
            {% endfor %}
        </section>
    {% endfor %}
{% endblock %}

{% block sidebar %}
    {% include "./includes/partials/sidebar.swig" %}
{% endblock %}
