<div class="sidebar-body">
    {% if data.length == 0 %}
        <p class="empty-info">No documented item.</p>
    {% else %}
        <ul class="sidebar-nav-list sidebar-nav-group-list">
            {% for group_name, group in data.byGroupAndType %}
                <li class="item">
                    <a class="item-content" href="#id--{{group_name}}">
                        <span class="item-title">
                            {{ groups[group_name] }}
                        </span>
                    </a>

                    <ul class="sidebar-nav-list sidebar-nav-item-list">
                        {% for type_name, items in group %}
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
