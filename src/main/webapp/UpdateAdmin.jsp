<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        <!-- 在页面加载完成后加载表单检验函数，判断表单内容是否符合设计规范   -->
        window.onload=function (){
            document.getElementById("form").onsubmit=function (){
                return checkAdminname()&&checkPassWord();
            }
        }
        function checkAdminname(){
            var admin = document.getElementById("name").value;
            var reg_username= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
            var flag=reg_username.test(admin);
            var s_adminname=document.getElementById("s_adminname");
            if(flag){
                s_adminname.innerHTML=""
            }else{
                s_adminname.innerHTML="管理员名称不能为空"
            }
            return flag;
        }
        function checkPassWord(){
            var password=document.getElementById("password").value;
            var reg_password=/^(?![\da-z]+$)(?![\dA-Z]+$)(?![\d!#$%^&*]+$)(?![a-zA-Z]+$)(?![a-z!*]+$)(?![A-Z!*]+$)[\da-zA-z!*]{8,12}$/
            var flag=reg_password.test(password);
            var s_password=document.getElementById("s_password");
            if(flag){
                s_password.innerHTML="";
            }else{
                s_password.innerHTML="密码需大小写字母及数字组合，8-12位";
            }
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
        <form action="UpdateAdmin" id="form" method="get" accept-charset="utf-8">
            <div class="form-group">
                <%--回显信息 --%>
                <!-- 隐藏域提交id -->
                <input type="hidden" name="id" value="${admin.id}">
                <div align="center" style="font-size:24px">编辑管理员信息</div>
                <input class="form-control" type="text" value="${admin.name}" placeholder="请输入姓名" id="name" name="name">
                <span id="s_adminname" class="has-error" style="color: red"></span>
            </div>
            <div class="form-group">
                <input class="form-control" type="password" placeholder="请输入密码" id="password" name="password">
                <span id="s_password" class="has-error"style="color: red"></span>
            </div>
            <div align="center"><button  id="btn_sub" type="submit" class="btn btn-group" style="font-size:20px;" >提交</button>
            <a href="AdminInfo.html"><button type="button" class="btn btn-info" style="font-size:20px;">返回</button></a>
            </div>
        </form>
    </div>
</div>
</body>
</html>