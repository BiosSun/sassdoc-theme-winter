<aside class="sidebar" role="nav">
    <div class="sidebar-body">
        {% if data.length == 0 %}

            <p class="empty-info">No documented item.</p>

        {% else %}

            <ul class="sidebar-nav-list sidebar-nav-group-list" rule="tree">
                {% for group_name in data.byGroupAndType | getKeysBySort(display.sort.group) %}

                    {% set group = data.byGroupAndType[group_name] %}
                    {% set groupKeys = group | getKeysBySort(display.sort.type) %}

                    <li class="item opened" rule="treeitem">
                        <div class="item-body">
                            <a class="item-content" href="#id--{{group_name}}">
                                <span class="item-title">
                                    {{ groups[group_name] }}
                                </span>
                            </a>
                        </div>

                        {% if groupKeys.length && (groupKeys.length > 1 || groupKeys[0] != 'variable') %}
                            <ul class="sidebar-nav-list sidebar-nav-item-list" rule="tree">
                                {% for type_name in group | getKeysBySort(display.sort.type) %}

                                    {% set items = group[type_name] %}

                                    {% if type_name == 'variable' %}
                                        <li class="item" rule="treeitem">
                                            <div class="item-body">
                                                <a class="item-content" href="#id--{{group_name}}-{{type_name}}-variables">
                                                    <span class="item-type" data-type="{{type_name}}" title="变量">v</span>
                                                    <span class="item-title">
                                                        variables
                                                    </span>
                                                </a>
                                            </div>
                                        </li>
                                    {% else %}
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
                                    {% endif %}

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

