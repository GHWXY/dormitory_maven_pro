$(function () {
    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var form = layui.form;


        table.render({
            elem: '#productorder'
            ,url:'/productorder'
            //,toolbar: true //开启头部工具栏，并为其绑定左侧模板
            ,title: '物品清单信息'
            ,totalRow: true
            ,cols: [[
                {type:'numbers'}
                ,{field:'oid', title:'清单编号', sort: true}
                ,{field:'suid', title:'申请人工号',  sort: true}
                ,{field:'otime', title:'时间', sort: true}
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
        form.on('submit(plistsreach)', function (data) {
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('testReload', {
                method: 'get'
                , where: {
                    oid: data.field['oid'], // 添加查询的参数
                    suid: data.field['suid'], // 添加查询的参数
                    state: data.field['state'], // 添加查询的参数
                    pageIndex: data.field['pageIndex'],
                    pageSize: data.field['pageSize']
                }
                , page: {
                    curr: 1 // 重载后从第一页开始
                }
            });
            return false;  // 阻止submit的表单提交
        });

        //物品清单信息-监听工具条
        table.on('tool(productorder)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('确定删除物品清单编号：  ' + data.oid + ' 的信息吗？', function (index) {
                    //obj.del();
                    var oid = data['oid'];
                    $.ajax({
                        type: 'POST',
                        url: '/deleteProducrListinfo',
                        data: {
                            "oid": oid
                        },
                        dataType: "json",
                        success: function (data) {
                            layer.msg(data.msg, {icon: 1, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findProduct_list';
                            }, 2000);

                        },
                        error: function () {
                            layer.msg(data.msg, {icon: 0, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findProduct_list';
                            }, 2000);
                        }
                    });
                    layer.close(index);
                });
            }else if (obj.event === 'detail'){
                layer.alert('暂未开通')
            }

        });

    });
});