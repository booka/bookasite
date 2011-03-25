(function() {

    function initEditor() {
        $.cleditor.defaultOptions.height = 500;
        $("textarea.editable").cleditor();
    }

    $(function() {
        initEditor();
    })
})();