<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
    <meta charset="UTF-8">
    <title>百融金融</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="${contextPath}/static/images/logo.jpg" />
    <link rel="stylesheet" href="${contextPath}/static/login/css/style.css">
</head>

<body>
<!--Google Font - Work Sans-->
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,700' rel='stylesheet' type='text/css'>

<div class="container">
    <div class="profile">
        <button class="profile__avatar" id="toggleProfile">
            <img src="${contextPath}/static/images/caifeng.jpg" alt="Avatar" />
        </button>
        <div class="profile__form">
            <div class="profile__fields">
                <form action="${contextPath}/admin/login.action" method="post">
                    <div class="field">
                        <input type="text" id="adminLoginName" name="adminLoginName" class="input" />
                        <label for="adminLoginName" class="label">用户名</label>
                    </div>
                    <div class="field">
                        <input type="password" id="adminPassWord" name="adminPassWord" class="input" />
                        <label for="adminPassWord" class="label">密码</label>
                    </div>
                    <div class="profile__footer">
                        <button class="btn">登陆</button>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${contextPath}/static/login/js/index.js"></script>
</body>
</html>
