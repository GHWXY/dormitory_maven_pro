<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/1
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/student.js"></script>
    <style>
        .layui-tab-title {
            text-align: center;
        }

        .layui-tab-title li {
            width: 30%;
        }

        #tr_height tr {
            height: 65px;
        }

        a {
            color: dodgerblue;
        }

        .layui-form-label {
            width: 100px;
        }

        .layui-input-block {
            margin-left: 150px;
        }

        .layui-input-inline {
            margin-left: 150px;
        }

        .layui-form-label.layui-required:after {
            content: "*";
            color: red;
            position: absolute;
            top: 5px;
            left: 15px;
        }
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">学生宿舍管理系统</a></div>


    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><img src="images/user.jpg" class="layui-nav-img">${sessionScope.sl.slUsername}</a>
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
                <div class="layui-card-header" style="text-align: center">欢迎您， ${sessionScope.sl.slUsername}同学！</div>
                <div class="layui-card-body">
                    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                        <ul class="layui-tab-title" style="text-align: center;">
                            <li class="layui-this">个人信息</li>
                            <li>宿舍维修</li>
                            <li>请假申请</li>
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <div class="layui-form">
                                    <table class="layui-table" style="width: 80%;margin: 0 auto" id="stu_table">
                                        <colgroup>
                                            <col width="70">
                                            <col width="150">
                                            <col width="70">
                                            <col width="150">
                                            <col width="80">
                                        </colgroup>

                                        <tbody style="text-align: center" id="tr_height">
                                        <tr>
                                            <td>系别</td>
                                            <td>${sessionScope.depaAll.depana}</td>
                                            <td>专业</td>
                                            <td>${sessionScope.majorAll.majorna}</td>
                                            <td style="width: 80px" rowspan="4"><img src="/images/user.jpg"></td>
                                        </tr>
                                        <tr>
                                            <td>学号</td>
                                            <td id="stuid">${sessionScope.stu2.id}</td>
                                            <td>姓名</td>
                                            <td>${sessionScope.stu2.name}</td>
                                        </tr>
                                        <tr>
                                            <td>性别</td>
                                            <td>${sessionScope.stu2.sex}</td>
                                            <td>电话</td>
                                            <td>${sessionScope.stu2.phone}
                                                <a href="javascript:changePhone()">修改</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>所在宿舍</td>
                                            <td>${sessionScope.dormsAll.dormna}</td>
                                            <td>所在房间</td>
                                            <td>${sessionScope.stu2.roomno}</td>
                                        </tr>
                                        <tr>
                                            <td>请假记录</td>
                                            <td colspan="4">
                                                <a href="javascript:selectLrave()">查询我的请假记录</a><%--查询我的请假记录  selectLrave--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>违规记录</td>
                                            <td colspan="4">
                                                <a href="javascript:selectWrong()">查询我的违规记录</a><%--查询我的违规记录 selectWrong --%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>报修信息</td>
                                            <td colspan="4">
                                                <a href="javascript:selectService()">查询我的报修信息</a><%--查询我的报修信息 selectService--%>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <%--查询我的请假记录数据表格--%>
                                    <div id="lr" style="display: none;">
                                        <table class="layui-hide" id="leave_record" lay-filter="leave_record"></table>
                                        <script type="text/html" id="bar_lr">
                                            <a class="layui-btn layui-btn-xs" lay-event="leave_over">结束</a>
                                            <a class="layui-btn layui-btn-danger layui-btn-xs"
                                               lay-event="leave_del">删除</a>
                                        </script>
                                    </div>
                                    <%--查询我的违规记录数据表格--%>
                                    <div id="vr" style="display: none;">
                                        <table class="layui-hide" id="violation_record"
                                               lay-filter="violation_record"></table>
                                    </div>
                                    <%--查询我的报修信息--%>
                                    <div id="wr" style="display: none;">
                                        <table class="layui-hide" id="warranty_record" lay-filter="warranty_record"></table>
                                        <script type="text/html" id="bar_wr">
                                            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="repair_del">删除</a>
                                        </script>
                                    </div>

                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <div style="width: 50%;margin: 0 auto">
                                    <fieldset class="layui-elem-field layui-field-title"
                                              style="margin-top: 20px;text-align: center">
                                        <legend><h1>报修表</h1></legend>
                                    </fieldset>
                                    <form class="layui-form" action="/serviceInsert" method="post">
                                        <input type="hidden" name="stuid" value="${sessionScope.stu2.id}">
                                        <%--<input type="hidden" name="state" value="待维修">--%>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">宿舍号</label>
                                            <div class="layui-input-block">
                                                <span id="dormna">${sessionScope.dormsAll.dormna}</span>
                                                <span id="roomno">${sessionScope.stu2.roomno}</span>
                                                <input type="hidden" name="dormno" value="${sessionScope.dormsAll.id}">
                                                <input type="hidden" name="roomno" value="${sessionScope.stu2.roomno}">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">维修物品类型</label>
                                            <div class="layui-input-block">
                                                <select id="thing" name="servicetype" lay-filter="aihao" required>
                                                    <option value="">请选择...</option>
                                                    <option value="0">公共设施</option>
                                                    <option value="1" selected="">水电设施</option>
                                                    <option value="2">家具设施</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="layui-form-item layui-form-text">
                                            <label class="layui-form-label">维修物品及原因</label>
                                            <div class="layui-input-block">
                                                <textarea cols="47" rows="3" name="servicereason" id="servicereason"
                                                          placeholder="必填，请简要说明损坏情况及其理由。" required
                                                          class="layui-textarea"></textarea>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">报修人</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="name" id="sname"
                                                       value="${sessionScope.sl.slUsername}" lay-verify="title"
                                                       autocomplete="off" placeholder="请输入标题" required
                                                       class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-inline">
                                                <label class="layui-form-label">联系电话</label>
                                                <div class="layui-input-block" style="width: 488px">
                                                    <input type="tel" name="phone" id="sphone"
                                                           value="${sessionScope.stu2.phone}"
                                                           lay-verify="required|phone" autocomplete="off"
                                                           class="layui-input">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <button type="submit" class="layui-btn" lay-submit=""
                                                        lay-filter="addService">立即提交
                                                </button>
                                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="layui-tab-item">
                                <div style="width: 60%;margin: 0 auto">
                                    <fieldset class="layui-elem-field layui-field-title"
                                              style="margin-top: 20px;text-align: center">
                                        <legend><h1>请假申请表</h1></legend>
                                    </fieldset>
                                    <form class="layui-form" action="/selectLeaveInsert" method="post">
                                        <input type="hidden" name="stuid" value="${sessionScope.stu2.id}">
                                        <div class="layui-form-item">
                                            <label class="layui-form-label layui-required">请假时间：</label>
                                            <div class="layui-input-block">
                                                <div style="width: 45%;float: left">
                                                    <input type="text" class="layui-input" name="firsttime" id="date1"
                                                           lay-verify="datetime" placeholder="请假开始时间"
                                                           autocomplete="off">
                                                </div>
                                                <div style="width: 10%;float: left;text-align: center;line-height: 38px">
                                                    至
                                                </div>
                                                <div style="width: 45%;float: right">
                                                    <input type="text" class="layui-input" name="lasttime" id="date2"
                                                           lay-verify="datetime" placeholder="请假结束时间"
                                                           autocomplete="off">
                                                </div>

                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label layui-required">请 假 人：</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="name" value="${sessionScope.sl.slUsername}"
                                                       lay-verify="title" autocomplete="off" placeholder="请输入标题"
                                                       required class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label layui-required">请假理由：</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="leavereason" lay-verify="title"
                                                       autocomplete="off" placeholder="请输入标题" required
                                                       class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label layui-required">请假去向：</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="address" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入标题" required class="layui-input">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-inline">
                                                <label class="layui-form-label layui-required">联系方式：</label>
                                                <div class="layui-input-block" style="width: 615.59px">
                                                    <input type="tel" name="studentphone"
                                                           value="${sessionScope.stu2.phone}"
                                                           lay-verify="required|phone" autocomplete="off"
                                                           class="layui-input">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-inline">
                                                <label class="layui-form-label layui-required">家长联系方式：</label>
                                                <div class="layui-input-block" style="width: 615.59px">
                                                    <input type="tel" name="parentsphone" lay-verify="required|phone"
                                                           autocomplete="off" class="layui-input">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <button type="submit" class="layui-btn" lay-submit=""
                                                        lay-filter="addSelectLeave">立即提交
                                                </button>
                                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

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
