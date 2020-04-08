<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/7
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码成功</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/studentpass.js"></script>
    <style>
        #top2
        {
            width:700px;
            margin: 0 auto;
            margin-top: 50px;
        }
        #text{
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">学生宿舍管理系统</a></div>
    <ul class="layui-nav left" style="line-height: 45px">
        <li>欢迎您，同学！</li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item to-index">
            <a href="/student_manager">返回首页</a>
        </li>
        <li class="layui-nav-item to-index"><a href="/loginOut">退出登录</a></li>
    </ul>
</div>
<!-- 中部开始 -->
<div id="top2">
    <img src="/images/pass2.jpg" />
    <img src="/images/ok.jpg" />
    <img src="/images/pass3.jpg" />
    <img src="/images/ok.jpg" />
    <img src="/images/pass4.jpg" />
</div>
<div id="text">
    <h2>修改成功！</h2>
</div>
</body>
</html>
