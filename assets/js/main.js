$(function() {

    var

    sourceKeywords = [
        'usage',
        'source'
    ],

    outputKeywords = [
        'cssoutput',
        'output'
    ];

    function getExampleDescription(el) {
        return $.trim($(el).find('> .example-description').text());
    }

    function isSourceDescription(el) {
        var desc = getExampleDescription(el);
        return hasKeyword(desc, sourceKeywords);
    }

    function isOutputDescription(el) {
        var desc = getExampleDescription(el);
        return hasKeyword(desc, outputKeywords);
    }

    function hasKeyword(str, keywords) {
        var isHasKeyword = false;

        str = str.toLowerCase().replace(/\s/g, '');

        keywords.forEach(function(keyword) {
            if (str.indexOf(keyword) === 0) {
                isHasKeyword = true;
            }
        });

        return isHasKeyword;
    }

    $('.item-example').each(function(i, el) {
        el = $(el);

        var nextEl = el.next();

        if ( isSourceDescription(el) && isOutputDescription(nextEl) ) {
            el.addClass('item-example-left');
            nextEl.addClass('item-example-right');

            $('<div class="item-example-paratactic"></div>').insertBefore(el).append(el, nextEl);
        }
    });
});
