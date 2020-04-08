$(function () {
    $(document).ready(function(){
        var $tab_li = $('#tab ul li');
        $tab_li.hover(function(){
            $(this).addClass('selected').siblings().removeClass('selected');
            var index = $tab_li.index(this);
            $('div.tab_box > div').eq(index).show().siblings().hide();
        });
    });

    /*学生登录信息验证*/
    /*$("#stu_username_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入学号'){
            $(this).val('');
        }
    });
    $("#stu_username_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入学号');
        }
    });
    $("#stu_password_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入密码'){
            $(this).val('');
        }
    });
    $("#stu_password_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入密码');
        }
    });
    $("#stu_code_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入验证码'){
            $(this).val('');
        }
    });
    $("#stu_code_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入验证码');
        }
    });
    $(".stu_login_error").Validform({
        tiptype:function(msg,o,cssctl){
            var objtip=$(".stu_error_box");
            cssctl(objtip,o.type);
            objtip.text(msg);
        },
        ajaxPost:true
    });*/
    /*管理员登录信息验证*/
    /*$("#tea_username_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入管理员工号'){
            $(this).val('');
        }
    });
    $("#tea_username_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入管理员工号');
        }
    });
    $("#tea_password_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入密码'){
            $(this).val('');
        }
    });
    $("#tea_password_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入密码');
        }
    });
    $("#tea_code_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入验证码'){
            $(this).val('');
        }
    });
    $("#tea_code_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入验证码');
        }
    });
    $(".tea_login_error").Validform({
        tiptype:function(msg,o,cssctl){
            var objtip=$(".tea_error_box");
            cssctl(objtip,o.type);
            objtip.text(msg);
        },
        ajaxPost:true
    });*/
    /*辅导员登录信息验证*/
    /*$("#sec_username_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入辅导员工号'){
            $(this).val('');
        }
    });
    $("#sec_username_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入辅导员工号');
        }
    });
    $("#sec_password_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入密码'){
            $(this).val('');
        }
    });
    $("#sec_password_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入密码');
        }
    });
    $("#sec_code_hide").focus(function(){
        var username = $(this).val();
        if(username=='输入验证码'){
            $(this).val('');
        }
    });
    $("#sec_code_hide").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入验证码');
        }
    });
    $(".sec_login_error").Validform({
        tiptype:function(msg,o,cssctl){
            var objtip=$(".sec_error_box");
            cssctl(objtip,o.type);
            objtip.text(msg);
        },
        ajaxPost:true
    });*/
    /*维修员登录信息验证*/
    /*$("#sec_username_hide2").focus(function(){
        var username = $(this).val();
        if(username=='输入维修员工号'){
            $(this).val('');
        }
    });
    $("#sec_username_hide2").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入维修员工号');
        }
    });
    $("#sec_password_hide2").focus(function(){
        var username = $(this).val();
        if(username=='输入密码'){
            $(this).val('');
        }
    });
    $("#sec_password_hide2").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入密码');
        }
    });
    $("#sec_code_hide2").focus(function(){
        var username = $(this).val();
        if(username=='输入验证码'){
            $(this).val('');
        }
    });
    $("#sec_code_hide2").focusout(function(){
        var username = $(this).val();
        if(username==''){
            $(this).val('输入验证码');
        }
    });
    $(".sec_login_error").Validform({
        tiptype:function(msg,o,cssctl){
            var objtip=$(".sec_error_box");
            cssctl(objtip,o.type);
            objtip.text(msg);
        },
        ajaxPost:true
    });*/

  /*  $("#stuloginBtn").click(function () {
        var username = $("#stu_username_hide").val();
        var password = $("#stu_password_hide").val();
        //发送Ajax请求做登录认证
        $.post("/student_manager",{username:username,password:password},function (data) {
            data = $.parseJSON(data);
            if (data.success){
                window.local.href="/student";
            }else {
                alert(data.msg);
            }
        })

    });
*/

    $(".screenbg ul li").each(function(){
        $(this).css("opacity","0");
    });
    $(".screenbg ul li:first").css("opacity","1");
    var index = 0;
    var t;
    var li = $(".screenbg ul li");
    var number = li.size();
    function change(index){
        li.css("visibility","visible");
        li.eq(index).siblings().animate({opacity:0},3000);
        li.eq(index).animate({opacity:1},3000);
    }
    function show(){
        index = index + 1;
        if(index<=number-1){
            change(index);
        }else{
            index = 0;
            change(index);
        }
    }
    t = setInterval(show,8000);
    //根据窗口宽度生成图片宽度
    var width = $(window).width();
    $(".screenbg ul img").css("width",width+"px");
});