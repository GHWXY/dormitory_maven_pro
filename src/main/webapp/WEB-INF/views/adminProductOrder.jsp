<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2020/3/20
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>物品清单信息管理</title>
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
    <script type="text/javascript" src="./js/adminProductOrder.js"></script>

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
        <a href="/findProduct_list">物品清单信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findProduct_list"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="x-body">
    <%--搜索框--%>
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findProduct_list">
            <input class="layui-input" placeholder="请输入清单编号" name="oid">
            <input class="layui-input" placeholder="请输入申请人工号" name="suid">
            <div class="layui-input-inline">
                <select class="layui-input-inline" name="state" id="state">
                    <option value="">请选择状态...</option>
                    <option value="未接受">未接受</option>
                    <option value="已接受">已接受</option>
                    <option value="已领取">已领取</option>
                    <option value="已延时">已延时</option>
                </select>
            </div>
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="6">
            <button class="layui-btn" lay-submit="" lay-filter="plistsreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%--数据表格--%>
    <table class="layui-hide" id="productorder" lay-filter="productorder"></table>
    <%--数据表格操作列按钮--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</div>

</body>
</html>
