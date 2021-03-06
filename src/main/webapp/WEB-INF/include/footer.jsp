<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${contextPath}/static/plugins/bootstrap/js/bootstrap.js" ></script>
<script type="text/javascript" src="${contextPath}/static/support/jquery.placeholder.js" ></script>
<script type="text/javascript">
    $(function () {
        // Invoke the plugin
        $('input, textarea').placeholder();

        //id="backMark" 返回按钮
        $('#backMark').on('click', function () {
            window.history.back(-1);
        });


        $('button[class="btn btn-danger"]').confirm({
            text: "您确认执行这个操作么?",
            title: "消息提示",
            confirm: function(button) {
                if ($(button)[0].type === 'submit') {
                    $("#submitForm").submit();
                } else {
                    $($(button).parent())[0].click();
                }
            },
            cancel: function(button) {
                // nothing to do
            },
            confirmButton: "确认",
            cancelButton: "取消",
            post: false,
            submitForm: true,
            confirmButtonClass: "btn-danger",
            cancelButtonClass: "btn-default",
            dialogClass: "modal-dialog" // Bootstrap classes for large modal
        });

        // 消息提示
        setTimeout(function() {
            $("#message").hide();
        }, 2000);
    });

</script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<link href="/css/bootstrap-ie8.css" rel="stylesheet">
<script src="${contextPath}/static/support/html5shiv.min.js"></script>
<script src="${contextPath}/static/support/respond.min.js"></script>
<![endif]-->

</body>
</html>
