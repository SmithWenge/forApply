<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>

<%--日志管理--%>
<style>
    #log{
        color: #3b8cff;
    }
</style>
<div class="panel panel-default" style="float: left; width: 90%; border-radius: 0px;">
    <div class="panel-heading" style="padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-radius: 0px;">
        <ul class="nav nav-pills">
            <li role="presentation">
                <a href="${contextPath}/admin/log/routePage.action"> <span class="glyphicon glyphicon-map-marker"></span> &nbsp;日志管理</a>
            </li>
        </ul>
    </div>
    <div class="panel-body">
            <div class="row" style="margin-top: 5px;">
                <div class="col-md-12">
                    <form class="form-inline" action="${contextPath}/admin/log/pageSearch.action" method="post" id="logForm">
                        <div class="form-group">
                            <label for="selectLogAciton">操作</label>
                            <tags:dicselect name="logAction" key="logAction" value="-1" id="selectLogAciton" />
                        </div>
                        <div class="form-group">
                            <label for="selectLogLevel">日志级别</label>
                            <tags:dicselect name="logLevel" key="logLevel" value="-1" id="selectLogLevel" />
                        </div>
                        <div class="form-group">
                            <label for="inputStartTime">开始时间</label>
                            <input type="text" class="form-control" id="inputStartTime" name="startTime" placeholder="2017-01-01">
                        </div>
                        <div class="form-group">
                            <label for="inputEndTime">截止时间</label>
                            <input type="text" class="form-control" id="inputEndTime" name="endTime" placeholder="2017-02-01">
                        </div>
                        <div class="form-group">
                            <label for="inputLogUser">操作者</label>
                            <input type="text" class="form-control" id="inputLogUser" name="logUser" placeholder="admin">
                        </div>
                        <button type="submit" class="btn btn-default">检索</button>
                    </form>
                </div>
            </div>

        <div class="row" style="margin-top: 1%;">
            <div class="col-md-12">
                <table class="table" id="paginationTable">
                    <tr style="background-color: #3767b1; color: #dbdbdb;">
                        <th>日志编号</th>
                        <th>操作</th>
                        <th>级别</th>
                        <th>内容</th>
                        <th>操作者</th>
                        <th>时间</th>
                    </tr>
                    <c:forEach items="${page.content}" var="log">
                        <tr>
                            <td>${log.logId}</td>
                            <tags:dictd groupValue="logAction" itemKey="${log.logAction}" />
                            <tags:dictd groupValue="logLevel" itemKey="${log.logLevel}" />
                            <td>${log.logContent}</td>
                            <td>${log.logUser}</td>
                            <td>${log.logTime}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <div class="row" style="margin-left: 2%; margin-right: 2%; margin-top: 1%;">
            <div class="col-md-12">
                <nav>
                    <ul class="pager">
                        <c:if test="${page.number > 0 }">
                            <li class="previous">
                                <a href="${contextPath}/admin/log/page.action?page=${page.number - 1}"><span aria-hidden="true">&larr;</span> 上一页</a>
                            </li>
                        </c:if>
                        <c:if test="${page.number <= 0 }">
                            <li class="previous disabled">
                                <a href="#"><span aria-hidden="true">&larr;</span>上一页</a>
                            </li>
                        </c:if>
                        <c:if test="${page.number + 1 < page.totalPages }">
                            <li class="next">
                                <a href="${contextPath}/admin/log/page.action?page=${page.number + 1}">下一页 <span aria-hidden="true">&rarr;</span></a>
                            </li>
                        </c:if>
                        <c:if test="${page.number + 1 >= page.totalPages }">
                            <li class="next disabled">
                                <a href="#">下一页 <span aria-hidden="true">&rarr;</span></a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/include/javascript.jsp"%>
<script type="text/javascript">
    $(function () {
        // 日期有效性格式验证
        jQuery.validator.addMethod("validDate", function(value, element) {
            if (value === "") return true;

            var reg = /^(\d{1,4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})$/;

            var r = value.match(reg);

            if (r == null) {
                return false;
            }

            var d = new Date(r[1], r[3] - 1, r[5]);

            var result = (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[5]);

            return this.optional(element) || (result);
        }, "请输入正确的日期");

        $('#logForm').validate({
            rules: {
                startTime: {
                    validDate: true
                },
                endTime: {
                    validDate: true
                }

            },
            messages: {
                startTime: {
                },
                endTime: {
                }
            }
        });
    });
</script>

<link href="${contextPath}/static/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${contextPath}/static/plugins/jquery-ui/jquery-ui.js" ></script>
<script type="text/javascript" src="${contextPath}/static/plugins/jquery-ui/datepicker-zh-CN.js" ></script>

<script type="text/javascript">
    $(function () {
        $("#logManageNav").trigger("click");
    });
</script>

<script type="text/javascript">
    $( function() {
        $( "#inputStartTime" ).datepicker();
        $( "#inputEndTime" ).datepicker();
    });
</script>

<%@include file="/WEB-INF/include/footer.jsp"%>