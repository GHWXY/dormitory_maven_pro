<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>天津市大学软件学院宿舍管理系统用户登录</title>
<link href="${pageContext.request.contextPath}css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/school/jQuery1.7.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/school/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/school/jquery1.42.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/school/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/school/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/school/login3.js"></script>
</head>
<body>
<div id="tab">
    <ul class="tab_menu">
        <li><spring:message code="login.stu" /></li>
        <li class="selected"><spring:message code="login.admin" /></li>
        <li><spring:message code="login.tea" /></li>
        <li><spring:message code="login.ser" /></li>
    </ul>
    <div class="tab_box">
        <!-- 学生登录开始 -->
        <div class="hide">
            <div class="stu_error_box" style="color: red">${student_msg}</div>
            <form action="/student_manager" method="post" class="stu_login_error">
                <div>
                    <label><spring:message code="login.stunum" /></label>
                    <input type="text" id="stu_username_hide" name="slUsername" placeholder="<spring:message code="login.stuplac1" />" nullmsg="学号不能为空！" datatype="s6-18" errormsg="学号范围在6~18个字符之间！" sucmsg="学号验证通过！"/>
                </div>
                <div>
                    <label><spring:message code="login.password" /></label>
                    <input type="password" id="stu_password_hide" name="slPassword" placeholder="<spring:message code="login.stuplac2" />" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <div>
                    <button id="stuloginBtn"><spring:message code="login.btn" /></button>
                </div>
                <div style="text-align: left">
                    <a href="${pageContext.request.contextPath}/changelocale?login=zh_CN" class="language"><spring:message code="login.zh" /></a>|<a class="language" href="${pageContext.request.contextPath}/changelocale?login=en_US"><spring:message code="login.en" /></a>
                </div>
            </form>
        </div>
        <!-- 学生登录结束-->
        <!-- 管理员登录开始-->
        <div>
            <div class="stu_error_box" style="color: red">${admin_msg}</div>
            <form class="tea_login_error" action="/admin_manager" method="post" >
                <div>
                    <label><spring:message code="login.jobnum" /></label>
                    <input type="text" id="tea_username_hide" name="a_username" placeholder="<spring:message code="login.admplac1" />" required nullmsg="教工号不能为空！" datatype="s6-18" errormsg="教工号范围在6~18个字符之间！" sucmsg="教工号验证通过！"/>
                </div>
                <div>
                    <label><spring:message code="login.password" /></label>
                    <input type="password" id="tea_password_hide" name="a_password" placeholder="<spring:message code="login.stuplac2" />" required nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <div>
                    <button type="submit"><spring:message code="login.btn" /></button>
                </div>
                <div style="text-align: left">
                    <a href="${pageContext.request.contextPath}/changelocale?login=zh_CN" class="language"><spring:message code="login.zh" /></a>|<a class="language" href="${pageContext.request.contextPath}/changelocale?login=en_US"><spring:message code="login.en" /></a>
                </div>
            </form>
        </div>
        <!-- 管理员登录结束-->
        <!-- 辅导员登录开始-->
        <div class="hide">
            <div class="stu_error_box" style="color: red">${teacher_msg}</div>
            <form action="/teacher_manager" method="post" class="sec_login_error">
                <div>
                    <label><spring:message code="login.jobnum" /></label>
                    <input type="text" id="sec_username_hide" name="username" placeholder="<spring:message code="login.teaplac1" />" nullmsg="教务号不能为空！" datatype="s6-18" errormsg="教务号范围在6~18个字符之间！" sucmsg="教务号验证通过！"/>
                </div>
                <div>
                    <label><spring:message code="login.password" /></label>
                    <input type="password" id="sec_password_hide" name="password" placeholder="<spring:message code="login.stuplac2" />" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <div>
                    <button type="submit"><spring:message code="login.btn" /></button>
                </div>
                <div style="text-align: left">
                    <a href="${pageContext.request.contextPath}/changelocale?login=zh_CN" class="language"><spring:message code="login.zh" /></a>|<a class="language" href="${pageContext.request.contextPath}/changelocale?login=en_US"><spring:message code="login.en" /></a>
                </div>
            </form>
        </div>
        <!-- 辅导员登录结束-->
        <!-- 维修员登录开始-->
        <div class="hide">
            <div class="stu_error_box" style="color: red">${service_msg}</div>
            <form action="/service_manager" method="post" class="sec_login_error">
                <div>
                    <label><spring:message code="login.jobnum" /></label>
                    <input type="text" id="sec_username_hide2" name="username" placeholder="<spring:message code="login.serplac1" />" nullmsg="教务号不能为空！" datatype="s6-18" errormsg="教务号范围在6~18个字符之间！" sucmsg="教务号验证通过！"/>
                    <!--ajaxurl="demo/valid.jsp"-->
                </div>
                <div>
                    <label><spring:message code="login.password" /></label>
                    <input type="password" id="sec_password_hide2" name="password" placeholder="<spring:message code="login.stuplac2" />" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <div>
                    <button type="submit"><spring:message code="login.btn" /></button>
                </div>
                <div style="text-align: left">
                    <a href="${pageContext.request.contextPath}/changelocale?login=zh_CN" class="language"><spring:message code="login.zh" /></a>|<a class="language" href="${pageContext.request.contextPath}/changelocale?login=en_US"><spring:message code="login.en" /></a>
                </div>
            </form>
        </div>
        <!-- 维修员登录结束-->
    </div>
</div>
<!--背景轮播图-->
<div class="screenbg">
    <ul>
        <li><a href="javascript:;"><img src="/images/1.png"></a></li>
        <li><a href="javascript:;"><img src="/images/2.png"></a></li>
        <li><a href="javascript:;"><img src="/images/3.png"></a></li>
    </ul>
</div>
</body>
</html>
