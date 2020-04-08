$(function () {
    layui.use(['form', 'layedit', 'laydate', 'layer'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
            , type: 'datetime'
        });
        laydate.render({
            elem: '#date2'
            , type: 'datetime'
        });
        //日期时间范围
        /*laydate.render({
            elem: '#test10'
            ,type: 'datetime'
            ,range: true
        });*/
        /*添加宿舍保修*/
        //监听提交
        /*form.on('submit(addService)', function(data){
            //layer.msg(JSON.stringify(data.field));
            /!*var stuid = $("#xuehao").val();
            var dormno = $("#dormna").text();
            var roomno = $("#roomno").text();
            var servicetype = $("#thing").val();
            var servicereason = $("#servicereason").val();
            var name = $("#sname").val();
            var phone = $("#sphone").val();
            var state = "待维修";*!/
            var item = data.field;
            $.ajax({
                type: 'post',
                url: '/serviceInsert',
                data:JSON.stringify(item),   /!*此处不转 提交失败*!/
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                success:function(data){
                    layer.msg(data.msg, {icon: 1, time: 3000});
                    /!*setTimeout(function () {window.location.href='/adminWrong';},2000);*!/

                },
                error:function(){
                    layer.msg(data.msg,{icon:0,time:3000});
                    /!*setTimeout(function () {window.location.href='/adminWrong';},2000);*!/
                }
            });
            return false;
        });*/

        //请假申请
        /*form.on('submit(addSelectLeave)',function (data) {
            var param = data.field;
            //var item = $(data.form).serialize();
            $.ajax({
                type: 'post',
                url: '/selectLeaveInsert',
                data:JSON.stringify(param),   /!*此处不转 提交失败*!/
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                success:function(data){
                    layer.msg(data.msg, {icon: 1, time: 3000});
                    /!*setTimeout(function () {window.location.href='/adminWrong';},2000);*!/

                },
                error:function(){
                    layer.msg(data.msg,{icon:0,time:3000});
                    /!*setTimeout(function () {window.location.href='/adminWrong';},2000);*!/
                }
            });
            return false;
        });*/
    });

    //修改电话号码
    changePhone = function () {
        var x = prompt("输入新的电话号码: ", ""); //弹出一个输入电话对话框
        if (x == "") {
            alert("请输入电话号码！");
            return;
        }
        if (!(isNaN(x) || x.length != 11)) {
            if (confirm("你确定修改为 " + x + " 吗？")) {
                $.ajax({
                    type: "POST",
                    async: false,  // 设置同步方式
                    cache: false,
                    url: "changePhone",
                    data: {
                        "phone": x,
                        "stuid": $("#stuid").text()

                    },
                    success: function () {
                        alert("手机号码修改成功");
                        window.location.reload(true);//强制刷新页面，从服务器端刷新数据
                    }
                });
            }
        } else {
            alert("您输入的联系电话有误，请输入长度为11的数字号码！");
        }
    };

    //查询请假记录
    selectLrave = function () {
        layui.use(['form', 'layer', 'table'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var stuid = $("#stuid").text();
            //请假记录数据表格
            table.render({
                elem: '#leave_record'
                , url: '/leaverecord?stuid=' + stuid
                , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , title: '请假记录表'
                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                    return {
                        "code": res.code, //解析接口状态
                        "msg": res.msg, //解析提示文本
                        "count": res.count, //解析数据长度
                        "data": res.data //解析数据列表
                    };
                }
                , cols: [[
                    {type: 'numbers'}
                    , {field: 'name', title: '请假人'}
                    , {field: 'firsttime', title: '请假开始时间', width: 135, sort: true}
                    , {field: 'lasttime', title: '请假结束时间', width: 135, sort: true}
                    , {field: 'address', title: '请假去向',}
                    , {field: 'leavereason', title: '请假理由'}
                    , {field: 'state', title: '状态'}
                    , {fixed: 'right', title: '操作', toolbar: '#bar_lr'}
                ]]
                , page: true
                , limits: [3, 6, 9]
            });
            //监听表格复选框选择
            table.on('tool(leave_record)', function (obj) {
                var data = obj.data;
                var firsttime = data['firsttime'].split("-");
                var lasttime = data['lasttime'].split("-");
                var ft = new Date(firsttime[0], firsttime[1], firsttime[2]);
                var lt = new Date(lasttime[0], lasttime[1], lasttime[2]);
                var result = (lt - ft) / (24 * 60 * 60 * 1000);  //假期剩余天数
                var a;
                if (result > 0) {
                    a = "假期还有" + result + "天，您确定要结束假期吗？";
                } else {
                    a = "您确定要结束假期吗？";
                }
                if (obj.event === 'leave_over') {
                    if (data.state == "未审批" || data.state == "已拒绝") {
                        layer.msg('此假期未被批准！');
                    } else {
                        layer.confirm(a, function () {
                            var stuid = data['stuid'];
                            $.ajax({
                                type: 'POST',
                                url: '/updateOver',
                                data: {
                                    "stuid": stuid
                                },
                                dataType: "json",
                                success: function (data) {
                                    layer.msg(data.msg, {icon: 1, time: 3000});
                                    setTimeout(function () {
                                        window.location.href = '/student';
                                    }, 2000);

                                },
                                error: function () {
                                    layer.msg(data.msg, {icon: 0, time: 3000});
                                    setTimeout(function () {
                                        window.location.href = '/student';
                                    }, 2000);
                                }
                            });
                            layer.close(index);

                        });
                    }

                } else if (obj.event === 'leave_del') {
                    if (data.state == "已批准") {
                        layer.msg('此假期已被批准，不能删除！');
                    } else {
                        layer.confirm('您确定删除该假期吗？', function (index) {
                            var stuid = data['stuid'];
                            $.ajax({
                                type: 'POST',
                                url: '/stuLeaveDel',
                                data: {
                                    "stuid": stuid
                                },
                                dataType: "json",
                                success: function (data) {
                                    layer.msg(data.msg, {icon: 1, time: 3000});
                                    setTimeout(function () {
                                        window.location.href = '/student';
                                    }, 2000);

                                },
                                error: function () {
                                    layer.msg(data.msg, {icon: 0, time: 3000});
                                    setTimeout(function () {
                                        window.location.href = '/student';
                                    }, 2000);
                                }
                            });
                            layer.close(index);
                        });
                    }


                }

            });
            //请假记录弹出层
            layer.open({
                type: 1,
                title: "请假记录",
                skin: "myclass",
                area: ["60%", '50%'],
                anim: 0, //弹出动画
                closeBtn: 2,//两种风格的关闭按钮(1,2)
                fixed: true,//鼠标滚动时，层是否固定在可视区域
                content: $('#lr'),
                btn: '关闭',
                btnAlign: 'r',//按钮居中
                shade: 0,//不显示遮罩
                cancel: function (index, layero) {
                    $("#lr").hide();
                },
                yes: function () {
                    $("#lr").hide();
                    layer.closeAll();
                }

            });


        })

    }

    //查询违规记录
    selectWrong = function () {
        layui.use(['form', 'layer', 'table'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var stuid = $("#stuid").text();
            //请假记录弹出层
            layer.open({
                type: 1,
                title: "违规记录",
                skin: "myclass",
                area: ["50%", '50%'],
                anim: 0, //弹出动画
                closeBtn: 2,//两种风格的关闭按钮(1,2)
                fixed: true,//鼠标滚动时，层是否固定在可视区域
                content: $('#vr'),
                btn: '关闭',
                btnAlign: 'r',//按钮居中
                shade: 0,//不显示遮罩
                cancel: function (index, layero) {
                    $("#vr").hide();
                },
                yes: function () {
                    $("#vr").hide();
                    layer.closeAll();
                }

            });
            //违规记录数据表格
            table.render({
                elem: '#violation_record'
                , url: '/violationrecord?stuid=' + stuid
                , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , title: '违规记录表'
                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                    return {
                        "code": res.code, //解析接口状态
                        "msg": res.msg, //解析提示文本
                        "count": res.count, //解析数据长度
                        "data": res.data //解析数据列表
                    };
                }
                , cols: [[
                    {type: 'numbers'}
                    , {field: 'wrongday', title: '违纪日期',} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    , {field: 'wrongreason', title: '违纪原因', sort: true}
                    , {field: 'result', title: '处理方式', sort: true}
                ]]
                , page: true
                , limits: [3, 6, 9]
            });


        });

    }

    //查询保修信息
    selectService = function () {
        layui.use(['form', 'layer', 'table'], function () {
            var table = layui.table;
            var layer = layui.layer;
            var stuid = $("#stuid").text();
            //保修信息弹出层
            layer.open({
                type: 1,
                title: "保修信息",
                skin: "myclass",
                area: ["60%", '50%'],
                anim: 0, //弹出动画
                closeBtn: 2,//两种风格的关闭按钮(1,2)
                fixed: true,//鼠标滚动时，层是否固定在可视区域
                content: $('#wr'),
                btn: '关闭',
                btnAlign: 'r',//按钮居中
                shade: 0,//不显示遮罩
                cancel: function (index, layero) {
                    $("#wr").hide();
                },
                yes: function () {
                    $("#wr").hide();
                    layer.closeAll();
                }

            });
            //保修信息数据表格
            table.render({
                elem: '#warranty_record'
                , url: '/warrantyrecord?stuid=' + stuid
                , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , title: '保修信息表'
                , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                    return {
                        "code": res.code, //解析接口状态
                        "msg": res.msg, //解析提示文本
                        "count": res.count, //解析数据长度
                        "data": res.data //解析数据列表
                    };
                }
                , cols: [[
                    {type: 'numbers'}
                    , {field: 'stuid', title: '学号',width: 120, sort: true}
                    , {field: 'dormno', title: '宿舍楼'}
                    , {field: 'roomno', title: '房间号'}
                    , {field: 'name', title: '名字'}
                    , {field: 'servicetype', title: '维修物品类型', width: 140}
                    , {field: 'servicereason', title: '维修物品及原因', width: 140}
                    , {field: 'phone', title: '联系方式', width: 100}
                    , {field: 'time', title: '报修时间', width: 100}
                    , {field: 'state', title: '维修状态', width: 100}
                    , {field: 'right', title: '操作', toolbar: '#bar_wr'}
                ]]
                , page: true
                , limits: [3, 6, 9]
            });
            //监听表格复选框选择
            table.on('tool(warranty_record)', function (obj) {
                var data = obj.data;
                if (obj.event === 'repair_del') {
                    if (data.state == "维修中") {
                        layer.msg('正在维修中，不能删除！');
                    } else {
                        layer.confirm('您确定删除该信息吗？', function (index) {
                            var stuid = data['stuid'];
                            $.ajax({
                                type: 'POST',
                                url: '/stuRepairDel',
                                data: {
                                    "stuid": stuid
                                },
                                dataType: "json",
                                success: function (data) {
                                    layer.msg(data.msg, {icon: 1, time: 3000});
                                    setTimeout(function () {
                                        window.location.href = '/student';
                                    }, 2000);

                                },
                                error: function () {
                                    layer.msg(data.msg, {icon: 0, time: 3000});
                                    setTimeout(function () {
                                        window.location.href = '/student';
                                    }, 2000);
                                }
                            });
                            layer.close(index);
                        });
                    }
                }
            });


        });
    }
});
