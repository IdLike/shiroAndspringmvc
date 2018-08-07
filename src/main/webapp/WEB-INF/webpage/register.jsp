
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>用户注册</title>
    <link href="${ctx}/lib/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="${ctx}/lib/bootstrapValidator.css">
    <script src="${ctx}/lib/jquery-3.3.1.min.js"></script>
    <script src="${ctx}/lib/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${ctx}/lib/bootstrapValidator.js"></script>
</head>
<body>

    <div class="center-block" style="width:50%; margin-top: 50px;">
        <form class="form-horizontal" method="post" action="/mavenWeb/register/register.do">
            <div class="form-group">
                <label  class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-6">
                    <input type="text" name="username" class="form-control" placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">真实姓名</label>
                <div class="col-sm-6">
                    <input type="text" name="realname" class="form-control" placeholder="请输入真实姓名"  >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input type="text" name="mobile" class="form-control" placeholder="请输入手机号"  >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">密码</label>
                <div class="col-sm-6">
                    <input type="text" name="password" class="form-control" placeholder="请输入密码"  >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">确认密码</label>
                <div class="col-sm-6">
                    <input type="text" name="repassword" class="form-control" placeholder="请再次输入密码"  >
                </div>
            </div>
            <div class="form-group" >
                    <button type="submit" style="margin-left: 35%" class="btn btn-default">注册</button>

            </div>
        </form>

    </div>
<script>
    $(function () {

        $("form").bootstrapValidator(
            {
                fields: {
                    username: {
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 2,
                                max: 10,
                                message: '用户名长度必须在2到10位之间'
                            },
                        }
                    },
                    realname: {
                        validators: {
                            notEmpty: {
                                message: '姓名不能为空'
                            }
                        }
                    },
                    mobile:{
                        validators:{
                            notEmpty:{
                                message:"手机号不能为空"
                            },
                            regexp:{
                               regexp:/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/,
                               message:"手机号格式不正确"

                            }
                        }

                    },
                    password:{
                        validators:{
                            notEmpty:{
                                message:"密码不能为空"
                            },
                            regexp:{
                                regexp:/^[a-zA-Z0-9_]+$/,
                                message:"密码只能包含字母数字下划线"
                            },
                            stringLength:{
                                min: 6,
                                max: 8,
                                message: '用户名长度必须在6到8位之间'

                            }
                        }

                    },
                    repassword:{
                       validators:{
                           identical: {
                               field: 'password',
                               message: '两次密码输入不一致'
                           }
                       }
                    }
                }
            }

        );
    });
</script>
</body>
    </html>




