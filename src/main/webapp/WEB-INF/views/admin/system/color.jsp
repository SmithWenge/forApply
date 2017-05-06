<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>
<%@include file="/WEB-INF/include/message.jsp"%>

<div class="panel panel-default" style="float: left; width: 90%; border-radius: 0px;">
  <div class="panel-heading" style="padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-radius: 0px;">
    <ul class="nav nav-pills">
      <li role="presentation">
        <a href="${contextPath}/admin/system/routeColor.action"><span class="glyphicon glyphicon-map-marker"></span> &nbsp;申请页面字体颜色配置</a>
      </li>
      <a href="${contextPath}/admin/system/colorDefault.action" style="float: right; margin-top: 2px;">
        <button type="button" class="btn btn-danger" id="allOutput" style="margin-top: 0px; margin-bottom: 0px;">恢复默认设置</button>
      </a>
    </ul>
  </div>
  <div class="panel-body">
    <dl class="dl-horizontal">
      <dt>当前配置的颜色</dt>
      <dd>
        <c:if test="${backgroundColor == null}">
          <div style="width: 85%; height: 102px; background-color: #caa475; border: 1px solid black"></div>
        </c:if>
        <c:if test="${backgroundColor != null}">
          <div style="width: 85%; height: 102px; background-color: #${backgroundColor}; border: 1px solid black"></div>
        </c:if>
      </dd>
      <form action="${contextPath}/admin/system/colorChange.action" method="post" style="margin-top: 50px">
        <dt>
          第一种颜色
          <input type="radio" name="configColor" value="caa475" checked>
        </dt>
        <dd>
          <div style="width: 85%; height: 102px; background-color: #caa475; border: 1px solid black"></div>
        </dd>
        <dt>
          第二种颜色
          <input type="radio" name="configColor" value="ffffff">
        </dt>
        <dd  style="margin-top: 5px;">
          <div style="width: 85%; height: 102px; background-color: #ffffff; border: 1px solid black"></div>
        </dd>
        <dt>
          第三种颜色
          <input type="radio" name="configColor" value="000000">
        </dt>
        <dd  style="margin-top: 5px;">
          <div style="width: 85%; height: 102px; background-color: #000000; border: 1px solid black"></div>
        </dd>
        <dt style="float: left; margin-top: 40px; margin-left: 75px;">
            <button type="submit" class="btn btn-success">保存</button>
        </dt>
      </form>
    </dl>
  </div>
</div>

<%@include file="/WEB-INF/include/javascript.jsp"%>

<script type="text/javascript">
  $(function () {
    $("#system").trigger("click");
  });
</script>

<%@include file="/WEB-INF/include/footer.jsp"%>