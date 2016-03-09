# sassdoc-theme-winter

这是一个简单的 SASSDOC 主题，其制作目的是为 Nojiko 项目提供一套能够满足其需求的主题，当然它也可以被用于其它 SASS 项目。

该主题具有如下特点：

- 相对简洁而干净的样式
- 充分优化的排版结构
- 支持自定义分组及类型的显示顺序

## 配置

### 隐藏依赖项

在 display 对象中添加 require 属性，并设置其值为 false，即可不再显示依赖相关的内容。

```
"display": {
    "require": false
}
```

### 隐藏副标题

默认，该主题会使用 package.description 作为标语显示在项目名称下面，
若不希望显示该标语，可在 display 对象中添加 tagline 属性，并设置其值为 false 即可将其隐藏：

```
"display": {
    "tagline": false
}
```

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

### 配置项目或分组的描述内容

添加一个 fragments 配置，在其中进行配置：

```
"fragments": {
    "document": "./fragments/document.md",
    "group": {
        "undefined": "./fragments/group-undefined.md",
        "helpers": "./fragments/group-helpers.md"
    }
}
```

属性值为描述内容文件的访问路径，**仅支持 markdown 格式的内容**。
