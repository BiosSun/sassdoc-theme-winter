<div class="sidebar-body">
    {% if data.length == 0 %}
        <p class="empty-info">No documented item.</p>
    {% else %}
        <ul class="sidebar-nav-list sidebar-nav-group-list">
            {% for group_name in data.byGroupAndType | getKeysBySort(display.sort.group) %}
                {% set group = data.byGroupAndType[group_name] %}
                <li class="item">
                    <a class="item-content" href="#id--{{group_name}}">
                        <span class="item-title">
                            {{ groups[group_name] }}
                        </span>
                    </a>

                    <ul class="sidebar-nav-list sidebar-nav-item-list">
                        {% for type_name in group | getKeysBySort(display.sort.type) %}
                            {% set items = group[type_name] %}
                            {% for item in items %}
                                <li class="item">
                                    <a class="item-content" href="#id--{{ group_name }}-{{type_name}}-{{ item.context.name }}">
                                        <span class="item-type" data-type="{{type_name}}">{{ type_name[0] }}</span>
                                        <span class="item-title">
                                            {{ item.context.name }}
                                        </span>
                                    </a>
                                </li>
                            {% endfor %}
                        {% endfor %}
                    </ul>
                </li>
            {% endfor %}
        </ul>
    {% endif %}
</div>
