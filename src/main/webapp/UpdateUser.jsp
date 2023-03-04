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
        return checkUsername()&&checkUserage()&&checkUserPhone();
      }
    }
    function checkUsername(){
      var username = document.getElementById("name").value;
      var reg_username= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
      var flag=reg_username.test(username);
      var s_username=document.getElementById("s_username");
      if(flag){
        s_username.innerHTML=""
      }else{
        s_username.innerHTML="用户名格式有误"
      }
      return flag;
    }
    function checkUserage(){
      var userage = document.getElementById("age").value;
      var flag;
      if(userage>100||userage<=0){
        flag=false;
      }else{
        flag=true;
      }
      var s_age=document.getElementById("s_age");
      if(flag){
        s_age.innerHTML=""
      }else{
        s_age.innerHTML="年龄有误"
      }
      return flag;
    }
    function checkUserPhone(){
      var userphone=document.getElementById("phone").value;
      var reg_userphone=/^[0-9]{11}$/;
      var flag=reg_userphone.test(userphone);
      var s_phone=document.getElementById("s_phone");
      if(flag){
        s_phone.innerHTML="";
      }else{
        s_phone.innerHTML="联系方式有误";
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
    <form action="UpdateUser" id="form" method="post" accept-charset="utf-8">
      <div class="form-group">
        <!-- 隐藏域提交id -->
<%--        回显信息--%>
        <input type="hidden" name="id" value="${user.id}">
        <div align="center" style="font-size:24px">编辑用户信息</div>
        <input class="form-control" type="text" value="${user.name}" placeholder="请输入姓名" id="name" name="name">
        <span id="s_username" class="has-error" style="color: red"></span>
      </div>

        <c:if test="${user.sex=='男'}">
            <div class="form-group">
            <input  type="radio" name="sex" value="男" checked="checked">男
            <input  type="radio" name="sex" value="女">女
          </div>
        </c:if>
      <c:if test="${user.sex=='女'}">
        <div class="form-group">
          <input  type="radio" name="sex" value="男" >男
          <input  type="radio" name="sex" value="女" checked="checked">女
        </div>
      </c:if>
      <div class="form-group">
        <input class="form-control" type="text" value="${user.age}"placeholder="请输入年龄" id="age" name="age">
        <span id="s_age" class="has-error" style="color: red"></span>
      </div>
      <div class="form-group">
        <input class="form-control" type="text" value="${user.phone}"placeholder="请输入联系方式" id="phone" name="phone">
        <span id="s_phone" class="has-error"style="color: red"></span>
      </div>
      <div align="center"><button  id="btn_sub" type="submit" class="btn btn-group" style="font-size:20px;" >提交</button>
      <a href="zhuye.html"><button type="button" class="btn btn-info" style="font-size:20px;">返回</button></a>
      </div>
    </form>
  </div>
</div>
</body>
</html>