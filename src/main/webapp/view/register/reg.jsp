<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/17
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>注册</title>
    <%@ include file='../common/head.jsp' %>
    <link type="text/css" rel="stylesheet" href="/common/css/reg.css"/>
</head>
<body>
<div class="modal-dialog" style="padding-top: 10%;">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title text-center" id="myModalLabel">注册</h4>
        </div>
        <div class="modal-body" id="model-body">
            <form id="loginForm" method="post" action="login/login">
                <table style="width: 412px">
                    <tr>
                        <td width="20%" align="right"><span align="right">姓名：</span></td>
                        <td width="80%"><input style="display: inline;" type="text" id="xm" name="xm"
                                               class="form-control" placeholder="姓名" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right"><span align="right">证件号码：</span></td>
                        <td width="80%"><input style="display: inline;" type="text" id="zjhm" name="zjhm"
                                               class="form-control" placeholder="证件号码" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right"><span>手机号码：</span></td>
                        <td width="80%"><input style="display: inline;" type="text" id="sjhm" name="sjhm"
                                               class="form-control" placeholder="手机号码" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right"><span align="right">密  码：</span></td>
                        <td width="80%"><input style="display: inline;" type="password" id="pwd" name="pwd"
                                               class="form-control" placeholder="密码" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="right"><span align="right">确认密码：</span></td>
                        <td width="80%"><input style="display: inline;" type="password" id="pwd1" name="pwd1"
                                               class="form-control" placeholder="请再次输入密码" autocomplete="off"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="modal-footer">
            <%--<div class="form-group">
                <button type="button" class="btn btn-primary form-control"  onclick="login()">登录</button>
            </div>--%>
            <div class="form-group">
                <button style="margin-right: 420px;" type="button" class="btn btn-default form-control"
                        onclick="register();">注册
                </button>
            </div>

        </div>
    </div>
</div>
<!-- 页尾 版权声明 -->
<jsp:include page="/view/common/buttom.jsp"/>
</body>
</html>
<script>
    function register() {
        var xm = $('#xm').val();
        var pwd = $('#pwd').val();
        var pwd1 = $('#pwd1').val();
        var sjhm = $('#sjhm').val();
        var zjhm = $('#zjhm').val();

        var regIdNo = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if(!regIdNo.test(zjhm)){
            toastr.info('身份证号填写有误');
            return;
        }

        if (pwd == '' || pwd1 == '') {
            toastr.info('密码不能为空！');
            return;
        }
        if (pwd != pwd1) {
            toastr.info('两次密码不一致！');
            return;
        }
        $.ajax({
            url: "/reg_in",
            data: {"sjhm": sjhm, "pwd": pwd, "zjhm": zjhm,'xm':xm},
            type: "post",
            timeout: 3000,
            dataType: "json",
            async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                toastr.error('链接超时！');
            },
            success: function (responseText, textStatus, XMLHttpRequest) {
                if (responseText.code == "1") {
                    toastr.info('注册失败！');
                } else if (responseText.code == "0") {
                    location.href='/';
                }

            }
        });

    }
</script>