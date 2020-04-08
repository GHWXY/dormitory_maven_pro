$(function () {
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#add_date'
        });

        /*添加学生违规信息*/
        //监听提交
        form.on('submit(addWrongmsg_btn)', function(data){
            //layer.msg(JSON.stringify(data.field));
            var param = data.field;
            $.ajax({
                type: 'post',
                url: '/wrongInsert',
                data:JSON.stringify(param),   /*此处不转 提交失败*/
                dataType:'json',
                contentType: "application/json; charset=utf-8",
                success:function(data){
                    layer.msg(data.msg, {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='/adminWrong';},2000);

                },
                error:function(){
                    layer.msg(data.msg,{icon:0,time:3000});
                    setTimeout(function () {window.location.href='/adminWrong';},2000);
                }
            });
            return false;
        });


    });
});