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
    <title>修改个人信息页面</title>
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
            <div class="wz_text">当前位置：<a href="homepage.jsp">首页</a>><a href="myinfo.jsp">个人信息</a>><h1>修改个人信息</h1></div>
        </div>
        <div class="content_text">

            <div class="wz" style="min-height: 700px;">
                <img src="images/my1.jpg" width="150" height="150" alt="头像" style="margin-left: 290px;" />
                <dl>

                    <dd style="margin-left: 200px;width: 350px;">
                        <form name id class="Form" action="doupdateinfo.jsp" method="post">
                            <input hidden="hidden" name="id" value="<%=userId%>">
                            <span class="wordage">姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余字数：<span id="sy1" style="color:Red;">4</span></span><br />
                            <input name="name" onkeyup="checkLengthName(this);" style="min-width:280px;min-height: 20px;padding: 5px;"/><br />

                            <span class="wordage">昵称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余字数：<span id="sy3" style="color:Red;">5</span></span><br />
                            <input name="nickname"  onkeyup="checkLengthNickname(this);" style="min-width:280px;height: 20px;padding: 5px;"/><br />

                            <span class="wordage">年龄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余字数：<span id="sy4" style="color:Red;">3</span></span><br />
                            <input name="age" type="number"  onkeyup="checkLengthAge(this);" style="min-width:280px;height: 20px;padding: 5px;"/><br />

                            <span class="wordage">职业</span><br />
                            <select name="profession" style="min-width:280px;height: 40px;padding: 5px;">
                                <option Selected value="学生">学生
                                <option value="金融">金融
                                <option value="IT">IT
                                <option value="交通">交通
                                <option value="其他">其他
                            </select><br />

                            <span class="wordage">性别</span><br />
                            <select name="gender" style="min-width:280px;height: 40px;padding: 5px;">
                                <option Selected value="男">男
                                <option value="女">女
                            </select><br />

                            <span class="wordage">地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余字数：<span id="sy7" style="color:Red;">30</span></span><br />
                            <textarea name="address"  onkeyup="checkLengthAddress(this);" style="min-width:280px;min-height: 30px;padding: 5px;"></textarea><br />

                            <span class="wordage">个人简介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余字数：<span id="sy8" style="color:Red;">60</span></span><br />
                            <textarea name="introduction" onkeyup="checkLength11(this);" style="min-width:280px;min-height: 30px;padding: 5px;"></textarea><br />


                            <strong><input id="submindis" type="submit" value="确认更新" style="color:#fff;float:left;
                                font-size:17px;background:#4B9CDD ;margin-left: 100px;padding: 4px;"></strong>
                        </form>
                        <script type="text/javascript">
                            function checkLengthName(which) {
                                var maxChars = 4; //
                                if(which.value.length > maxChars){
                                    alert("您输入的字数超过限制!");
                                    // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                                    which.value = which.value.substring(0,maxChars);
                                    return false;
                                }else{
                                    var curr = maxChars - which.value.length; //250 减去 当前输入的
                                    document.getElementById("sy1").innerHTML = curr.toString();
                                    return true;
                                }
                            }
                            function checkLengthNickname(which) {
                                var maxChars = 5; //
                                if(which.value.length > maxChars){
                                    alert("您输入的字数超过限制!");
                                    // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                                    which.value = which.value.substring(0,maxChars);
                                    return false;
                                }else{
                                    var curr = maxChars - which.value.length; //250 减去 当前输入的
                                    document.getElementById("sy3").innerHTML = curr.toString();
                                    return true;
                                }
                            }
                            function checkLengthAge(which) {
                                var maxChars = 3; //
                                if(which.value.length > maxChars){
                                    alert("您输入的字数超过限制!");
                                    // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                                    which.value = which.value.substring(0,maxChars);
                                    return false;
                                }else{
                                    var curr = maxChars - which.value.length; //250 减去 当前输入的
                                    document.getElementById("sy4").innerHTML = curr.toString();
                                    return true;
                                }
                            }
                            function checkLengthAddress(which) {
                                var maxChars = 30; //
                                if(which.value.length > maxChars){
                                    alert("您输入的字数超过限制!");
                                    // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                                    which.value = which.value.substring(0,maxChars);
                                    return false;
                                }else{
                                    var curr = maxChars - which.value.length; //250 减去 当前输入的
                                    document.getElementById("sy7").innerHTML = curr.toString();
                                    return true;
                                }
                            }
                            function checkLength11(which) {
                                var maxChars = 60; //
                                if(which.value.length > maxChars){
                                    alert("您输入的字数超过限制!");
                                    // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                                    which.value = which.value.substring(0,maxChars);
                                    return false;
                                }else{
                                    var curr = maxChars - which.value.length; //250 减去 当前输入的
                                    document.getElementById("sy8").innerHTML = curr.toString();
                                    return true;
                                }
                            }

                        </script>


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
