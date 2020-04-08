<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itlike.domain.Dormitory" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>
    <script type="text/javascript" src="./js/dormitory_list.js"></script>

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
        <a href="/findDormitory">宿舍信息</a>

      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findDormitory" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findDormitory" >
            <input class="layui-input" placeholder="请输入宿舍编号" name="s_dormitoryid" id="s_dormitoryid">
            <input class="layui-input" placeholder="请输入宿舍楼" name="d_dormbuilding" id="d_dormbuilding">
            <input class="layui-input" placeholder="请输入管理员姓名" name="a_name" id="a_name">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addStudnetBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${di.totalCount} 条</span>
    </xblock>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_dormitoryid" class="layui-input" placeholder="请输入宿舍编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍楼：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_dormbuilding" class="layui-input" placeholder="请输入宿舍楼">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">床位总数：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_bedtotal" class="layui-input" placeholder="请输入床位总数">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">已用床位：</label>
                    <div class="layui-input-block">
                        <input type="text" name="d_bed" class="layui-input" placeholder="请输入已用床位">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">管理员：</label>
                    <div class="layui-input-block">
                        <input type="text" name="a_name" class="layui-input" placeholder="请输入管理员姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>宿舍编号</th>
            <th>宿舍楼</th>
            <th>床位总数</th>
            <th>已用床位</th>
            <th>管理员</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${di.list}" var="di">
        <tr>
            <%--<td>--%>
                <%--<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>--%>
            <%--</td>--%>
            <td>${di.d_id}</td>
            <td>${di.s_dormitoryid}</td>
            <td>${di.d_dormbuilding}</td>
            <td>${di.d_bedtotal}</td>
            <td>${di.d_bed}</td>
            <td>${di.a_name}</td>
            <td>
                <a title="编辑"    id= "updateEdit"    href="/findDormitoryById?d_id=${di.d_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${di.d_id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>

<div class="" >
    <input type="hidden" id="totalPageCount" value="${di.pageTotalCount}"/>
    <c:import url="pageBtn.jsp">
        <c:param name="totalCount" value="${di.totalCount}"/>
        <c:param name="currentPageNo" value="${di.pageIndex}"/>
        <c:param name="totalPageCount" value="${di.pageTotalCount}"/>
    </c:import>
</div>

</body>


</html>
