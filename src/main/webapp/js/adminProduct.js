$(function () {
    layui.use(['table', 'layer','form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        table.render({
            elem: '#product'
            , url: '/productInfo'
            //,toolbar: true //开启头部工具栏，并为其绑定左侧模板
            , title: '物品信息'
            , totalRow: true
            , cols: [[
                {type: 'numbers'}
                , {field: 'pname', title: '物品名称', sort: true}
                , {field: 'pprice', title: '物品价格',sort: true }
                , {field: 'ptotal', title: '物品库存',sort: true }
                , {field: 'right', title: '操作',toolbar: '#barDemo'}
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
        form.on('submit(psreach)', function (data) {
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('testReload', {
                method: 'get'
                , where: {
                    pname: data.field['pname'], // 添加查询的参数
                    pageIndex: data.field['pageIndex'],
                    pageSize: data.field['pageSize']
                }
                , page: {
                    curr: 1 // 重载后从第一页开始
                }
            });
            return false;  // 阻止submit的表单提交
        });

        //物品信息-监听工具条
        table.on('tool(product)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('确定删除物品 ' + data.pname + ' 的信息吗？', function (index) {
                    //obj.del();
                    var pid = data['pid'];
                    $.ajax({
                        type: 'POST',
                        url: '/deleteProducrinfo',
                        data: {
                            "pid": pid
                        },
                        dataType: "json",
                        success: function (data) {
                            layer.msg(data.msg, {icon: 1, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findProduct';
                            }, 2000);

                        },
                        error: function () {
                            layer.msg(data.msg, {icon: 0, time: 3000});
                            setTimeout(function () {
                                window.location.href = '/findProduct';
                            }, 2000);
                        }
                    });
                    layer.close(index);
                });
            }
        });

        /*物品信息录入弹出框*/
        $("#addProductBtn").click(function () {
            layer.open({
                type: 1,
                title: "物品信息录入",
                skin: "myclass",
                area: ["45%"],
                anim: 2,
                closeBtn: 2,
                content: $("#addProduct").html()
            });
        })

        /*物品提取登记弹出框*/
        $("#extractProductBtn").click(function () {
            layer.open({
                type: 1,
                title: "物品提取登记",
                skin: "myclass",
                area: ["45%"],
                anim: 2,
                closeBtn: 2,
                content: $("#extractProduct").html()
            });
        })
    });

});