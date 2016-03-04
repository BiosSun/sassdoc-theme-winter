# sassdoc-theme-winter

这是一个简单的 SASSDOC 主题，其制作目的是为 Nojiko 项目提供一套能够满足其需求的主题，当然它也可以被用于其它 SASS 项目。

该主题具有如下特点：

- 相对简洁而干净的样式
- 充分优化的排版结构
- 支持自定义分组及类型的显示顺序

## 配置

### 自定义分组及类型排序

可在 display 配置项下添加一个 sort 属性，该属性下可指定两个子属性：group 及 type，分别用于定义分组及类型的排列顺序，示例代码如下：

``` json
"display": {
    "sort": {
        "group": {
            "undefined",
            "helpers",
            "add-ons",
            "list",
            "map"
        },
        "type": [
            "variable",
            "function",
            "mixin",
            "placeholder"
        ]
    }
}
```

