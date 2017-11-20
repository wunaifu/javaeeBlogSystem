<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fu.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fu.model.Essay" %>
<%@ page import="com.fu.utils.TimeUtil" %>
<%@ page import="com.fu.model.Discuss" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/4
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>查看个人信息页面</title>
    <meta name="keywords" content="个人博客" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->

</head>

<body>
<!--header start-->
<!-- 头部 -->
<jsp:include page="top.jsp"/>
<!--header end-->
<%
    User user=new User();
    String name = "";
    String userId = "";
    Cookie cookie=null;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    if (cookies!=null) {
        for (int i = 0; i < cookies.length-1; i++) {
            cookie=cookies[i];
//            name = URLDecoder.decode(cookie.getValue(),"UTF-8");
            if(cookie.getName().equals("name")){
                name = URLDecoder.decode(cookie.getValue(),"UTF-8");
                user.setName(name);
            }
            if(cookie.getName().equals("id")){
                userId = URLDecoder.decode(cookie.getValue(),"UTF-8");
                user.setId(userId);
            }
        }
    }else {
        name = "请登录";
    }
    Connection con=null;
    Statement sm=null;
    ResultSet re=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection(Utils.DateURL,"root","root");
        sm=con.createStatement();
    } catch (Exception e) {

        e.printStackTrace();
    }
    try {
        re = sm.executeQuery("select * from user_tab");
        boolean flag = false;
        while(re.next()){
            if (userId.equals(re.getString("id"))) {
                user.setName(re.getString("name"));
                user.setPhone(re.getString("phone"));
                user.setNickname(re.getString("nickname"));
                user.setAge(re.getString("age"));
                user.setGender(re.getString("gender"));
                user.setAddress(re.getString("address"));
                user.setProfession(re.getString("profession"));
                user.setIntroduction(re.getString("introduction"));
                break;
            }
        }
        re.close();
        sm.close();
        con.close();
    } catch (Exception e) {

        e.printStackTrace();
    }
%>
<!--content start-->
<div id="content">
    <!--left-->
    <div class="left" id="c_left">
        <div class="weizi">
            <div class="wz_text">当前位置：<a href="homepage.jsp">首页</a>><h1>个人信息</h1>
                <h1 style="float: right;margin-right: 10px;"><a href="updatemyinfo.jsp">修改个人信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="updatepsw.jsp">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="updatepphone.jsp">更换手机号</a></h1></div>
        </div>
        <div class="content_text">

            <div class="wz" style="min-height: 600px;">
                <img src="images/my1.jpg" width="150" height="150" alt="头像" style="margin-left: 290px;" />
                <dl>

                    <dd style="margin-left: 200px;width: 350px;">
                        <p class="dd_text_2"></p>
                        <p class="dd_text_2">姓名：<%=user.getName()%></p>
                        <p class="dd_text_2">手机号：<%=user.getPhone()%></p>
                        <p class="dd_text_2">昵称：<%=user.getNickname()%></p>
                        <p class="dd_text_2">职业：<%=user.getProfession()%></p>
                        <p class="dd_text_2">年龄：<%=user.getAge()%></p>
                        <p class="dd_text_2">性别：<%=user.getGender()%></p>
                        <p class="dd_text_2">地址：<%=user.getAddress()%></p>
                        <p class="dd_text_2">个人简介：<%=user.getIntroduction()%></p>

                    </dd>
                </dl>
            </div>
            <!--wz end-->

        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
