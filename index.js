var path = require('path');
var Promise = require('es6-promise').Promise;
var denodeify = require('es6-denodeify');
var fs = require('fs');
var fse = require('fs-extra');
var extend = require('extend');
var marked = require('marked');

var _ = require('lodash');
var swig = require('swig');
var extras = require('sassdoc-extras');
var highlight = require('highlight.js');

denodeify = denodeify(Promise);

var copy = denodeify(fse.copy);
var renderFile = denodeify(swig.renderFile);
var writeFile = denodeify(fs.writeFile);

marked.setOptions({
    gfm: true,
    tables: true
});


// 添加自定义的 swig 过滤器及标签
swig.setFilter('in', function (key, object) {
    return key in object;
});

swig.setFilter('nin', function (key, object) {
    return !(key in object);
});

swig.setFilter('getKeysBySort', function(sourceObject, sorts) {
    var sourceKeys = _.keys(sourceObject),
        targetKeys = [].concat(sourceKeys);

    targetKeys = targetKeys.sort(function(k1, k2) {
        var k1_index = sorts.indexOf(k1),
            k2_index = sorts.indexOf(k2);

        if (k1_index !== -1 && k2_index !== -1) {
            return k1_index < k2_index ? -1 : 1;
        }
        else if (k1_index !== -1) {
            return -1;
        }
        else if (k2_index !== -1) {
            return 1;
        }
        else {
            k1_index = sourceKeys.indexOf(k1);
            k2_index = sourceKeys.indexOf(k2);

            return k1_index < k2_index ? -1 : 1;
        }
    });

    return targetKeys;
});

/**
 * 整理 CTX 数据
 */
function tidyCTX(ctx) {
    var def = {
        display: {
            access: ['public'],
            alias: true,
            watermark: true
        },
        groups: {
            'undefined': 'General'
        },
        'shortcutIcon': 'http://sass-lang.com/favicon.ico'
    };

    ctx.groups = extend(def.groups, ctx.groups);
    ctx.display = extend(def.display, ctx.display);
    ctx = extend({}, def, ctx);

    (function() {
        var HasDescription = false,
            description;

        if (ctx.package && ctx.package.description) {
            HasDescription = true;
            description = ctx.package.description;
        }

        extras.markdown(ctx);

        if (HasDescription) {
            ctx.package.descriptionHTML = ctx.package.description;
            ctx.package.description = description;
        }
    })();

    extras.display(ctx);

    ctx.data.forEach(function(item) {
        // split type
        function split(type) {
            return ( type || '' ).trim().split('|').map(function(x) { return x.trim(); });
        }

        if (item.type) {
            item.type = split(item.type);
        }

        if (item.parameter) {
            item.parameter.forEach(function(p) {
                if (p.type) {
                    p.type = split(p.type);
                }
            });
        }

        if (item.property) {
            item.property.forEach(function(p) {
                if (p.type) {
                    p.type = split(p.type);
                }
            });
        }

        if (item.return && item.return.type) {
            item.return.type = split(item.return.type);
        }

        // highlight code
        if (item.example) {
            item.example.forEach(function(example) {
                example.code = highlight.highlightAuto(example.code, [example.type]).value;
            });
        }
    });

    extras.groupName(ctx);

    ctx.data.byGroupAndType = extras.byGroupAndType(ctx.data);

    // 添加文档及分组的文章片段
    (function() {
        var fragments = ctx.fragments;

        if (!fragments) {
            return;
        }

        if (fragments.document) {
            fragments.document = getFragments(fragments.document);
        }

        if (fragments.group) {
            for (var name in fragments.group) {
                fragments.group[name] = getFragments(fragments.group[name]);

                if ( !(name in ctx.data.byGroupAndType) ) {
                    ctx.data.byGroupAndType[name] = {};

                    if ( !(name in ctx.groups) ) {
                        ctx.groups[name] = name;
                    }
                }
            }
        }

        function getFragments(path) {
            var content = fs.readFileSync(path);
            content = marked(content.toString());
            return content;
        }
    })();

    ctx.now = {
        year: new Date().getFullYear()
    };

    return ctx;
}

module.exports = function (dest, ctx) {
    ctx = tidyCTX(ctx);

    var templatePath = path.resolve(__dirname, './views/index.swig');

    return Promise.all([
        copy(path.resolve(__dirname, './assets'), path.resolve(dest, 'assets')),

        renderFile(templatePath, ctx).then(function(html) {
            writeFile(path.resolve(dest, 'index.html'), html);
        })
    ]);
};
