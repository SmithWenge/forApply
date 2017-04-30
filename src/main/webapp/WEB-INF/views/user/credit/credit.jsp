<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${contextPath}/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <title>百融金融</title>
    <style>
        body{
            background: #24252A;
        }
        .header{
            /*width: 800px;*/
            margin: 60px auto;
            display: block;
            margin-bottom: 60px;
        }
        .tit{
            color: #caa475;
            font-family: "微软雅黑";
            font-size: 3.2vw;
            font-weight: 200;
            margin: 0 auto;
            text-align: center;
        }
        hr{
            margin-top: 27px;
        }
        p{
            font-family: "微软雅黑";
            color: #999;
            font-size: 19px;
            text-align: center;

        }
        .wht{
            color: #fff;
            font-weight: 800;
            font-size: 22px;
            /*text-decoration: underline;*/
        }
        label{
            color: #caa475;
            font-size: 18px;
            line-height: 20px;
            font-weight: 100;
        }

    </style>
</head>
<body>
<div class="header">
    <h1 class="tit"><i>百融金融，极速审批</i></h1>

    <hr />
    <p><span class="wht"><i>第一时间  </i></span>为您审批，已有<span class="wht"><i>1000000+</i></span>人申请</p>
</div>
<div class="content">
    <form class="form-horizontal" action="${contextPath}/user">
        <div class="form-group">
            <label for="userName" class="col-md-4 control-label">姓名</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="userName" id="userName" placeholder="请输入您的真实姓名                                                   (*必填*)">
            </div>
</div>
        <div class="form-group">
            <label for="creditAmount" class="col-sm-4 control-label">借款金额</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="creditAmount" id="creditAmount" value="${creditAmount}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="userTel" class="col-md-4 control-label">手机</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="userTel" id="userTel" placeholder="请输入您的手机号码                                                   (*必填*)">
            </div>
        </div>
        <div class="form-group">
            <label for="userSex" class="col-sm-4 control-label">性别</label>
            <div class="col-md-5">
                <tags:dicselect name="userSex" key="userSex" value="0" id="userSex" />
            </div>
        </div>
        <div class="form-group">
            <label for="userAge" class="col-sm-4 control-label">年龄</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="userAge" id="userAge" placeholder="请输入年龄                                                                (*必填*)">
            </div>
        </div>
        <div class="form-group">
            <label for="workUnit" class="col-sm-4 control-label">工作单位</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="workUnit" id="workUnit" placeholder="请如实填写工作单位">
            </div>
        </div>
        <div class="form-group">
            <label for="userPost" class="col-sm-4 control-label">岗位职务</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="userPost" id="userPost" placeholder="请填写当前岗位职务                                                   (*必填*)">
            </div>
        </div>
        <div class="form-group">
            <label for="unitTel" class="col-sm-4 control-label">单位电话</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="unitTel" id="unitTel" placeholder="单位电话格式如：088-88888888">
            </div>
        </div>
        <div class="form-group">
            <label for="zhimaNum" class="col-sm-4 control-label">芝麻分</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="zhimaNum" id="zhimaNum" placeholder="请如实填芝麻信用分                                                   (*必填*)">
            </div>
        </div>
        <div class="form-group">
            <label for="huabeiLimit" class="col-sm-4 control-label">花呗</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="huabeiLimit" id="huabeiLimit" placeholder="请如实填写花呗额度                                                   (*必填*)">
            </div>
        </div>
        <div class="form-group">
            <label for="jiebeiLimit" class="col-sm-4 control-label">借呗</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="jiebeiLimit" id="jiebeiLimit" placeholder="如有 请填写借呗额度">
            </div>
        </div>
        <div class="form-group">
            <label for="creditCardLimit" class="col-sm-4 control-label">信用卡</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="creditCardLimit" id="creditCardLimit" placeholder="如有 请填写信用卡最高额度">
            </div>
        </div>
        <div class="form-group">
            <label for="jiedaibaoLimit" class="col-sm-4 control-label">借贷宝</label>
            <div class="col-md-5">
                <input type="text" class="form-control" name="jiedaibaoLimit" id="jiedaibaoLimit" placeholder="如有 请填写借贷宝已借额度">
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-offset-4 col-lg-8">
                <button type="submit" class="btn btn-danger" style="font-size: 16px;line-height: 24px;">为了尽快办理您的审批，请确认无误后点此提交申请</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
