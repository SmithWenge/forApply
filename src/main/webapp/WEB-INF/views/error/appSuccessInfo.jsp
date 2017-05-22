<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>采风金融</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <%--<meta http-equiv="X-UA-Compatible" content="IE=8" />--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="${contextPath}/static/images/icon.png" />
    <link href="${contextPath}/static/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <style>
        body{
            background: whitesmoke;
        }
        #errorInfo{
            width: 300px;
            height: 200px;
            margin: 150px auto;
            /*float: left;*/
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
    <span>恭喜 已完成提交！<br>我们会尽快办理并联系您。</span>
</div>
</body>
</html>
