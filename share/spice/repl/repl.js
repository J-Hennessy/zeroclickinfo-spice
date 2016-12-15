(function (env) {
    "use strict";

    env.ddg_spice_repl = function(api_result) {

        // // Validate the response (customize for your Spice)
        // if (!api_result || api_result.error) {
        //     return Spice.failed('repl');
        // }

        // Render the response
        Spice.add({
            id: 'repl',
            name: 'REPL',
            data: api_result,
            meta: {
                sourceName: 'repl.it',
                sourceUrl: 'https://repl.it/languages/'
            },
            normalize: function() {
                return {
                    title: "title",
                    subtitle: "subtitle"
                };
            },
            templates: {
                group: 'base',
                options: {
                    content: Spice.repl.content,
                    moreAt: true
                }
            }
        });
    };
}(this));
