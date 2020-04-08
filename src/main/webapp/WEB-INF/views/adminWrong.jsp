<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2020/3/14
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>违规学生信息</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>
    <script type="text/javascript" src="/js/adminWrong.js"></script>
    <style type="text/css">
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/adminWrong">违规学生信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/adminWrong" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div>
    <div style="text-align: center">
        <h1>学生违规信息表</h1>
    </div>
    <!-- 蓝色分割线-->
    <hr class="layui-bg-blue" style="width: 70%;margin: 0 auto;margin-top: 10px">
    <div style="width: 50%;margin: 0 auto;margin-top: 20px">
        <form class="layui-form" id="addWrongmsg">
            <div class="layui-form-item">
                <label class="layui-form-label">学号：</label>
                <div class="layui-input-block">
                    <input type="text"  name="stuid" id="add_studentid"  required  class="layui-input" placeholder="请输入学号">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">姓名：</label>
                <div class="layui-input-block">
                    <input type="text"  name="stuname" id="add_names"  required class="layui-input" placeholder="请输入姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">违规日期：</label>
                <div class="layui-input-block">
                    <input type="date" name="wrongday" id="add_date" lay-verify="date" placeholder="请输入违规日期" required class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">违规原因：</label>
                <div class="layui-input-block">
                    <textarea name="wrongreason" id="add_wrongreason" placeholder="请输入内容" required class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">处理方式：</label>
                <div class="layui-input-block">
                    <textarea name="result" id="add_result" placeholder="请输入内容" required class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" lay-submit lay-filter="addWrongmsg_btn" >提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
