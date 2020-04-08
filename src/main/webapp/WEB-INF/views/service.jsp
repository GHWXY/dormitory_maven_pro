<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/8
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>维修人员登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/service.js"></script>
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
            <a href="javascript:;"><img src="images/user.jpg" class="layui-nav-img">${sessionScope.sel.username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('切换帐号','loginOut')">切换帐号</a></dd>
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
                <div class="layui-card-header" style="text-align: center">欢迎您， ${sessionScope.sel.username}维修员！</div>
                <div class="layui-card-body">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title"style="text-align: center;">
                            <li class="layui-this">宿舍维修管理</li>
                            <li>物品申领</li>
                            <li>物品申领信息</li>
                        </ul>
                        <div class="layui-tab-content" >
                            <div class="layui-tab-item layui-show">
                                <div class="layui-form">
                                    <form class="layui-form layui-form-pane" action="">
                                        <table class="layui-table">
                                            <thead>
                                            <tr>
                                                <th>条件查询</th>
                                                <th>
                                                    <div class="layui-input-inline" style="width: 100%">
                                                        <select name="dormno" id="dormno" autocomplete="off" class="layui-input">
                                                            <option value="">请选择宿舍楼...</option>
                                                        </select>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="layui-input-inline"style="width: 100%">
                                                        <select name="state" id="state" autocomplete="off" class="layui-input">
                                                            <option value="">请选择维修状态...</option>
                                                            <option value="待维修">待维修</option>
                                                            <option value="维修中">维修中</option>
                                                            <option value="已完成">已完成</option>
                                                            <option value="无库存">无库存</option>
                                                        </select>
                                                    </div>
                                                </th>
                                                <input class="layui-input" type="hidden" name="pageIndex" value="1">
                                                <input class="layui-input" type="hidden" name="pageSize" value="6">
                                                <th>
                                                    <button class="layui-btn layui-btn-radius" id="search" lay-submit lay-filter="search" style="width: 50%">查询</button>
                                                </th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </form>
                                </div>
                                <table class="layui-hide" id="selectRepairinfo" lay-filter="selectRepairinfo"></table>
                                <script type="text/html" id="barDemo">
                                    <a class="layui-btn layui-btn-xs" lay-event="update_agree">接受</a>
                                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="update_finish">完成</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update_late">延迟</a>
                                </script>
                            </div>
                            <div class="layui-tab-item">
                                <fieldset class="layui-elem-field" style="text-align: center;margin-top: 15px">
                                    <legend><h2>物品提取登记</h2></legend>
                                    <div class="layui-field-box">
                                        <form class="layui-form layui-form-pane" action="">
                                            <table class="layui-table" lay-size="lg" style="width: 50%;margin: 0 auto;margin-top: 10px;margin-bottom: 10px">
                                                <tbody>
                                                <tr>
                                                    <td>物品</td>
                                                    <td>
                                                        <div class="layui-input-inline"  style="width: 100%">
                                                            <select name="pname" id="product">
                                                                <option value="">请选择物品...</option>
                                                                <%--<option value="灯泡" selected="">灯泡</option>
                                                                <option value="水龙头">水龙头</option>
                                                                <option value="凳子">凳子</option>
                                                                <option value="门锁" selected="">门锁</option>
                                                                <option value="窗帘">窗帘</option>
                                                                <option value="风扇">风扇</option>
                                                                <option value="灯管">灯管</option>
                                                                <option value="电胶布">电胶布</option>--%>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>数量</td>
                                                    <td>
                                                        <div class="layui-input-inline" style="width: 100%">
                                                            <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>申请人</td>
                                                    <td>
                                                        <div class="layui-input-inline" style="width: 100%">
                                                            <input type="text" name="username" value="${sessionScope.sel.username}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>用于宿舍</td>
                                                    <td>
                                                        <div class="layui-input-inline"  style="width: 100%">
                                                            <select name="dormid" id="dormid">
                                                                <option value="">请选择宿舍</option>
                                                                <%--<option value="1号楼" selected="">1号楼</option>
                                                                <option value="2号楼" selected="">2号楼</option>
                                                                <option value="3号楼" selected="">3号楼</option>
                                                                <option value="4号楼" selected="">4号楼</option>
                                                                <option value="5号楼" selected="">5号楼</option>--%>
                                                            </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <button type="button" class="layui-btn layui-btn-lg layui-btn-radius" style="width: 60%;margin-left: 100px">提交</button>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </form>

                                    </div>
                                </fieldset>
                            </div>
                            <div class="layui-tab-item"style="text-align: center;">
                                <h2>物品申领信息</h2>
                                <hr class="layui-bg-blue">
                                <table class="layui-hide" id="pro_approval" lay-filter="pro_approval"></table>
                                <script type="text/html" id="barDemo1">
                                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                                </script>
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
