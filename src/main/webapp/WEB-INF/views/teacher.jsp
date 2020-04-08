<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/8
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>辅导员登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/teacher.js"></script>
    <style>
        .layui-tab-title{
            text-align: center;
        }
        .layui-tab-title li{
            width: 30%;
        }
        #tr_height tr{
            height: 65px;
        }
        a:hover{
            color: dodgerblue;
        }
        .layui-input-inline{
            margin-left: 150px;
        }

    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">学生宿舍管理系统</a></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><img src="images/user.jpg" class="layui-nav-img">${sessionScope.tl.username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('切换帐号','loginOut')">切换帐号</a></dd>
                <dd><a onclick="x_admin_show('修改密码','student_pass')">修改密码</a></dd>
                <dd><a href="/loginOut">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="/loginOut">退出登录</a></li>
    </ul>
</div>
<!-- 中上部开始 -->
<div style="padding: 20px; background-color: #F2F2F2;height: 87%">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="text-align: center">欢迎您， ${sessionScope.tl.username}辅导员！</div>
                <div class="layui-card-body">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title"style="text-align: center;">
                            <li class="layui-this">学生信息</li>
                            <li>请假情况信息管理</li>
                            <li>违纪信息查询</li>
                        </ul>
                        <div class="layui-tab-content" >
                            <div class="layui-tab-item layui-show">
                                <div class="layui-form">
                                    <form class="layui-form layui-form-pane" id="form_search" action="">
                                        <table class="layui-table">
                                            <colgroup>
                                                <col width="80">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>条件查询</th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="s_name" id="s_name"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="s_studentid" id="s_studentid"  placeholder="请输入学号" autocomplete="off" class="layui-input">
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="s_classid" id="s_classid"  placeholder="请输入班级编号" autocomplete="off" class="layui-input">
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="s_classname" id="s_classname"  placeholder="请输入班级名" autocomplete="off" class="layui-input">
                                                    </div>
                                                </th>
                                                <input class="layui-input" type="hidden" name="pageIndex" value="1">
                                                <input class="layui-input" type="hidden" name="pageSize" value="6">
                                                <th>
                                                    <button class="layui-btn layui-btn-radius" id="search" lay-submit lay-filter="search">查询</button>
                                                    <button class="layui-btn layui-btn-radius layui-btn-normal">导出</button>
                                                </th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </form>
                                </div>
                                <table class="layui-hide" id="stuinfo"></table>
                            </div>
                            <div class="layui-tab-item">
                                <div class="layui-form">
                                    <form class="layui-form layui-form-pane" action="">
                                        <table class="layui-table">
                                            <colgroup>
                                                <col width="80">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>条件查询</th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="stuid"  placeholder="请输入学号" autocomplete="off" class="layui-input">
                                                    </div>
                                                </th>
                                                <%--<th>
                                                    <div class="layui-input-inline">
                                                        <select name="major" id="major"  placeholder="请选择专业" autocomplete="off" class="layui-input">
                                                            <option value="">请选择专业</option>
                                                        </select>
                                                    </div>

                                                </th>--%>
                                                <%--<th>
                                                    <div class="layui-input-inline">
                                                        <select name="grade" id="grade"  placeholder="请选择班级" autocomplete="off" class="layui-input">
                                                            <option value="">请选择班级...</option>
                                                        </select>
                                                    </div>
                                                </th>--%>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <select name="state" id="state"  placeholder="请选择信息状态" autocomplete="off" class="layui-input">
                                                            <option value="">请选择信息状态...</option>
                                                            <option value="待审批">待审批</option>
                                                            <option value="已批准">已批准</option>
                                                            <option value="已结束">已结束</option>
                                                            <option value="已拒绝">已拒绝</option>
                                                        </select>
                                                    </div>
                                                </th>
                                                <th>
                                                    <button class="layui-btn layui-btn-radius" id="leavesearch" lay-submit lay-filter="leavesearch">查询</button>
                                                    <button class="layui-btn layui-btn-radius layui-btn-normal">导出</button>
                                                </th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </form>
                                </div>
                                <table class="layui-hide" id="leaveinfo" lay-filter="leaveinfo"></table>
                                <script type="text/html" id="barDemo">
                                    <a class="layui-btn layui-btn-xs" lay-event="update_approval">批准</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update_refuse">拒绝</a>
                                </script>
                            </div>
                            <div class="layui-tab-item">
                                <div class="layui-form">
                                    <form class="layui-form layui-form-pane" action="">
                                        <table class="layui-table">
                                            <colgroup>
                                                <col width="80">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                                <col width="150">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th>条件查询</th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="stuid"  placeholder="请输入学号" autocomplete="off" class="layui-input">
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="layui-input-inline">
                                                        <input type="text" name="stuname"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                                                    </div>

                                                </th>
                                                <%--<th>
                                                    <div class="layui-input-inline">
                                                        <select name="grade" id="grade3"  placeholder="请输入名字" autocomplete="off" class="layui-input"></select>
                                                    </div>
                                                </th>--%>
                                                <th>
                                                    <button class="layui-btn layui-btn-radius" id="wrongsearch" lay-submit lay-filter="wrongsearch">查询</button>
                                                    <button class="layui-btn layui-btn-radius layui-btn-normal">导出</button>
                                                </th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </form>
                                </div>
                                <table class="layui-hide" id="wronginfo"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
