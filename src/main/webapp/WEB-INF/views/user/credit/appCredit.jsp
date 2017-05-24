<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/app/header.jsp"%>

<div class="header">
    <h1 class="tit" style="font-size: 35px">采风金融 &nbsp;极速审批</h1>

    <hr class="tithr" />
    <p><span class="wht"><i>第一时间  </i></span>为您审批，已有<span class="wht"><i>1000000+</i></span>人申请</p>
</div>

<style>


    .header{
        margin: 60px auto;
        display: block;
        margin-bottom: 40px;
    }
    .tit{
        color: #caa475;
        font-family: "微软雅黑";
        font-size: 8vw;
        font-weight: 200;
        margin: 0 auto;
        text-align: center;
    }
    body{
        background: #24252A;
    }
    .tithr{
        margin-top: 27px;
    }
    .formhr{
        margin-top: -8px;
        border:none;
        border-top:1px solid  #999;
    }
    .jiange{
        font-family: "微软雅黑";
        height: 30px;
        line-height: 28px;
        font-size: 20px;
        color: #969696;
        background: #3f3f3f;
        margin: 0px 0px 10px 0px;
    }
    p{
        font-family: "微软雅黑";
        color: #999;
        font-size: 5vm;
        text-align: center;

    }
    .wht{
        color: #fff;
        font-weight: 800;
        font-size: 19px;
        /*text-decoration: underline;*/
    }
    label{
        color: #caa475;
        font-size: 17px;
        line-height: 20px;
        font-weight: 100;
        margin-left: 12px;
        margin-top: 6px;
    }

    label.error {
        padding-left: 0px;
        color: #ff0000;
    }

    <c:if test="${backgroundColor != null}">
    body{background: ${backgroundColor}}
    </c:if>

    <c:if test="${fontColor != null}">
    .tit{color: ${fontColor}}
    label{color: ${fontColor}}
    </c:if>

    <c:if test="${fontStyle != null}">
    .tit{font-family: "${fontStyle}";}
    p{font-family: "${fontStyle}";}
    .jiange{font-family: "${fontStyle}";}
    label{font-family: "${fontStyle}";}
    </c:if>

    <c:if test="${titBackColor != null}">
    .jiange{color: ${titBackColor}}
    </c:if>

    <c:if test="${jiangeColor != null}">
    .jiange{background: ${jiangeColor}}
    </c:if>
</style>
<div class="content">
    <form class="form" action="${contextPath}/user/credit/add.action" method="post" id="creditAddForm">
        <div class="jiange">&nbsp;基本资料</div>
        <div class="form-group" style="margin-top: -5px;">
            <label for="userName">姓名</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="userName" id="userName" placeholder="请输入您的真实姓名(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="creditAmount">借款金额</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="creditAmount" id="creditAmount" value="${creditAmount}" readonly>
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="userTel">手机</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="userTel" id="userTel" placeholder="请输入您的手机号码(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="qq">QQ</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="qq" id="qq" placeholder="请输入您的QQ账号(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="userSex">性别</label>
            <select style="background-color:transparent; border-width:0px;width: 60%;float: right" name="userSex" id="usersex" class="form-control">
                <option value="0" selected>请选择您的性别</option>
                <option value="1">男</option>
                <option value="0">女</option>
            </select>
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="userAge">年龄</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="userAge" id="userAge" placeholder="请输入年龄(*必填*)">
        </div>
        <div class="jiange">&nbsp;工作信息</div>
        <div class="form-group" style="margin-top: -5px;">
            <label for="workUnit">工作单位</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="workUnit" id="workUnit" placeholder="请如实填写工作单位(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="userPost">岗位职务</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="userPost" id="userPost" placeholder="请填写当前岗位职务(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="unitTel">单位电话</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="unitTel" id="unitTel" placeholder="单位电话格式如：088-88888888">
        </div>
        <div class="jiange">&nbsp;使用情况</div>
        <div class="form-group" style="margin-top: -5px;">
            <label for="zhimaNum">芝麻分</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="zhimaNum" id="zhimaNum" placeholder="请如实填芝麻信用分(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="huabeiLimit">花呗</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="huabeiLimit" id="huabeiLimit" placeholder="请如实填写花呗额度(*必填*)">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="jiebeiLimit">借呗</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="jiebeiLimit" id="jiebeiLimit" placeholder="如有 请填写借呗额度">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="creditCardLimit">信用卡</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="creditCardLimit" id="creditCardLimit" placeholder="如有 请填写信用卡最高额度">
        </div>
        <hr class="formhr" />
        <div class="form-group" style="margin-top: -12px;">
            <label for="jiedaibaoLimit">借贷宝</label>
            <input style="background-color:transparent; border-width:0px;width: 60%;float: right" type="text" class="form-control" name="jiedaibaoLimit" id="jiedaibaoLimit" placeholder="如有 请填写借贷宝已借额度">
        </div>
        <hr class="formhr" />

        <div class="form-group">
            <div class="col-lg-offset-4 col-lg-8">
                <button type="submit" class="btn btn-danger" style="margin-top: -8px; font-size: 15px;line-height: 20px;">请确认无误后点此提交申请</button>
            </div>
        </div>
    </form>
    <hr style="margin-top: 50px;margin-bottom:20px" />
    <div><p>© 2017 版权所有 深圳前海采风互联网金融服务有限公司</p></div>
</div>

<script type="text/javascript" src="${contextPath}/static/plugins/jquery/jquery-3.1.1.js"></script>
<script type="text/javascript" src="${contextPath}/static/plugins/jquery-validate/jquery.validate.js"></script>
<script type="text/javascript">
    $(function () {

        // 数字验证
        jQuery.validator.addMethod("shuzi", function(value, element) {
            return this.optional(element) || /^[0-9]+$/.test(value);
        }, "请输入数字");

        // 电话号验证
        jQuery.validator.addMethod("dianhua", function(value, element) {
            return this.optional(element) || /^[0-9\-]+$/.test(value);
        }, "请输入正确格式的电话号");

        $('#creditAddForm').validate({
            rules: {
                userName: {
                    required: true
                },
                userTel: {
                    required: true,
                    minlength: 8,
                    maxlength: 16,
                    dianhua: true
                },
                qq: {
                    required: true,
                    shuzi: true
                },
                userAge: {
                    required: true,
                    shuzi: true
                },
                userPost: {
                    required: true
                },
                zhimaNum: {
                    required: true,
                    shuzi: true
                },
                huabeiLimit: {
                    required: true,
                    shuzi: true
                },
                jiebeiLimit: {
                    required: false,
                    shuzi: true
                },
                creditCardLimit: {
                    required: false,
                    shuzi: true
                },
                jiedaibaoLimit: {
                    required: false,
                    shuzi: true
                },
                workUnit: {
                    required: true
                }
            },
            messages: {
                userName: {
                    required: "请输入您的真实姓名"
                },
                userTel: {
                    required: "请填写座机号码或手机号码",
                    minlength: "电话号码的长度为8到16",
                    maxlength: "电话号码的长度为8到16"
                },
                qq: {
                    required: "请填写正确格式的QQ账号"
                },
                userAge: {
                    required: "请输入您的真实年龄"
                },
                userPost: {
                    required: "请输入您的岗位职务"
                },
                zhimaNum: {
                    required: "请输入您的芝麻信用分"
                },
                huabeiLimit: {
                    required: "请输入您的花呗额度"
                },
                workUnit: {
                    required: "请如实输入您的工作单位"
                }
            }
        });
    });
</script>
</body>
