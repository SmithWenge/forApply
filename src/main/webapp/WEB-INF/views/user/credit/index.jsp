<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/app/header.jsp"%>

<style>
    body{
        background: #24252A;
    }
    .header{
        margin: 80px 0px 60px 0px;
        display: block;

    }
    .tit{
        color: #caa475;
        font-family: "微软雅黑";
        font-size: 6vw;
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
        width: 18.8vw;
        height: 23.5vh;
        color: #caa475;
        text-align: center;
        font-size: 2.5vw;
        display: inline;

    }
    .brwData a:hover{
        border: solid #caa475 5px;
        text-decoration: none;
        color: #caa475;
    }
    .marl{
        margin-left: 4vw;
    }
    p{
        text-align: center;
        color: #888;
        font-size: 16px;
        font-family: "微软雅黑";
        font-weight: 100;
    }

    <c:if test="${backgroundColor != null}">
        body{background: ${backgroundColor}}
    </c:if>

    <c:if test="${fontColor != null}">
        .tit{color: ${fontColor}}
        .selected{color: ${fontColor}}
        .brwData{border: solid 2px ${fontColor}}
        .brwData a{color: ${fontColor}}
        .brwData a:hover{color: ${fontColor}; border: solid ${fontColor} 5px}
    </c:if>

    <c:if test="${fontStyle != null}">
        .tit{font-family: "${fontStyle}";}
        .selected{font-family: "${fontStyle}";}
        p{font-family: "${fontStyle}";}
    </c:if>
</style>
<div class="header">
    <h1 class="tit">采风金融，极速审批</h1>
    <hr />
</div>
<div class="content">
    <h1 class="selected">请选择您要借款的金额</h1>
    <div class="brwData marl"><a href="${contextPath}/user/credit/routeAdd/1000.action"><br>1000元</a></div>
    <div class="brwData"><a href="${contextPath}/user/credit/routeAdd/2000.action"><br>2000元</a></div>
    <div class="brwData"><a href="${contextPath}/user/credit/routeAdd/3000.action"><br>3000元</a></div>
    <div class="brwData"><a href="${contextPath}/user/credit/routeAdd/5000.action"><br>5000元</a></div>
</div>
<hr style="margin-top: 360px;margin-bottom:10px" />
<div><p>© 2017 版权所有 深圳前海采风互联网金融服务有限公司</p></div>
</body>
