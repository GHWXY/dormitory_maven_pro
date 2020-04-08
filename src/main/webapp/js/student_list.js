$(function () {
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel', 'form', 'layer', 'laydate', 'laypage'], function () {
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;


        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        form.on('submit(toolbarDemo)', function () {

            $.ajax({
                url: '/exportstudentlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        's_id'
                        , 's_studentid'
                        , 's_name'
                        , 's_sex'
                        , 's_age'
                        , 's_phone'
                        , 's_classid'
                        , 's_classname'
                        , 's_dormitoryid'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({
                        s_id: 'ID',
                        s_studentid: '学号',
                        s_name: '姓名',
                        s_sex: '性别',
                        s_age: '年龄',
                        s_phone: '电话',
                        s_classid: '班级编号',
                        s_classname: '班级名',
                        s_dormitoryid: '寝室编号'
                    });

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 90,
                        'C': 80,
                        'F': 90
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '学生数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 ' + spent + ' s');
                    //setTimeout(function () {window.location.href='/findAdmin';},2000);
                },

                error: function () {
                    //console.log(data);
                    setTimeout(function () {
                        window.location.href = '/findStudent';
                    }, 2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type: 1,
                title: "添加学生信息",
                skin: "myclass",
                area: ["50%"],
                anim: 2,
                content: $("#addDiv").html()
            });
            $("#addStudentForm")[0].reset();
            form.on('submit(formDemo)', function (data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param = data.field;
             //   console.log(JSON.stringify(param));
                var stu = JSON.stringify(param);
                $.ajax({
                    url: '/addStudent',
                    type: 'post',
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        layer.msg(data.msg, {icon: 1, time: 3000});
                        setTimeout(function () {
                            window.location.href = '/findStudent';
                        }, 2000);

                    },
                    error: function (data) {
                        layer.msg(data.msg, {icon: 0, time: 3000});
                        setTimeout(function () {
                            window.location.href = '/findStudent';
                        }, 2000);
                    }
                });
                //return false;
            });

        });


    });

    //数据表格
    layui.use(['table', 'form', 'layedit'], function () {
        var table = layui.table;
        var form = layui.form;
        table.render({
            elem: '#demo'
            , title: '学生信息表格'
            , url: 'studentinfo2'
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true/*{ //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                ,groups: 3 //只显示 1 个连续页码
                ,first: false //不显示首页
                ,last: false //不显示尾页
                ,limit:3

            }*/
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
            , cols: [[
                /*{type: 'checkbox'}*/
                 {type: 'numbers'}
               /* , {field: 's_id', title: 'ID', sort: true}*/
                , {field: 's_studentid', title: '学号'}
                , {field: 's_name', title: '姓名', sort: true}
                , {field: 's_sex', title: '性别'}
                , {field: 's_age', title: '年龄',} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                , {field: 's_phone', title: '电话', sort: true}
                , {field: 's_classid', title: '班级编号', sort: true}
                , {field: 's_classname', title: '班级名'}
                , {field: 's_dormitoryid', title: '寝室编号', sort: true}
                , {field: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
            , id: 'testReload' //查询---表格重载时id
        });

        //条件查询
        form.on('submit(search)', function (data) {
            //alert(data.field['pageIndex']);
            /**
             * 数据表格的重载功能
             */
            table.reload('testReload', {
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

        //监听表格复选框选择
        table.on('checkbox(test)', function (obj) {
            console.log(obj)
        });

        //监听工具条
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('确定删除该数据?', function (index) {
                    //obj.del();
                    var s_id = data['s_id'];
                    $.ajax({
                        type: 'POST',
                        url: '/deleteStudent',
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
            } else if (obj.event === 'edit') {
                //layer.alert('编辑行：<br>'+ JSON.stringify(data))
                layer.open({
                    type: 1,
                    title: "编辑学生",
                    skin: "myclass",
                    area: ["50%"],
                    anim: 0, //弹出动画
                    closeBtn: 2,//两种风格的关闭按钮(1,2)
                    fixed: true,//鼠标滚动时，层是否固定在可视区域
                    btn: ['提交', '取消'],
                    content: $('#updteDiv'),
                    success: function (index, layero) {
                        //编辑时form表单回显
                        form.val("updateStudent", data);

                    },
                    yes: function (index, layero) {
                        $.ajax({
                            type: 'POST',
                            url: '/updateStudent',
                            data: {
                                s_id: $("#edit_id").val(),
                                s_studentid: $("#edit_studentid").val(),
                                s_name: $("#edit_names").val(),
                                s_sex: $("#edit_sex").val(),
                                s_age: $("#edit_age").val(),
                                s_phone: $("#edit_phone").val(),
                                s_classid: $("#edit_classids").val(),
                                s_classname: $("#edit_classname").val(),
                                s_dormitoryid: $("#edit_dormitoryids").val(),
                            },
                            dataType: "json",
                            success: function (data) {
                                layer.msg(data.msg, {icon: 1, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/findStudent';
                                }, 2000);

                            },
                            error: function (data) {
                                layer.msg(data.msg, {icon: 0, time: 3000});
                                setTimeout(function () {
                                    window.location.href = '/findStudent';
                                }, 2000);
                            }
                        });

                    },
                    btn2: function (index, layero) { // 取消按钮回调函数
                        if (layer.confirm('确定要取消吗')) { //只有当点击confirm框的确定时，该层才会关闭
                            layer.close(index)
                            $("#updteDiv").hide();
                        }
                        return false;
                    },
                    cancel: function (index, layero) {
                        if (layer.confirm('确定要关闭吗')) { //只有当点击confirm框的确定时，该层才会关闭
                            layer.close(index)
                            $("#updteDiv").hide();
                        }
                        return false;
                    }

                });

                /*form.on('submit(updateForm)', function(data){

                    //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                    //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                    //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var item = data.field;

                    alert("====="+item);
                    $.ajax({
                        url:'/updateStudent',
                        type:'post',
                        data:item,
                        contentType: "application/json; charset=utf-8",
                        success:function(){
                            layer.msg('更新成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='/findStudent';},2000);

                        },
                        error:function(){
                            layer.msg('更新失败',{icon:0,time:3000});
                            setTimeout(function () {window.location.href='/findStudent';},2000);
                        }
                    })
                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                });*/
            }
        });


    });

})
