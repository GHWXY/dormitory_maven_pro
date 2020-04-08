<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2020/3/19
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>物品信息</title>
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
    <script type="text/javascript" src="./js/adminProduct.js"></script>

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
        <a href="/findProduct">物品信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findProduct"
       title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="x-body">
    <%--搜索框--%>
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findProduct">
            <input class="layui-input" placeholder="请输入物品名称" name="pname" id="pname">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="6">
            <button class="layui-btn" lay-submit lay-filter="psreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <%--按钮--%>
    <xblock>
        <button id="addProductBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加物品</button>
        <button id="extractProductBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>提取物品
        </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit="">
            <i class="layui-icon">&#xe67d;</i>导出
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${di.totalCount} 条</span>
    </xblock>
    <%--数据表格--%>
    <table class="layui-hide" id="product" lay-filter="product"></table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <%--物品信息录入模态框--%>
    <div class="layui-row" id="addProduct" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addProductForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">物品：</label>
                    <div class="layui-input-block">
                        <select type="text" name="s_dormitoryid" class="layui-input" placeholder="请输入宿舍编号"></select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">价格：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_dormbuilding" class="layui-input" placeholder="请输入价格">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">数量：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_bedtotal" class="layui-input" placeholder="请输入数量">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--物品提取登记模态框--%>
    <div class="layui-row" id="extractProduct" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="extractProductForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">物品：</label>
                    <div class="layui-input-block">
                        <select type="text" name="s_dormitoryid" class="layui-input" placeholder="请选择物品"></select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">数量：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_dormbuilding" class="layui-input" placeholder="请输入数量">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">申请人：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_bedtotal" class="layui-input" placeholder="请输入工号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用于宿舍：</label>
                    <div class="layui-input-block">
                        <select type="text" name="s_dormitoryid" class="layui-input" placeholder="请选择宿舍"></select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>


</body>
</html>
