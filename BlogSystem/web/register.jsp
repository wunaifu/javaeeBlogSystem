<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="com.fu.utils.TimeUtil" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/6
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客注册页面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/reset.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css">
    <!--[if IE 6]>
    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript" src="js/ie6Fixpng.js"></script>
    <![endif]-->
</head>

<body>
<div class="headerBar">
    <div class="logoBar login_logo">
        <div class="comWidth">
            <h3 class="welcome_title" style="margin-left: 110px">欢迎注册个人博客</h3>
        </div>
    </div>
</div>

<form action="servlet/RegisterServlet" method="post" >
    <div class="loginBox">

        <div class="login_cont">
            <ul class="login">
                <li class="l_tit">用户名</li>
                <li class="mb_10"><input type="text" name="phone" class="login_input user_icon"></li>
                <li class="l_tit">密码</li>
                <li class="mb_10"><input type="password" name="password" class="login_input user_icon"></li>
                <li class="mb_10" style="border: 1px solid #ccc;width:309px; height:26px;">
                请选择您的职业：&nbsp;&nbsp;&nbsp;&nbsp;<select name="profession">
                    <option Selected value="学生">学生
                    <option value="金融">金融
                    <option value="IT">IT
                    <option value="交通">交通
                    <option value="其他">其他
                </select>
                </li>
                <li><input type="submit" value="注   册" style="width:309px; height:36px;background: #1D7AD9;font-size: 23px;"></li>
            </ul>
            <div class="login_partners">
                <p class="l_tit">已有账号，去&nbsp;<a href="index.jsp"  >登录</a> </p>

            </div>
        </div>

    </div>
</form>

</body>
</html>
