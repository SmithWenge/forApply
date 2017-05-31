<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>秦越金融</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="${contextPath}/static/images/icon.png" />
  <link href="${contextPath}/static/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
  <style>
    body{
      background: whitesmoke;
    }
    #errorInfo{
      width: 670px;
      height: 200px;
      margin: 160px auto;
    }
    img{
      width: 300px;
      height: 300px;
      display: inline-block;
      margin: 0px auto;
      margin-bottom: 0px;
      float: left;
      margin-left: auto;
    }
    span{
      color: #444444;
      font-family: "微软雅黑";
      /*text-align: center;*/
      display: inline-block;
      font-size: 20px;
      line-height: 40px;
      /*vertical-align: bottom;*/
      float: left;
      margin-top: 60px;
    }
    a{
      color: red;
    }
  </style>
</head>
<body>
<div id="errorInfo">
  <span>很抱歉！发生错误，<br>${errorMessage}<br>您可以<a id="backMark">返回上一级</a>或者<a href="${contextPath}/user/index.action">重新开始</a></span>
</div>
</body>
<script type="text/javascript" src="${contextPath}/static/plugins/jquery/jquery-1.9.1.min.js" ></script>
<script type="text/javascript">
$(function() {

  //id="backMark" 返回按钮
  $('#backMark').on('click', function () {
    window.history.back(-1);
  });
})
</script>
</html>
