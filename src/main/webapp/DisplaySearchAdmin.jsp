<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="zh-CN">
<head>
<%--在页面加载完成后载入查询框表单检验函数    --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        function deleteAdmin(id){
            if(confirm("你确定删除吗？")){
                location.href="/DeleteAdmin?id="+id;
            }
        }
        window.addEventListener("load",forsubmit,false);
        function forsubmit(){
            document.getElementById("form").onsubmit=function (){
                var search=document.getElementById("s_search").innerHTML;
                if(checkAdminname()){
                    search="";
                    document.getElementById("s_search").innerHTML=search;
                    return true;
                }else{
                    search="管理员名称不能为空";
                    document.getElementById("s_search").innerHTML=search;
                    return false;
                }
            }
        }
        function checkAdminname(){
            var username = document.getElementById("search_name").value;
            var reg_username= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
            var flag=reg_username.test(username);
            return flag;
        }
    </script>
</head>
<body style="background-color: lightgrey">
<div style="height: 60px;line-height: 60px; background-color: white"><img src="assets/logo.png" alt="" style="width: 40px; position: relative;top: 10px;left: 20px;margin-bottom: 30px">
    <span style="margin-left: 25px;font-size:24px">图书管理系统</span>
</div>
<div style="display: flex">
    <div style="width: 200px;min-height:92vh;overflow: hidden;margin-right: 2px;background-color: white">
        <div style="margin-left: 25px;font-size:24px"><a href="zhuye.html">用户信息</a></div>
        <div style="margin-left: 25px;font-size:24px"><a href="bookInfo.html">图书信息</a></div>
        <div style="margin-left: 25px;font-size:24px"><a href="AdminInfo.html">管理员信息</a></div>
        <div style="margin-left: 25px;font-size:24px"><a href="borrowbook.html">借书</a></div>
        <div style="margin-left: 25px;font-size:24px"><a href="TotalBorrowAndReturn.html">借阅查询</a></div>
    </div>
    <div style=" flex:1;background-color: white">
        <div>
            <form class="form-inline" action="FindSearchAdmin" method="post" id="form" accept-charset="utf-8" >
                <div class="form-group">
                    <input type="text"  class="form-control" id="search_name" name="name" placeholder="请输入管理员名称">
                </div>
                <button type="submit" class="btn btn-default" id="btn" >查询</button>
                <a href="addAdmin.html"><button type="button" class="btn btn-info" >添加管理员</button></a>
            </form>
            <span id="s_search" class="has-error" style="color: red"></span>
        </div>
        <table class="table table-striped" id="table">
            <tr>
                <td>管理员名称</td>
                <td>操作</td>
            </tr>
<%--得到接口返回的被查询管理员，将管理员信息显示            --%>
            <c:forEach items="${admins}" var="admin">
                <tr>
                    <td>${admin.name}</td>
                    <td><a type="button" class="btn btn-info" href="/findAdmin?id=${admin.id}">编辑</a>
                        <a type="button" class="btn btn-danger" href="javascript:deleteAdmin(${admin.id});">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>