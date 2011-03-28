(function($) {

    var InlineForms = {
        init : function() {
            $(".inline_form form").hide();
            $(".inline_form a.expander").click(function() {
                var form = $(this).parents('.inline_form').find("form");
                if (form.is(':visible')) {
                    $("span", this).text('+');
                    form.slideUp();
                } else {
                    $("span", this).text('-');
                    form.slideDown();
                }
                return false;
            });
        }
    };

    function initEditor() {
        $("#edit_content").click(function() {
            $(".editable").aloha();
        });
    }

    $(function() {
        InlineForms.init();
        initEditor();

        if (false && history && history.pushState) {
            $(".browser .content a").click(function(e) {
                $(".center .page").hide("slide", {direction: "left"}, 500);
                $.getScript(this.href);
                history.pushState(null, document.title, this.href);
                e.preventDefault()
            });

            $(window).bind("popstate", function(e) {
                console.debug(e);
                //$.getScript(location.href);
            });
        }
    });

})(window.jQuery);
