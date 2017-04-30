<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <link href="${contextPath}/static/plugins/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
  <title>百融金融</title>
  <style>
    body{
      background: #24252A;
    }
    .header{
      /*width: 800px;*/
      margin: 80px auto;
      display: block;
      margin-bottom: 60px;
    }
    .tit{
      color: #caa475;
      font-family: "微软雅黑";
      font-size: 4.74vw;
      font-weight: 200;
      margin: 0 auto;
      text-align: center;
    }
    hr{
      margin-top: 27px;
    }
    .content{
      text-align: center;

    }
    .selected{
      color: #caa475;
      font-family: "微软雅黑";
      font-size: 2.6vw;
      margin-bottom: 40px
    }
    .brwData{
      display: inline-block;
      width: 19vw;
      height: 24vh;
      float: left;
      border: solid 2px #caa475;
      margin-right: 4vw;

    }
    .brwData a{
      float: left;
      margin: 0px auto;
      padding: 30px 0px;
      color: #caa475;
      text-align: center;
      font-size: 2.5vw;
      display: inline;
      width: 19.5vw;

    }
    .marl{
      margin-left: 4vw;
    }
    /*.brwData a:hover{*/
    /*border: solid #fff 5px;*/
    /*text-decoration: none;*/
    /*color: #fff;*/
    /*}*/
    p{
      text-align: center;
      color: #888;
      font-size: 16px;
      font-family: "微软雅黑";
      font-weight: 100;
    }
  </style>
</head>
<body>
<div class="header">
  <h1 class="tit"><i>百融金融，极速审批</i></h1>
  <hr />
</div>
<div class="content">
  <h1 class="selected">请选择您要借款的金额</h1>
  <div class="brwData marl"><a href="">1000元</a></div>
  <div class="brwData"><a href="">3000元</a></div>
  <div class="brwData"><a href="">5000元</a></div>
  <div class="brwData"><a href="">8000元</a></div>
</div>
<hr style="margin-top: 280px;margin-bottom:10px" />
<div><p>© 2017 版权所有 宁波百融信息技术有限公司</p></div>
</body>
</html>
