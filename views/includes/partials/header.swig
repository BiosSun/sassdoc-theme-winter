{# document header #}
<header class="header">
    <div class="content-wrapper">
        <h1 class="title">
            {{ package.title }}
            {% if package.version %}<span>{{ package.version }}</span>{% endif %}
        </h1>
        {% if package.description %}
        <p class="tagline">{{ package.description }}</p>
        {% endif %}
    </div>
</header>
