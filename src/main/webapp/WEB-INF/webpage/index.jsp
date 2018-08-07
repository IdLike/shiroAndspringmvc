
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="${ctx}/lib/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/lib/bootstrap-table.css">
    <script src="${ctx}/lib/jquery-3.3.1.min.js"></script>
    <script src="${ctx}/lib/bootstrap-table.js"></script>
    <style>
        table>thead>tr>th{

            text-align: center;

        }

    </style>
</head>
<body>
      <div class="pull-right" style="margin-bottom: 50px">
          <c:choose>
              <c:when test="${user.username!=null}">
                  ${user.username},欢迎您O(∩_∩)O
              </c:when>
              <c:otherwise>
                  游客您好，<a href="${ctx}/login/tologin.do">登录</a>
              </c:otherwise>
          </c:choose>
      </div>
      <label id="msg" hidden>${msg}</label>
      <table id="table" style="text-align: center"></table>

</body>
<script>

    $(function () {




        $("#table").bootstrapTable({
            method: 'get',
            dataType: "json",
            url: "${ctx}/index/data.do",
            pagination: true,                   //是否显示分页（*）
            onLoadSuccess:function(data){
              console.log(data);
            },
            sidePagination:"server",
            columns: [
                {
                    checkbox: true
                },
                {
                field: 'username',
                title: '用户名'
            }, {
                field: 'realname',
                title: '真实姓名'
            }, {
                field: 'password',
                title: '密码'
            }, {
                field:"mobile",
                title:"电话"
            }, {
                //roles为set集合
                field:"roles",
                title:"角色",
                 formatter: function (value) {
                     var s="";
                    $.each(value,function (index,obj) {
                        s+=obj.rolename+" ";
                    });
                     console.log(s);
                     return s;
                 }
                },{
                field:"button",
                title:"操作",
                formatter:function(value, row , index){

                    return [
                      /*   '<a href="${ctx}/index/add.do?id='+row.id +'">增加</a>',
                        '<a href="${ctx}/index/update.do?id=\'+row.id +\'">修改</a>',
                        '<a href="${ctx}/index/detail.do?id=\'+row.id +\'">查看</a>',*/
                        <shiro:hasRole name="管理员">
                        '<a onclick="show()" href="${ctx}/index/delete.do?userId='+row.id +'">删除</a>'
                        </shiro:hasRole>
                    ];
                }
             }

            ]
        });

    });

    function show(){

        if($("#msg").text()){

              alert($("#msg").text());
          }

    }
</script>
</html>
