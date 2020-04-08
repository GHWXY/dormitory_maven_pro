$(function () {
    layui.use(['table','form','layer' ],function(){
        var table = layui.table;
        var form = layui.form;
        //学生信息
        table.render({
            elem: '#stuinfo'
            ,url:'/studentinfo2'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            //,height: 400
            ,cols: [[
                 {field: 's_studentid', title: '学号'}
                , {field: 's_name', title: '姓名', sort: true}
                , {field: 's_sex', title: '性别'}
                , {field: 's_age', title: '年龄',} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                , {field: 's_phone', title: '电话', sort: true}
                , {field: 's_classid', title: '班级编号', sort: true}
                , {field: 's_classname', title: '班级名'}
                , {field: 's_dormitoryid', title: '寝室编号', sort: true}
            ]]
            , id: 'stu_testReload' //查询---表格重载时id
            ,page: true
            , limits: [3, 6, 9]
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                //alert(res.data);
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
        });

        //学生信息条件查询
        form.on('submit(search)', function (data) {
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('stu_testReload', {
                method: 'get'
                , where: {
                    /*key:{

                    }*/
                    s_name: data.field['s_name'], // 添加查询的参数
                    s_studentid: data.field['s_studentid'],
                    s_classid: data.field['s_classid'],
                    s_classname: data.field['s_classname'],
                    pageIndex: data.field['pageIndex'],
                    pageSize: data.field['pageSize']
                }
                , page: {
                    curr: 1 // 重载后从第一页开始
                }
            });
            return false;  // 阻止submit的表单提交
        });

        //学生请假情况
        table.render({
            elem: '#leaveinfo'
            ,url:'/leaveinfo'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            //,height: 400
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            ,cols: [[
                {type:'numbers'}
                ,{field:'stuid',  title: '学号', sort: true}
                ,{field:'name',  title: '姓名'}
                ,{field:'firsttime',  title: '请假开始时间', sort: true}
                ,{field:'lasttime',  title: '请假结束时间', sort: true}
                ,{field:'leavereason',  title: '请假理由'}
                ,{field:'address', title: '请假去向',  } //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'studentphone', title: '学生联系方式', sort: true}
                ,{field:'parentsphone', title: '家长联系方式', sort: true}
                ,{field:'state', title: '状态'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: true
            , limits: [3, 6, 9]
            , id: 'stuleave_testReload' //查询---表格重载时id

        });

        //条件查询
        form.on('submit(leavesearch)', function (data) {
            var dd = data;
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('stuleave_testReload', {
                method: 'get'
                , where: {
                    stuid: data.field['stuid'], // 添加查询的参数
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
        table.on('tool(leaveinfo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'update_refuse') {
                if (data.state == "已结束"){
                    layer.alert('此信息已结束了！')
                }else{
                    layer.confirm('确定拒绝学生 '+data.name+' 的假期吗？', function (index) {
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
                                layer.msg(data.msg,{icon: 1,time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/teacher';
                                }, 2000);

                            },
                            error: function () {
                                layer.msg(data.msg,{icon: 0, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/teacher';
                                }, 2000);
                            }
                        });
                        layer.close(index);
                    });
                }

            } else if (obj.event === 'update_approval') {
                if (data.state == "已结束"){
                    layer.alert('此信息已结束了！')
                }else{
                    layer.confirm('确定批准学生 '+data.name+' 的假期吗？', function (index) {
                        //obj.del();
                        var stuid = data['stuid'];
                        $.ajax({
                            type: 'POST',
                            url: '/updateApproval',
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
                }


            }
        });

        //违纪信息
        table.render({
            elem: '#wronginfo'
            ,url:'/wronginfo'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            //,height: 400
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            ,cols: [[
                {type:'numbers'}
                ,{field:'stuid',  title: '学号', sort: true}
                ,{field:'stuname',  title: '名字'}
                ,{field:'wrongday', title: '违纪日期',  } //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'wrongreason', title: '违纪原因', sort: true}
                ,{field:'result', title: '处理方式', sort: true}
            ]]
            ,page: true
            , limits: [3, 6, 9]
            , id: 'stuwrong_testReload' //查询---表格重载时id
        });

        //条件查询
        form.on('submit(wrongsearch)', function (data) {
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('stuwrong_testReload', {
                method: 'get'
                , where: {
                    stuid: data.field['stuid'], // 添加查询的参数
                    stuname: data.field['stuname'],
                    pageIndex: data.field['pageIndex'],
                    pageSize: data.field['pageSize']
                }
                , page: {
                    curr: 1 // 重载后从第一页开始
                }
            });
            return false;  // 阻止submit的表单提交
        });
    });
});