{% extends './layouts/base.swig' %}

{% block content %}
    {% for group_name, group in data.byGroupAndType %}
        <section class="group" id="id--{{ group_name }}">
            <header class="group-header">
                <div class="content-wrapper">
                    <h2 class="group-name">{{ groups[group_name] }}</h2>
                </div>
            </header>

            {% for type_name, items in group %}
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
