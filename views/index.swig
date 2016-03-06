{% extends './layouts/base.swig' %}

{% block content %}

    {% if fragments && fragments.document %}
        <section class="fragment" id="id--fragment-document">
            {{ fragments.document | safe }}
        </section>
    {% endif %}

    {% for group_name in data.byGroupAndType | getKeysBySort(display.sort.group) %}
        {% set group = data.byGroupAndType[group_name] %}
        <section class="group" id="id--{{ group_name }}">
            <header class="group-header">
                <h2 class="group-name">{{ groups[group_name] }}</h2>
            </header>

            {% if fragments && fragments.group && fragments.group[group_name] %}
                <section class="fragment" id="id--fragment-{{ group_name }}">
                    {{ fragments.group[group_name] | safe }}
                </section>
            {% endif %}

            {% for type_name in group | getKeysBySort(display.sort.type) %}
                {% set items = group[type_name] %}
                <section class="type" id="id--{{ group_name }}-{{ type_name }}">
                    <header class="type-header">
                        <h3 class="type-name">{{ (type_name + 's') | capitalize }}</h3>
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
