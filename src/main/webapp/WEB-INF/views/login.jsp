<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="/css/usersLogin.css">
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>
    <title>前台首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/lib/layui/css/layui.css"  media="all">
    <style>
        .layui-form-radio{
            margin-right: 2px;
        }
    </style>
</head>
<body>
<div class="header"></div>
<div class="body">
    <div class="panel">
        <div class="top">
            <p>账户登录</p>
        </div>
        <div class="middle">
            <form class="layui-form" action="/login" method="post">
                <span class="erro">${msg}</span>
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="a_username" value="zxk"  class="iputs"/>
                <input type="password" name="a_password" value="zxk123" class="iputs"/>
                <input type="radio" name="Identity" value="student" title="学生" checked>
                <input type="radio" name="Identity" value="administrator" title="管理员" >
                <input type="radio" name="Identity" value="teacher" title="辅导员">
                <input type="radio" name="Identity" value="service" title="维修人员">
                <input type="submit" value="登录"/>
            </form>
        </div>
    </div>
</div>
<div class="footer">
    <span>@Copyright © 2019-2020 版权所有 </span>
</div>
<script src="/lib/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
    });
</script>
</body>
</html>
