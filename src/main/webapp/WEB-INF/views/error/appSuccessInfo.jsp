<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>秦越金融</title>
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
        #icon{
            height: 120px;
            width: 120px;
            margin: 40px auto 0px;
        }
        #info{
            width: 300px;
            margin: 10px auto;
            text-align: center;
        }
        #jindu{
            width: 300px;
            margin: 27px auto 0px;
            text-align: center;
        }
        #qycode{
            height: 250px;
            width: 250px;
            margin: 10px auto 0px;
        }
        #muqian{
            width: 300px;
            margin: 30px auto 0px;
            text-align: center;
        }
        #foot{
            width: 300px;
            margin: 1px auto 0px;
            text-align: center;
        }
        p{
            color: #969696;
            font-family: "微软雅黑";
            display: inline-block;
            font-size: 15px;
        }
        span{
            color: #444444;
            font-family: "微软雅黑";
            display: inline-block;
            font-size: 17px;
            line-height: 28px;
        }
        a{
            color: #ecaf55;
            font-family: "微软雅黑";
            display: inline-block;
            font-size: 17px;
        }
    </style>
</head>
<body>
<div style="text-align: center">
    <img id="icon" src="${contextPath}/static/images/icon.png">
</div>
<div id="info">
    <span>您的申请已成功提交<br>请您务必保持电话畅通<br>我们将尽快电联您审核</span>
</div>
<div id="jindu">
    <span><b>查询借款进度</b><br>长按识别二维码&nbsp;&nbsp;关注微信公众号</span>
</div>
<div style="text-align: center">
    <img id="qycode" src="${contextPath}/static/images/qycode.jpg">
</div>
<div id="muqian">
    <p>目前1000000+人已关注加入我们</p>
</div>
<div id="foot">
    <a>©2017版权所有 秦越金融</a>
</div>
</body>
</html>
