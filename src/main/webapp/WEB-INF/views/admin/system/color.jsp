<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>
<%@include file="/WEB-INF/include/message.jsp"%>
<link href="${contextPath}/static/plugins/Farbtastic-Color-Picker-master/farbtastic.css" rel="stylesheet" type="text/css">

<div class="panel panel-default" style="float: left; width: 90%; border-radius: 0px;">
  <div class="panel-heading" style="padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-radius: 0px;">
    <ul class="nav nav-pills">
      <li role="presentation">
        <a href="${contextPath}/admin/system/routeFontColor.action"><span class="glyphicon glyphicon-map-marker"></span> &nbsp;申请页面字体颜色配置</a>
      </li>
      <a href="${contextPath}/admin/system/fontColorDefault.action" style="float: right; margin-top: 2px;">
        <button type="button" class="btn btn-danger" id="allOutput" style="margin-top: 0px; margin-bottom: 0px;">恢复默认设置</button>
      </a>
    </ul>
  </div>
  <div class="panel-body">
    <dl class="dl-horizontal">
      <dt>当前配置的颜色</dt>
      <dd>
        <c:if test="${fontColor == null}">
          <div style="width: 85%; height: 102px; background-color: #caa475; border: 1px solid black"></div>
        </c:if>
        <c:if test="${fontColor != null}">
          <div style="width: 85%; height: 102px; background-color: ${fontColor}; border: 1px solid black"></div>
        </c:if>
      </dd>
      <form action="${contextPath}/admin/system/fontColorChange.action" method="post" style="margin-top: 50px">
        <div style="margin-left: 180px">
          <div class="form-group">
            <label for="color" style="margin-top: 7px">请移动圆圈选择颜色</label>
            <input style="width: 10%;float: right;margin-right: 690px" type="text" id="color" name="configColor" value="#caa475" class="form-control"/>
          </div>
          <div id="colorpicker"></div>
        </div>
        <dt style="float: left; margin-top: 80px; margin-left: 75px;">
          <button type="submit" class="btn btn-success">保存</button>
        </dt>
      </form>
    </dl>
  </div>
</div>

<%@include file="/WEB-INF/include/javascript.jsp"%>
<script type="text/javascript" src="${contextPath}/static/plugins/Farbtastic-Color-Picker-master/farbtastic.js" ></script>

<script type="text/javascript">
  $(function () {
    $("#system").trigger("click");
  });

  $(document).ready(function() {

    $('#colorpicker').farbtastic('#color');

  });
</script>

<%@include file="/WEB-INF/include/footer.jsp"%>