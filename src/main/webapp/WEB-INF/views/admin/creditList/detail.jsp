<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>
<%@include file="/WEB-INF/include/message.jsp"%>

<%--学生管理--%>
<style type="text/css">
    #student{
        background: whitesmoke;
        border-left: 4px solid #fed350;
        border-right: 4px solid #fed350;
        color: #444;
    }
</style>

<div class="panel panel-default" style="float: left; width: 90%; border-radius: 0px;">
    <div class="panel-heading" style="padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-radius: 0px;">
        <ol class="breadcrumb" style="padding-bottom: 8px; margin-bottom: 0px;">
            <li>
                <a href="${contextPath}/admin/creditList/routePage.action"><span class="glyphicon glyphicon-map-marker"></span> &nbsp;申请列表</a></li>
            <li class="active">贷款详情</li>
        </ol>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <tr>
                <th>贷款业务状态</th>
                <td>${credit.listStateStr}</td>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th>贷款号</th>
                <td>${credit.creditListId}</td>
                <th>姓名</th>
                <td>${credit.userName}</td>
                <th>性别</th>
                <td>${credit.userSexStr}</td>
            </tr>
            <tr>
                <th>贷款数额</th>
                <td>${credit.creditAmount}</td>
                <th>年龄</th>
                <td>${credit.userAge}</td>
                <th>电话</th>
                <td>${credit.userTel}</td>
            </tr>
            <tr>
                <th>工作单位</th>
                <td>${credit.workUnit}</td>
                <th>工作岗位</th>
                <td>${credit.userPost}</td>
                <th>单位电话</th>
                <td>${credit.unitTel}</td>
            </tr>
            <tr>
                <th>芝麻信用积分</th>
                <td>${credit.zhimaNum}</td>
                <th>花呗额度</th>
                <td>${credit.huabeiLimit}</td>
                <th>借呗额度</th>
                <td>${credit.jiebeiLimit}</td>
            </tr>
            <tr>
                <th>信用卡额度</th>
                <td>${credit.creditCardLimit}</td>
                <th>借贷宝额度</th>
                <td>${credit.jiedaibaoLimit}</td>
                <th>借贷时间</th>
                <td>${credit.listTimeStr}</td>
            </tr>
            <tr><th></th><th></th><th></th><th></th><th></th><th></th></tr>
        </table>
        <div class="form-group">
            <div class="col-sm-4">
                <button type="button" id="backMark" class="btn btn-default">返回</button>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/include/javascript.jsp"%>

<script type="text/javascript">
    $(function () {
        $("#creditManage").trigger("click");
    });
</script>

<%@include file="/WEB-INF/include/footer.jsp"%>