<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>
<%@include file="/WEB-INF/include/message.jsp"%>

<div class="panel panel-default" style="float: left; width: 90%; border-radius: 0px;">
  <div class="panel-heading" style="padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-radius: 0px;">
    <ul class="nav nav-pills">
      <li role="presentation">
        <a>
          <span class="glyphicon glyphicon-map-marker"></span> &nbsp;申请列表
        </a>
      </li>
      <li role="presentation" style="margin-top: 2px;">
        <form class="form-inline" action="" method="post" name="creditSearchForm">
          <div class="form-group">
            <label class="control-label" for="listState">状态</label>
            <select class="form-control" id="listState" name="listState" style="width: 80px">
              <c:if test="${sessionScope.searchSredit != null}">
                <c:if test="${sessionScope.searchSredit.listState == 1}">
                  <option value="0">全部</option>
                  <option value="1" selected>未审核</option>
                  <option value="2">审核通过</option>
                  <option value="3">审核未通过</option>
                </c:if>
                <c:if test="${sessionScope.searchSredit.listState == 2}">
                  <option value="0">全部</option>
                  <option value="1">未审核</option>
                  <option value="2" selected>审核通过</option>
                  <option value="3">审核未通过</option>
                </c:if>
                <c:if test="${sessionScope.searchSredit.listState == 3}">
                  <option value="0">全部</option>
                  <option value="1">未审核</option>
                  <option value="2">审核通过</option>
                  <option value="3" selected>审核未通过</option>
                </c:if>
              </c:if>
              <c:if test="${sessionScope.searchSredit == null || sessionScope.searchSredit.listState == 0}">
                <option value="0">全部</option>
                <option value="1">未审核</option>
                <option value="2">审核通过</option>
                <option value="3">审核未通过</option>
              </c:if>
            </select>
          </div>
          <div class="form-group">
            <label class="control-label" for="creditAmount">数额</label>
            <select class="form-control" id="creditAmount" name="creditAmount" style="width: 80px">
              <c:if test="${sessionScope.searchSredit != null}">
                <c:if test="${sessionScope.searchSredit.creditAmount eq 1000}">
                  <option value="1234">全部</option>
                  <option value="1000" selected>1000</option>
                  <option value="2000">2000</option>
                  <option value="3000">3000</option>
                  <option value="5000">5000</option>
                </c:if>
                <c:if test="${sessionScope.searchSredit.creditAmount eq 2000}">
                  <option value="1234">全部</option>
                  <option value="1000">1000</option>
                  <option value="2000" selected>2000</option>
                  <option value="3000">3000</option>
                  <option value="5000">5000</option>
                </c:if>
                <c:if test="${sessionScope.searchSredit.creditAmount eq 3000}">
                  <option value="1234">全部</option>
                  <option value="1000">1000</option>
                  <option value="2000">2000</option>
                  <option value="3000" selected>3000</option>
                  <option value="5000">5000</option>
                </c:if>
                <c:if test="${sessionScope.searchSredit.creditAmount eq 5000}">
                  <option value="1234">全部</option>
                  <option value="1000">1000</option>
                  <option value="2000">2000</option>
                  <option value="3000">3000</option>
                  <option value="5000" selected>5000</option>
                </c:if>
              </c:if>
              <c:if test="${sessionScope.searchSredit == null || sessionScope.searchSredit.creditAmount eq 1234}">
                <option value="1234">全部</option>
                <option value="1000">1000</option>
                <option value="2000">2000</option>
                <option value="3000">3000</option>
                <option value="5000">5000</option>
              </c:if>
            </select>
          </div>
          <div class="form-group">
            <label for="listStartDate" class="control-label">时间范围</label>
            <input type="date" class="form-control" id="listStartDate" name="listStartDate" style="width:100px" value="${sessionScope.searchCredit.listStartDate}">
          </div>
          <div class="form-group">
            <label for="listStopDate" class="control-label">至</label>
            <input type="date" class="form-control" id="listStopDate" name="listStopDate" style="width:100px" value="${sessionScope.searchCredit.listStopDate}">
          </div>
          <button type="submit" class="btn btn-default" onclick="document.creditSearchForm.action='${contextPath}/admin/creditList/pageSearch.action';document.creditSearchForm.submit();">查询</button>
          <button type="submit" class="btn btn-default" onclick="document.creditSearchForm.action='${contextPath}/admin/creditList/searchOutput.action';document.creditSearchForm.submit();">导出</button>
        </form>
      </li>
    </ul>
  </div>
  <div class="panel-body">
    <div class="row" style="margin-left: 1px; margin-right: 1px; margin-top: 0px">
      <a href="${contextPath}/admin/creditList/allOutput.action" style="float: right; margin-top: 8px; margin-bottom: 0px;">
        <button type="button" class="btn btn-danger" id="allOutput">导出所有</button>
      </a>
      <button type="button" style="float: right" class="btn btn-danger navbar-btn" id="batchDelete" style="margin-top: 0px; margin-bottom: 0px;">选中删除</button>
      <button type="button" style="float: right" class="btn btn-warning navbar-btn" id="batchPass" style="margin-top: 0px; margin-bottom: 0px;">选中审核通过</button>
      <button type="button" style="float: right" class="btn btn-warning navbar-btn" id="batchUnPass" style="margin-top: 0px; margin-bottom: 0px;">选中审核不通过</button>
      <button type="button" style="float: right" class="btn btn-warning navbar-btn" id="batchOutput" style="margin-top: 0px; margin-bottom: 0px;">选中导出</button>
      <button type="button" class="btn btn-success navbar-btn" id="All">全选</button>
      <button type="button" class="btn btn-success navbar-btn" id="uncheck">不选</button>
      <button type="button" class="btn btn-success navbar-btn" id="othercheck">反选</button>
    </div>
    <div class="row" style="margin-top: 5px;">
      <div class="col-md-12">
        <table class="table" id="paginationTable" align="center">
          <tr style="background-color: #3767b1; color: #dbdbdb;">
            <th>选择</th>
            <th>序号</th>
            <th>姓名</th>
            <th>数额</th>
            <th>年龄</th>
            <th>职位</th>
            <th>芝麻</th>
            <th>花呗</th>
            <th>借呗</th>
            <th>信用卡</th>
            <th>借贷宝</th>
            <th>状态</th>
            <th>日期</th>
            <th>操作</th>
          </tr>
          <form method="post" id="batchForm" border="1px black solid;">
            <c:forEach items="${page.content}" var="credit" varStatus="status">
              <tr id="batchCheck">
                <td id="batchCheckBoxId">`
                  <label class="checkbox-inline">
                    <input type="checkbox" value="${credit.creditListId}" name="batchId">
                  </label>
                </td>
                <td>${status.index + 1}</td>
                <td>${credit.userName}</td>
                <td>${credit.creditAmount}</td>
                <td>${credit.userAge}</td>
                <td>${credit.userPost}</td>
                <td>${credit.zhimaNum}</td>
                <td>${credit.huabeiLimit}</td>
                <td>${credit.jiebeiLimit}</td>
                <td>${credit.creditCardLimit}</td>
                <td>${credit.jiedaibaoLimit}</td>
                <td>${credit.listStateStr}</td>
                <td>${credit.listTimeStr}</td>
                <td>
                  <a href="${contextPath}/admin/creditList/routeDetail/${credit.creditListId}.action" style="text-decoration: none;">
                    <button type="button" class="btn btn-warning">详情</button>
                  </a>
                  <a href="${contextPath}/admin/creditList/routeEdit/${credit.creditListId}.action" style="text-decoration: none;">
                    <button type="button" class="btn btn-warning">编辑</button>
                  </a>
                  <a href="${contextPath}/admin/creditList/delete/${credit.creditListId}.action" style="text-decoration: none;" >
                    <button type="button" class="btn btn-danger">删除</button>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </form>
        </table>
      </div>
    </div>

    <div class="row" style="margin-left: 2%; margin-right: 2%; margin-top: 1%;">
      <div class="col-md-12">
        <nav>
          <ul class="pager">
            <c:if test="${page.number > 0 }">
              <li class="previous">
                <a href="${contextPath}/admin/creditList/page.action?page=${page.number - 1}"><span aria-hidden="true">&larr;</span> 上一页</a>
              </li>
            </c:if>
            <c:if test="${page.number <= 0 }">
              <li class="previous disabled">
                <a href="#"><span aria-hidden="true">&larr;</span>上一页</a>
              </li>
            </c:if>
            <c:if test="${page.number + 1 < page.totalPages }">
              <li class="next">
                <a href="${contextPath}/admin/creditList/page.action?page=${page.number + 1}">下一页 <span aria-hidden="true">&rarr;</span></a>
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
    $("#creditManage").trigger("click");
  });
</script>

<script type="text/javascript">
  $(function() {
    // 设置table表格中的行高
    var $height = $('#paginationTable td').height() + 'px';
    $('#paginationTable td').css('line-height', $height);
    $('#batchCheck #batchCheckBoxId').css('line-height', '13px');

    //选择框批量操作
    var CheckAll=document.getElementById('All');
    var UnCheck=document.getElementById('uncheck');
    var OtherCheck=document.getElementById('othercheck');
    var paginationTable=document.getElementById('paginationTable');
    var CheckBox=paginationTable.getElementsByTagName('input');
    console.log(CheckBox)
    CheckAll.onclick=function(){
      for(i=0;i<CheckBox.length;i++){
        CheckBox[i].checked=true;
      };
    };
    UnCheck.onclick=function(){
      for(i=0;i<CheckBox.length;i++){
        CheckBox[i].checked=false;
      };
    };
    OtherCheck.onclick=function(){
      for(i=0;i<CheckBox.length;i++){
        if(CheckBox[i].checked==true){
          CheckBox[i].checked=false;
        }
        else{
          CheckBox[i].checked=true
        }

      };
    };

    // 确认提示框设置
    $.confirm.options = {
//            text: "Are you sure?",
      title: "消息提示",
      confirmButton: "确认",
      cancelButton: "取消",
      post: false,
      submitForm: false,
      confirmButtonClass: "btn-danger",
      cancelButtonClass: "btn-default",
      dialogClass: "modal-dialog"
    }

    $('#batchDelete').on('click', function () {
      var actionPath = "${contextPath}/admin/creditList/batch/delete.action";
      var $checkLength = $("[name = batchId]:checkbox").filter(":checked").length;
      if ($checkLength > 0 ) {
        $.confirm({
          text: "您确定删除这些项目吗?",
          confirm: function() {
            $('#batchForm').attr('action', actionPath).submit();
          },
          cancel: function() {

          }
        });
      } else {

      }
    });

    $('#batchPass').on('click', function () {
      var actionPath = "${contextPath}/admin/creditList/batch/pass.action";
      var $checkLength = $("[name = batchId]:checkbox").filter(":checked").length;
      if ($checkLength > 0 ) {
        $.confirm({
          text: "您确定审核通过这些项目吗?",
          confirm: function() {
            $('#batchForm').attr('action', actionPath).submit();
          },
          cancel: function() {

          }
        });
      } else {

      }
    });

    $('#batchUnPass').on('click', function () {
      var actionPath = "${contextPath}/admin/creditList/batch/unpass.action";
      var $checkLength = $("[name = batchId]:checkbox").filter(":checked").length;

      if ($checkLength > 0 ) {
        $.confirm({
          text: "您确定不通过这些项目的审核吗?",
          confirm: function() {
            $('#batchForm').attr('action', actionPath).submit();
          },
          cancel: function() {

          }
        });
      } else {

      }
    });

    $('#batchOutput').on('click', function () {
      var actionPath = "${contextPath}/admin/creditList/batch/output.action";
      var $checkLength = $("[name = batchId]:checkbox").filter(":checked").length;

      if ($checkLength > 0 ) {
        $.confirm({
          text: "您确定批量导出这些项目吗?",
          confirm: function() {
            $('#batchForm').attr('action', actionPath).submit();
            for(i=0;i<CheckBox.length;i++){
              CheckBox[i].checked=false;
            };
          },
          cancel: function() {

          }
        });
      } else {

      }
    });
  });
</script>

<%@include file="/WEB-INF/include/footer.jsp"%>