$(function () {
    var da;
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;

        //宿舍维修管理-数据表格
        table.render({
            elem: '#selectRepairinfo'
            , url: '/selectRepairinfo'
            , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'numbers'}
                , {field: 'stuid', title: '学号', sort: true}
                , {field: 'dormno', title: '宿舍楼'}
                , {field: 'roomno', title: '房间号', sort: true}
                , {field: 'name', title: '名字'}
                , {field: 'servicetype', title: '维修物品类型'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                , {field: 'servicereason', title: '维修物品及原因', sort: true}
                , {field: 'phone', title: '联系方式', sort: true}
                , {field: 'time', title: '报修时间'}
                , {field: 'state', title: '维修状态'}
                , {field: 'right', title: '操作', width: 178, toolbar: '#barDemo'}
            ]]
            , page: true
            , limits: [3, 6, 9]
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            , id: 'testReload' //查询---表格重载时id
        });

        //条件查询
        form.on('submit(search)', function (data) {
            var dd = data;
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('testReload', {
                method: 'get'
                , where: {
                    dormno: data.field['dormno'], // 添加查询的参数
                    state: data.field['state'],
                    pageIndex: data.field['pageIndex'],
                    pageSize: data.field['pageSize']
                }
                , page: {
                    curr: 1 // 重载后从第一页开始
                }
            });
            return false;  // 阻止submit的表单提交
        });

        //动态获取宿舍楼下拉框
        $.ajax({
            url: '/findDormsAll',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                da = data;
                for (var item in data) {
                    /*宿舍维修里面*/
                    $('#dormno').append(new Option(data[item].dormna, data[item].id));// 下拉菜单里添加元素
                    /*物品申领里面*/
                    $('#dormid').append(new Option(data[item].dormna, data[item].id));// 下拉菜单里添加元素
                }
                layui.form.render("select");
            }
        })

        //学生请假情况-监听工具条
        table.on('tool(selectRepairinfo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'update_agree') {
                if (data.state == "已完成") {
                    layer.alert('已经维修完毕，不需要再次接受！')
                } else {
                    layer.confirm('确定接受学生 ' + data.name + ' 的维修申请吗？', function (index) {
                        //obj.del();
                        var stuid = data['stuid'];
                        $.ajax({
                            type: 'POST',
                            url: '/updateAgree',
                            data: {
                                "stuid": stuid
                            },
                            dataType: "json",
                            success: function (data) {
                                layer.msg(data.msg, {icon: 1, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/service';
                                }, 2000);

                            },
                            error: function () {
                                layer.msg(data.msg, {icon: 0, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/service';
                                }, 2000);
                            }
                        });
                        layer.close(index);
                    });
                }

            } else if (obj.event === 'update_finish') {
                if (data.state == "已完成") {
                    layer.alert('此信息已完成！')
                } else {
                    layer.confirm('确定完成学生 ' + data.name + ' 的宿舍维修吗？', function (index) {
                        //obj.del();
                        var stuid = data['stuid'];
                        $.ajax({
                            type: 'POST',
                            url: '/updateFinish',
                            data: {
                                "stuid": stuid
                            },
                            dataType: "json",
                            success: function (data) {
                                layer.msg(data.msg, {icon: 1, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/service';
                                }, 2000);

                            },
                            error: function () {
                                layer.msg(data.msg, {icon: 0, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/service';
                                }, 2000);
                            }
                        });
                        layer.close(index);
                    });
                }
            } else if (obj.event === 'update_late') {
                if (data.state == "已完成") {
                    layer.alert('此信息已完成！')
                } else {
                    layer.confirm('确定延迟学生 ' + data.name + ' 的宿舍维修吗？', function (index) {
                        //obj.del();
                        var stuid = data['stuid'];
                        $.ajax({
                            type: 'POST',
                            url: '/updateLate',
                            data: {
                                "stuid": stuid
                            },
                            dataType: "json",
                            success: function (data) {
                                layer.msg(data.msg, {icon: 1, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/service';
                                }, 2000);

                            },
                            error: function () {
                                layer.msg(data.msg, {icon: 0, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/service';
                                }, 2000);
                            }
                        });
                        layer.close(index);
                    });

                }


            }
        });

        //物品提取登记-物品下拉框
        $.ajax({
            url: '/findProductAll',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                for (var item in data) {
                    $('#product').append(new Option(data[item].pname, data[item].pid));// 下拉菜单里添加元素
                }
                layui.form.render("select");
            }
        })


        //物品申领信息
        table.render({
            elem: '#pro_approval'
            , url: '/productApply'
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
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
                , {field: 'oid', title: '清单编号', sort: true}
                , {field: 'otime', title: '时间'}
                , {field: 'state', title: '状态', sort: true}
                , {field: 'suid', title: '工号', sort: true}
                , {field: 'descs', title: '备注'}
                , {field: 'right', title: '操作', toolbar: '#barDemo1'}
            ]]
            , page: false

        });

        //物品申领信息-监听工具条
        table.on('tool(pro_approval)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.confirm('确定拒绝学生 ' + data.name + ' 的假期吗？', function (index) {
                    //obj.del();
                    var stuid = data['stuid'];
                    $.ajax({
                        type: 'POST',
                        url: '/updateRefuse',
                        data: {
                            "stuid": stuid
                        },
                        dataType: "json",
                        success: function (data) {
                            layer.msg(data.msg, {icon: 1, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/teacher';
                            }, 2000);

                        },
                        error: function () {
                            layer.msg(data.msg, {icon: 0, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/teacher';
                            }, 2000);
                        }
                    });
                    layer.close(index);
                });
            } else if (obj.event === 'del') {
                layer.confirm('确定删除该数据?', function (index) {
                    //obj.del();
                    var s_id = data['s_id'];
                    $.ajax({
                        type: 'POST',
                        url: '/deleteOrderitem',
                        data: {
                            s_id: s_id
                        },
                        dataType: "json",
                        success: function (data) {
                            layer.msg(data.msg, {icon: 1, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findStudent';
                            }, 2000);

                        },
                        error: function () {
                            layer.msg(data.msg, {icon: 0, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findStudent';
                            }, 2000);
                        }
                    });
                    layer.close(index);
                });


            }
        });
    });
});