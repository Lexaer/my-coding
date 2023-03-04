<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>登录</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script>
    <%--在页面加载完成后载入查询框表单检验函数    --%>
    window.addEventListener("load",forsubmit,false);
    function forsubmit(){
      document.getElementById("form").onsubmit=function (){
        var msg=document.getElementById("msg").innerHTML;
        if(checkName()&&checkPassword()){
          msg="";
          document.getElementById("msg").innerHTML=msg;
          return true;
        }else{
          msg="账号或密码格式有误！";
          document.getElementById("msg").innerHTML=msg;
          return false;
        }
      }
    }


    function checkName(){
      var name=document.getElementById("name").value;
      var reg_name=/^[\u4e00-\u9fa5_a-zA-Z0-9]+$/;
      var flag=reg_name.test(name);
      return flag;
    }
    function checkPassword(){
      var password=document.getElementById("password").value;
      var reg_password=/^(?![\da-z]+$)(?![\dA-Z]+$)(?![\d!#$%^&*]+$)(?![a-zA-Z]+$)(?![a-z!*]+$)(?![A-Z!*]+$)[\da-zA-z!*]{8,12}$/
      var flag=reg_password.test(password);
      return flag
    }

  </script>
</head>
<body style="background-color: lightgrey">
<div style="height:100vh">
  <div style="width: 500px;height:400px;background-color: white;border-radius: 10px;margin:150px auto;margin:150px auto;padding: 50px">
    <div style="margin:30px;text-align:center;font-size:30px; font-weight:bold;color: dodgerblue">登录</div>
    <form id="form" method="post" action="Login">
      <input type="text"  class="form-control"  value="${admin.name}" id="name" name="name" placeholder="请输入账号">
      <br>
      <input type="password"class="form-control" value="${admin.password}" id="password" name="password" placeholder="请输入密码,密码包含大小写字母及数字8-12位">
      <br>
      <button type="submit" class="btn btn-info"  style="width:100%" size="medium" id="btn_sub">登录</button>
    </form>
    <br>
<%--查看表单检验失败后或者登录失败后提示的错误信息   --%>
    <span id="msg" class="has-error"style="color: red">${msg}</span>
  </div>


</div>

</body>
</html>