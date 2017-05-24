<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>采风金融</title>
    <link rel="shortcut icon" href="${contextPath}/static/images/icon.png" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <%--<meta http-equiv="X-UA-Compatible" content="IE=8" />--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextPath}/static/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/static/plugins/icon/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${contextPath}/static/plugins/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${contextPath}/static/css/login.css" />
    <link rel="stylesheet" href="${contextPath}/static/plugins/bootstrap/css/bootstrap-theme.css" />
</head>
<body>
<!--登录框-->
<div class="center">
    <div class="login">
        <div class="right_div">
            <form action="${contextPath}/admin/login.action" method="post" id="adminLoginForm">
                <h4 style="color: #373737;text-align: center;margin-bottom: 25px;">管理员登录</h4>
                <input class="login-input" type="text" name="adminLoginName" placeholder="输入用户名" >
                <input class="login-input" type="password" name="adminPassWord" placeholder="输入密码">
                <input class="login-button" type="submit" name="button" value="登录">
            </form>
        </div>
    </div>
</div>

<!--网站信息-->
<div class="footer">
    <section class="information"></section>
    <section class="mainWrap">
        <span class="info">
            <span>技术支持</span>
            <span>史汉文</span>
            <span>联系方式：QQ 1980849329</span>
        </span>
        <br/>
        <span class="copy">
            <span>© 2017 版权所有 深圳前海采风互联网金融服务有限公司</span>
        </span>
    </section>
</div>