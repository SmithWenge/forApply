<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>
<%@include file="/WEB-INF/include/message.jsp"%>

<div class="panel panel-default" style="float: left; width: 90%; border-radius: 0px;">
  <div class="panel-heading" style="padding-bottom: 0px; padding-top: 0px; padding-left: 0px; border-radius: 0px;">
    <ul class="nav nav-pills">
      <li role="presentation">
        <a href="${contextPath}/admin/system/routeFontStyle.action"><span class="glyphicon glyphicon-map-marker"></span> &nbsp;申请页面字体风格设置</a>
      </li>
      <a href="${contextPath}/admin/system/fontStyleDefault.action" style="float: right; margin-top: 2px;">
        <button type="button" class="btn btn-danger" id="allOutput" style="margin-top: 0px; margin-bottom: 0px;">恢复默认设置</button>
      </a>
    </ul>
  </div>
  <div class="panel-body">
    <dl class="dl-horizontal">
      <dt>当前配置的字体风格</dt>
      <dd>
        <h3 style="width: 85%; height: 102px; font-family: ${fontStyle};">百融金融 极速审批 深圳前海采风互联网金融服务有限公司</h3>
      </dd>
      <form action="${contextPath}/admin/system/fontStyleChange.action" method="post" style="margin-top: 50px">
        <dt>
          第一种字体风格
          <input type="radio" name="configFont" value="微软雅黑">
        </dt>
        <dd>
          <h3 style="width: 85%; height: 102px; font-family: 微软雅黑;">百融金融 极速审批 深圳前海采风互联网金融服务有限公司</h3>
        </dd>
        <dt>
          第二种字体风格
          <input type="radio" name="configFont" value="SimSun">
        </dt>
        <dd>
          <h3 style="width: 85%; height: 102px; font-family: SimSun;">百融金融 极速审批 深圳前海采风互联网金融服务有限公司</h3>
        </dd>
        <dt>
          第三种字体风格
          <input type="radio" name="configFont" value="SimHei">
        </dt>
        <dd>
          <h3 style=" width: 85%; height: 102px; font-family: SimHei;">百融金融 极速审批 深圳前海采风互联网金融服务有限公司</h3>
        </dd>
        <dt>
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