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
<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/6/30
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>管理员查找文章页面</title>
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
<jsp:include page="managertop.jsp"/>
<!--header end-->
<div id="content">
    <!--left-->
    <div class="left" id="c_left">
        <div class="s_tuijian">
            <h2>查找<span>文章</span></h2>
        </div>
        <div class="content_text">

            <!--wz-->
            <div class="wz">
                <form name id class="Form" action="managerfindessayresult.jsp" method=post>
                    <span class="wordage">请填写需要查找的关键字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余字数：<span id="sy" style="color:Red;">30</span></span>
                    <textarea id="TextArea1" name="search"  onkeyup="checkLengthT(this);" style="width:600px;height: 40px;padding: 10px;"></textarea>
                    <strong><input id="submindis" type="submit"   value="开始查找" style="color:#fff;float:left;
                    font-size:17px;background:#4B9CDD ;margin-left: 250px;padding: 4px;"></strong>
                </form>
                <script type="text/javascript">
                    function checkLengthT(which) {
                        var maxChars = 30; //
                        if(which.value.length > maxChars){
                            alert("您出入的字数超多限制!");
                            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                            which.value = which.value.substring(0,maxChars);
                            return false;
                        }else{
                            var curr = maxChars - which.value.length; //250 减去 当前输入的
                            document.getElementById("sy").innerHTML = curr.toString();
                            return true;
                        }
                    }

                    //                    function bn_click(){
                    //                        frm.action="findessay.jsp"
                    //                        frm.submit();
                    //                    }


                </script>
            </div>
            <!--wz end-->

        </div>
    </div>
    <!--left end-->
    <!--right-->
    <jsp:include page="right.jsp"/>
    <!--right end-->
    <div class="clear"></div>
</div>
<!--footer start-->
<div id="footer">
</div>
<!--footer end-->
<script type="text/javascript">jQuery(".lanmubox").slide({easing:"easeOutBounce",delayTime:400});</script>
<script  type="text/javascript" src="js/nav.js"></script>
</body>
</html>
