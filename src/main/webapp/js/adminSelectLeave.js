$(function () {
    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        table.render({
            elem: '#selectleave'
            ,url:'/selectLeaveinfo'
            //,toolbar: true //开启头部工具栏，并为其绑定左侧模板
            ,title: '学生请假情况'
            ,totalRow: true
            ,cols: [[
                {type:'numbers'}
                ,{field:'stuid', title:'学号', sort: true}
                ,{field:'name', title:'姓名',  edit: 'text',sort: true}
                ,{field:'firsttime', title:'请假开始时间', edit: 'text',sort: true}
                ,{field:'lasttime', title:'请假结束时间', edit: 'text',sort: true}
                ,{field:'leavereason', title:'请假事由',  sort: true}
                ,{field:'address', title:'请假去向',  sort: true}
                ,{field:'studentphone', title:'学生联系方式',  sort: true}
                ,{field:'parentsphone', title:'家长联系方式',  sort: true}
                ,{field:'state', title:'状态',  sort: true}
                ,{field:'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: true
            , limits: [3, 6, 9]
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
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
        form.on('submit(leavesreach)', function (data) {
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('testReload', {
                method: 'get'
                , where: {
                    stuid: data.field['stuid'], // 添加查询的参数
                    name: data.field['name'],
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

        //学生请假情况-监听工具条
        table.on('tool(selectleave)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                if (data.state == "已结束"){
                    layer.confirm('确定删除学生 '+data.name+' 的假期吗？', function (index) {
                        //obj.del();
                        var stuid = data['stuid'];
                        $.ajax({
                            type: 'POST',
                            url: '/deleteLeavemsg',
                            data: {
                                "stuid": stuid
                            },
                            dataType: "json",
                            success: function (data) {
                                layer.msg(data.msg,{icon: 1,time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/selectLeave';
                                }, 2000);

                            },
                            error: function () {
                                layer.msg(data.msg,{icon: 0, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/selectLeave';
                                }, 2000);
                            }
                        });
                        layer.close(index);
                    });

                }else{
                    layer.alert('学生 '+data.name+' 的还未结束不能删除！ ')
                }
            }
        });

    });
});