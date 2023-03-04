<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>图书管理系统</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="webjars/jquery/3.1.1/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        <!-- 在页面加载完成后加载表单检验函数，判断表单内容是否符合设计规范   -->
        window.onload=function (){
            document.getElementById("form").onsubmit=function (){
                return checkBookname()&&checkBookauthor()&&checkBookpublishdate()&&checkBookISBN();
            }
        }
        function checkBookname(){
            var bookname = document.getElementById("name").value;
            var reg_bookname= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
            var flag=reg_bookname.test(bookname);
            var s_bookname=document.getElementById("s_bookname");
            if(flag){
                s_bookname.innerHTML=""
            }else{
                s_bookname.innerHTML="书名不能为空"
            }
            return flag;
        }
        function checkBookauthor(){
            var author = document.getElementById("author").value;
            var reg_author= /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
            var flag=reg_author.test(author);
            var s_author=document.getElementById("s_author");
            if(flag){
                s_author.innerHTML=""
            }else{
                s_author.innerHTML="作者名称不能为空"
            }
            return flag;
        }
        function checkBookpublishdate(){
            var publishdate = document.getElementById("publishdate").value;
            var reg_publishdate=/^[\u4e00-\u9fa5_a-zA-Z0-9]+$/
            var flag=reg_publishdate.test(publishdate);
            var s_publishdate=document.getElementById("s_publishdate");
            if(flag){
                s_publishdate.innerHTML="";
            }else{
                s_publishdate.innerHTML="出版日期不能为空";
            }
            return flag;
        }
        function checkBookISBN(){
            var ISBN=document.getElementById("ISBN").value;
            var reg_ISBN=/^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/;
            var flag=reg_ISBN.test(ISBN);
            var s_ISBN=document.getElementById("s_ISBN");
            if(flag){
                s_ISBN.innerHTML="";
            }else{
                s_ISBN.innerHTML="ISBN不能为空或格式错误";
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
        <form action="UpdateBook" id="form" method="post" accept-charset="utf-8">
            <div class="form-group">
<%--回显信息--%>
                <!-- 隐藏域提交id -->
                <input type="hidden" name="id" value="${book.id}">
                <div align="center" style="font-size:24px">编辑图书信息</div>
                <input class="form-control" type="text" value="${book.name}" placeholder="请输入书名" id="name" name="name">
                <span id="s_bookname" class="has-error" style="color: red"></span>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" value="${book.author}"placeholder="请输入作者" id="author" name="author">
                <span id="s_author" class="has-error" style="color: red"></span>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" value="${book.publishdate}"placeholder="请输入出版日期" id="publishdate" name="publishdate">
                <span id="s_publishdate" class="has-error"style="color: red"></span>
            </div>
            <div class="form-group">
                <input class="form-control" type="text" value="${book.ISBN}"placeholder="请输入ISBN编码" id="ISBN" name="ISBN">
                <span id="s_ISBN" class="has-error"style="color: red"></span>
            </div>
            <div align="center"><button  id="btn_sub" type="submit" class="btn btn-group" style="font-size:20px;" >提交</button>
            <a href="bookInfo.html"><button type="button" class="btn btn-info" style="font-size:20px;">返回</button></a>
            </div>
        </form>
    </div>
</div>
</body>
</html>