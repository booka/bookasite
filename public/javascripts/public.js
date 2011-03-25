(function($) {

    function initEditor() {
        $("#edit_content").click(function() {
           $(".editable").aloha();
        });
    }

    $(function() {

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
