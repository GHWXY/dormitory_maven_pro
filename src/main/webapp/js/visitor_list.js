$(function () {
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        form.on('submit(toolbarDemo)', function(){

            $.ajax({
                url: '/exportvisitorlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'v_id'
                        ,'v_name'
                        ,'v_phone'
                        ,'v_dormitoryid'
                        ,'v_dormbuilding'
                        ,'create_time'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({v_id: 'ID', v_name: '访客姓名', v_phone: '访客电话', v_dormitoryid: '访问宿舍编号', v_dormbuilding: '访问宿舍楼', create_time: '访问时间'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 80,
                        'C': 90,
                        'D': 100,
                        'E': 100,
                        'F': 160
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '访客数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                    //setTimeout(function () {window.location.href='/findAdmin';},2000);
                },

                error: function () {
                    //console.log(data);
                    setTimeout(function () {window.location.href='/findVisitor';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加访客信息",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '/addVisitor',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(data){
                        layer.msg(data.msg, {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findVisitor';},2000);

                    },
                    error:function(data){
                        layer.msg(data.msg,{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findVisitor';},2000);
                    }
                });
                // return false;
            });
        });


    });
});