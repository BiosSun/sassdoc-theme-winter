<aside class="sidebar" role="nav">
    <div class="sidebar-body">
        {% if data.length == 0 %}

            <p class="empty-info">No documented item.</p>

        {% else %}

            <ul class="sidebar-nav-list sidebar-nav-group-list" rule="tree">
                {% for group_name in data.byGroupAndType | getKeysBySort(display.sort.group) %}

                    {% set group = data.byGroupAndType[group_name] %}

                    <li class="item closed" rule="treeitem">
                        <div class="item-body">
                            {% if Object.keys(group).length %}
                                <a class="item-toggle" href="javascript:">
                                    <i class="icon-opened fa fa-chevron-up"></i>
                                    <i class="icon-closed fa fa-chevron-down"></i>
                                </a>
                            {% endif %}
                            <a class="item-content" href="#id--{{group_name}}">
                                <span class="item-title">
                                    {{ groups[group_name] }}
                                </span>
                            </a>
                        </div>

                        {% if Object.keys(group).length %}
                            <ul class="sidebar-nav-list sidebar-nav-item-list" style="display: none;" rule="tree">
                                {% for type_name in group | getKeysBySort(display.sort.type) %}

                                    {% set items = group[type_name] %}

                                    {% for item in items %}
                                        <li class="item" rule="treeitem">
                                            <div class="item-body">
                                                <a class="item-content" href="#id--{{ group_name }}-{{type_name}}-{{ item.context.name }}">
                                                    <span class="item-type" data-type="{{type_name}}" title="{{ type_name | capitalize }}">{{ type_name[0] }}</span>
                                                    <span class="item-title">
                                                        {{ item.context.name }}
                                                    </span>
                                                </a>
                                            </div>
                                        </li>
                                    {% endfor %}

                                {% endfor %}
                            </ul>
                        {% endif %}
                    </li>

                {% endfor %}
            </ul>

        {% endif %}
    </div>
    <div class="sidebar-handle">
        <i class="icon fa fa-exchange"></i>
    </div>
</aside>

