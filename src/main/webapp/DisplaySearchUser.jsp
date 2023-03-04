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
    <%--在页面加载完成后载入查询框表单检验函数    --%>
    function deleteUser(id){
      if(confirm("你确定删除吗？")){
        location.href="/DeleteUser?id="+id;
      }
    }
    window.addEventListener("load",forsubmit,false);
    function forsubmit(){
      document.getElementById("form").onsubmit=function (){
        var search=document.getElementById("s_search").innerHTML;
        if(checkUsername()||checkUserPhone()){
          search="";
          document.getElementById("s_search").innerHTML=search;
          return true;
        }else{
          search="手机号号和姓名至少填一个，手机号必须填全!";
          document.getElementById("s_search").innerHTML=search;
          return false;
        }
      }
    }
    function checkUsername(){
      var username = document.getElementById("search_name").value;
      var reg_username= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
      var flag=reg_username.test(username);
      return flag;
    }
    function checkUserPhone(){
      var userphone=document.getElementById("search_phone").value;
      var reg_userphone=/^[0-9]{11}$/;
      var flag=reg_userphone.test(userphone);
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
      <form class="form-inline" action="/FindSearchUser" method="post" id="form" accept-charset="utf-8" >
        <div class="form-group">
          <input type="text"  class="form-control" id="search_name" name="name" placeholder="请输入姓名">
        </div>
        <div class="form-group">
          <input type="text"  class="form-control" id="search_phone" name="phone" placeholder="请输入手机号">
        </div>
        <button type="submit" class="btn btn-default" id="btn" >查询</button>
        <a href="adduser.html"><button type="button" class="btn btn-info" >添加用户</button></a>
      </form>
      <span id="s_search" class="has-error" style="color: red"></span>
    </div>
   <table class="table table-striped" id="table">
     <tr>
       <td>姓名</td>
       <td>性别</td>
       <td>年龄</td>
       <td>联系方式</td>
       <td>操作</td>
     </tr>
     <%--得到接口返回的被查询用户，将用户信息显示            --%>
     <c:forEach items="${users}" var="user">
       <tr>
         <td>${user.name}</td>
         <td>${user.sex}</td>
         <td>${user.age}</td>
         <td>${user.phone}</td>
         <td><a type="button" class="btn btn-info" href="/findUser?id=${user.id}">编辑</a>
           <a type="button" class="btn btn-danger" href="javascript:deleteUser(${user.id});">删除</a></td>
       </tr>
     </c:forEach>
   </table>
  </div>
</div>
</body>
</html>