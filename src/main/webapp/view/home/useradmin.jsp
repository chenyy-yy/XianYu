<%--
  Created by IntelliJ IDEA.
  User: 26589
  Date: 2019/9/17
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title> 玄玉 系统</title>
    <meta charset="utf-8">
    <%@ include file='/view/common/head.jsp' %>
    <script>
        $(function () {
            $("#addStudentFormId").bootstrapValidator(
                {
                    message: '字段值无效',
                    feedbackIcons:
                        {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                    fields:
                        {
                            message: '用户名无效',
                            // 一定要和要校验的字段的name属性值保持一致
                            uName:
                                {
                                    validators:
                                        {
                                            notEmpty:
                                                {
                                                    message: '用户名不能为空'
                                                },
                                            stringLength:
                                                {
                                                    min: 3,
                                                    max: 8,
                                                    message: '用户名必须在3~8之间'
                                                },
                                            regexp:
                                                {
                                                    regexp: /^[a-zA-Z0-9_\.]+$/,
                                                    message: '用户名只能由字母、数字、点和下划线组成'
                                                }
                                        }
                                }
                        }
                });
        });
    </script>
</head>
<body>

<div class="container margin-top-10">
    <div class="col-sm-8">
        <div class="panel panel-default">
            <div class="panel-body">
                <form action="WEB-INF/studentPage/studentMain" id="addStudentFormId" class="form-horizontal"
                      method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录账户:</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text" name="uName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录密码:</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名姓名:</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:</label>
                        <div class="col-sm-6">
                            <input class="form-control" type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                        <div class="col-sm-6">
                            <div class="radio">
                                <label>
                                    <input type="radio" value="male" name="sex" checked="checked"> 男
                                </label>
                                &nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="radio" value="female" name="sex"> 女
                                </label>
                            </div>
                        </div>
                        <label class="col-sm-4 control-label error-info" style="text-align:left;"></label>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6  col-sm-offset-2">
                            <div class="col-sm-6">
                                <button type="reset" class="btn btn-primary btn-block">重&nbsp;&nbsp;置</button>
                                <button type="submit" class="btn btn-primary btn-block">添&nbsp;&nbsp;加</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <!-- 页尾 版权声明 -->
    <jsp:include page="/view/common/buttom.jsp"/>

</body>
</html>
