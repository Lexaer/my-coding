<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>图书管理系统</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script>
    <%--在页面加载完成后载入查询框表单检验函数    --%>
    function deleteBook(id){
      if(confirm("你确定删除吗？")){
        location.href="/DeleteBook?id="+id;
      }
    }
    window.addEventListener("load",forsubmit,false);
    function forsubmit(){
      document.getElementById("form").onsubmit=function (){
        var search=document.getElementById("s_search").innerHTML;
        if(checkBookname()||checkAuthorname()){
          search="";
          document.getElementById("s_search").innerHTML=search;
          return true;
        }else{
          search="书名和作者名必须填至少一个！";
          document.getElementById("s_search").innerHTML=search;
          return false;
        }
      }
    }


    function checkBookname(){
      var bookname = document.getElementById("search_name").value;
      var reg_bookname= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
      var flag=reg_bookname.test(bookname);
      return flag;
    }
    function checkAuthorname(){
      var author = document.getElementById("search_author").value;
      var reg_author= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
      var flag=reg_author.test(author);
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
  <div style="flex: 1;background-color: white">
    <div>
      <form class="form-inline" action="/FindSearchBook" method="post" id="form" accept-charset="utf-8" >
        <div class="form-group">
          <input type="text"  class="form-control" id="search_name" name="name" placeholder="请输入书名">
        </div>
        <div class="form-group">
          <input type="text"  class="form-control" id="search_author" name="author" placeholder="请输入作者名">
        </div>
        <button type="submit" class="btn btn-default" id="btn" >查询</button>
        <a href="addbook.html"><button type="button" class="btn btn-info" >添加图书</button></a>
      </form>
      <span id="s_search" class="has-error" style="color: red"></span>
    </div>
    <table class="table table-striped" id="table">
      <tr>
        <td>书名</td>
        <td>作者</td>
        <td>出版日期</td>
        <td>编码</td>
        <td>操作</td>
      </tr>
      <%--得到接口返回的被查询书籍，将书籍信息显示            --%>
      <c:forEach items="${books}" var="book">
        <tr>
          <td>${book.name}</td>
          <td>${book.author}</td>
          <td>${book.publishdate}</td>
          <td>${book.ISBN}</td>
          <td><a type="button" class="btn btn-info" href="/findBook?id=${book.id}">编辑</a>
            <a type="button" class="btn btn-danger" href="javascript:deleteBook(${book.id});">删除</a></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>
</body>
</html>
