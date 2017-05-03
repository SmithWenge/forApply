<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/navs.jsp"%>
<%@include file="/WEB-INF/include/message.jsp"%>
<div style="margin-top: 7%; margin-left: 20%">
    <a style="font-size: 17px"><b>数据库中所有的</b>贷款申请数目为${home.numOfList}条，其中<b>未审核的</b>申请为${home.numOfUnShenhe}条，<b>审核通过的</b>申请为${home.numOfShenheSuccess}条，<b>审核未通过的</b>申请有${home.numOfShenHeFailed}条.</a>
    <br><br/><a style="font-size: 17px"><b>今天的</b>贷款申请数目为${home.numOfNowaday},其中<b>未审核的</b>申请为${home.numOfDayUnShenhe}条，<b>审核通过的</b>申请为${home.numOfDayShenheSuccess}条，<b>审核未通过的</b>申请有${home.numOfDayShenHeFailed}条.</a>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>