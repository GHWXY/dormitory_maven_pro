<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2020/3/20
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生请假情况</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>
    <script type="text/javascript" src="./js/adminSelectLeave.js"></script>

    <style type="text/css">
        .layui-table {
            text-align: center;
        }

        .layui-table th {
            text-align: center;
        }
    </style>
</head>
<body>
<%--头部面包屑--%>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/selectLeave">学生请假情况</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/selectLeave"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="x-body">
    <%--搜索框--%>
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/selectLeave">
            <input type="text" class="layui-input" placeholder="请输入学号" name="stuid" id="stuid">
            <input type="text" class="layui-input" placeholder="请输入姓名" name="name" id="name">
            <div class="layui-input-inline">
                <select class="layui-input-inline" name="state" id="state">
                    <option value="">请选择信息状态...</option>
                    <option value="待审批">待审批</option>
                    <option value="已批准">已批准</option>
                    <option value="已拒绝">已拒绝</option>
                    <option value="已结束">已结束</option>
                </select>
            </div>
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="6">
            <button class="layui-btn" lay-submit lay-filter="leavesreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <%--数据表格--%>
    <table class="layui-hide" id="selectleave" lay-filter="selectleave"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>

</body>
</html>
