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
    <title>Title</title>
    <%@ include file='view/common/head.jsp' %>
</head>
<body>
<div class="modal-dialog" style="padding-top: 10%;">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title text-center" id="myModalLabel">登录</h4>
        </div>
        <div class="modal-body" id = "model-body">
            <table style="width: 412px">
                <tr>
                    <td width="20%" align="right"><span>账号：</span></td>
                    <td width="80%"><input  style="display: inline;"  type="text" id="sjhm" class="form-control"placeholder="登录账号" autocomplete="off"></td>
                </tr>
                <tr>
                    <td width="20%" align="right"><span align="right">密码：</span></td>
                    <td width="80%"><input  style="display: inline;"   type="password" id="pwd" class="form-control" placeholder="密码" autocomplete="off"></td>
                </tr>
            </table>
        </div>
        <div class="modal-footer">
            <div class="form-group">
                <button type="button" class="btn btn-primary form-control"  onclick="login()">登录</button>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-default form-control" onclick="open_register();">注册</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
<script>
    function login() {
        var sjhm = $("#sjhm").val();
        var pwd = $("#pwd").val();
        if(sjhm==""||pwd==""){
            //toastr.success('提交数据成功');
            //toastr.error('Error');
            //toastr.warning('只能选择一行进行编辑');
            //toastr.info('info');
            toastr.warning('请输入用户名和密码');
            return;
        }
        $.ajax({
            url: "login/login",
            data: {"sjhm": sjhm,"pwd":pwd},
            type: "get",
            timeout: 3000,
            dataType: "json",
            async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                toastr.error('链接超时！');
            },
            success: function (responseText, textStatus, XMLHttpRequest) {
                if(responseText.code=="-1"){
                    toastr.info('用户名或密码不正确！');
                    return;
                }
                location.reload();
            }
        });
    }
</script>