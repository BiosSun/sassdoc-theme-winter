<!DOCTYPE html>

<html lang="{% if package.lang %}{{ package.lang }}{% else %}en{% endif %}">
    <head>
        {% include "../includes/partials/head.swig" %}
    </head>

    <body>
        {##
         # You can access any variable you set in your configuration file from the `view` object.
         # Basically your configuration file is passed to the view as the `view` object.
         #}
        {{ view.test_variable }}

        {# Sidebar #}
        <aside class="sidebar" role="nav">
            {% block sidebar %}{% endblock %}
        </aside>

        {# document content #}
        <article class="document" role="main">
            {% include "../includes/partials/header.swig" %}

            <div class="content content-wrapper">
                {% if data.length == 0 %}
                    <section class="empty-section">
                        <p>Seems like nothing has been documented yet!</p>
                    </section>
                {% else %}
                    {% block content %}{% endblock %}
                {% endif %}
            </div>

            {% include "../includes/partials/footer.swig" %}
        </article>

        {% include "../includes/partials/foot.swig" %}
    </body>
</html>



