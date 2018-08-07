<%--
  Created by IntelliJ IDEA.
  User: fuck_sky
  Date: 2018/7/23
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link href="${pageContext.request.contextPath}/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/lib/bootstrapValidator.css" rel="stylesheet">
    <script src="${ctx}/lib/jquery-3.3.1.min.js"></script>
    <script src=${ctx}"/lib/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${ctx}/lib/bootstrapValidator.js"></script>
    <title>登录</title>
    <script>
        
        $(function () {

            $('form').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: { //根据验证结果显示的各种图标
                    valid: null,
                    invalid: "glyphicon glyphicon-remove",
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
                        message: '用户名验证失败',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: { //非空验证
                                message: '密码不能为空'
                            },
                            stringLength: {//检测长度
                                min: 6,
                                max: 8,
                                message: '长度必须在6-8之间'
                            },

                        }
                    }
                }
            });
            
        })
        
    </script>
</head>
<body>

    <div class="center-block" style="width:50%;height:200px; margin-top: 50px">
        <form class="form-horizontal" method="post" action="login.do">
            <div class="form-group">
                <label  class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="text" name="username" class="form-control" placeholder="请输入账号">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="text" name="password" class="form-control" placeholder="请输入密码"  >
                    <label style="color: red">${errMsg}</label>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">登录</button>
                    <a href="/mavenWeb/register/toregister.do">点击注册</a>
                </div>
            </div>
        </form>

    </div>
</body>
</html>
