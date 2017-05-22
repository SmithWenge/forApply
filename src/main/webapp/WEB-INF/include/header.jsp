<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <style type="text/css">
        label.error {
            color: red;
        }
    </style>
</head>
<body>