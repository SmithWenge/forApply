<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp"%>
<style>
    .header ul{
        padding-left: 0;
        margin-bottom: 0;
        background: #444444;
        height: 55px;
    }
    .header ul li {
        float: left;
        height: 55px;
        line-height: 55px;
        color: whitesmoke;
        list-style: none;
    }
    .header ul li a{
        color: white;
    }
</style>
<link href="${contextPath}/static/plugins/nav/nav.css" rel="stylesheet" type="text/css" />
<div class="header">
    <ul>
        <li style="width: 2%;"></li>
        <li style="width: 10%;">后台管理</li>
        <li style="width: 6%;"> <span class="glyphicon glyphicon-user"> </span> ${adminLogin.adminLoginName}</li>
        <li style="width: 75%;"><a href="${contextPath}/admin/routePass.action">更改密码</a></li>
        <li style="width: 5%;"><a href="${contextPath}/admin/logout.action"><span class="glyphicon glyphicon-off"></span> 退出</a></li>
    </ul>
</div>
    <ul id="accordion" class="accordion">
        <li>
            <div class="link">
                <a id="index_info" href="${contextPath}/admin/home.action">
                    首页
                </a>
            </div>
        </li>
        <li>
            <div class="link" id="creditManage">
                贷款管理
                <i class="fa fa-chevron-down"></i>
            </div>
            <ul class="submenu">
                <li>
                    <a id="application" href="${contextPath}/admin/creditList/routePage.action">
                        申请列表
                    </a>
                </li>
                <li>
                    <a id="updateList" href="${contextPath}/admin/creditList/routePage.action">
                        更新系统缓存
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <div class="link" id="system">
                系统设置
                <i class="fa fa-chevron-down"></i>
            </div>
            <ul class="submenu">
                <li>
                    <a id="routeColor" href="${contextPath}/admin/system/routeFontColor.action">
                        整体字体颜色
                    </a>
                </li>
                <li>
                    <a id="routeFont" href="${contextPath}/admin/system/routeFontStyle.action">
                        整体字体风格
                    </a>
                </li>
                <li>
                    <a id="routeBig" href="${contextPath}/admin/system/routeBackGround.action">
                        整体背景颜色
                    </a>
                </li>
                <li>
                    <a id="routejiange" href="${contextPath}/admin/system/routeJiange.action">
                        标题背景颜色
                    </a>
                </li>
                <li>
                    <a id="routeTitBack" href="${contextPath}/admin/system/routeTitBack.action">
                        标题字体颜色
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <div class="link" id="logManageNav">
                日志管理
                <i class="fa fa-chevron-down"></i>
            </div>
            <ul class="submenu">
                <li>
                    <a id="log" href="${contextPath}/admin/log/routePage.action">
                        查看日志
                    </a>
                </li>
            </ul>
        </li>
        <li><div class="link" style="height: 550px"></div></li>
    </ul>

<%--<%@include file="/WEB-INF/include/javascript.jsp"%>--%>

<script type="text/javascript" src="${contextPath}/static/plugins/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${contextPath}/static/plugins/nav/index.js"></script>
