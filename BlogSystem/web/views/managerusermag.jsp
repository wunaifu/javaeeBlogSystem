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
    <title>管理员管理用户页面</title>
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
<!--content start-->
<div id="content">
    <!--left-->
    <div class="left" id="c_left" style="width: 1000px;">
        <div class="weizi">
            <div class="wz_text">当前位置：<a href="managerpage.jsp">首页</a>><h1>管理用户信息</h1></div>
        </div>
        <div class="content_text" style="width: 1000px;">
            <%
                List<User> userList = new ArrayList<>();
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
                    while(re.next()){
                        if ("1".equals(re.getString("type"))) {

                        }else {
                            User user=new User();
                            user.setId(re.getString("id"));
                            user.setName(re.getString("name"));
                            user.setPhone(re.getString("phone"));
                            user.setNickname(re.getString("nickname"));
                            user.setAge(re.getString("age"));
                            user.setGender(re.getString("gender"));
                            user.setAddress(re.getString("address"));
                            user.setProfession(re.getString("profession"));
                            user.setIntroduction(re.getString("introduction"));
                            user.setType("0");
                            userList.add(user);
                        }

                    }
                    re.close();
                    sm.close();
                    con.close();
                } catch (Exception e) {

                    e.printStackTrace();
                }
            %>
            <%
                if (userList != null && userList.size() > 0) {
            %>
            <!--wz-->
            <div style="width: 1000px;">
                <dl>

                    <table cellspacing="0" border="1" class="table1">
                        <thead>
                        <tr>
                            <th width="300">姓名</th>
                            <th width="300">手机号</th>
                            <th width="300">昵称</th>
                            <th width="300">职业</th>
                            <th width="300">年龄</th>
                            <th width="300">性别</th>
                            <th width="300">地址</th>
                            <th width="300">个人简介</th>
                            <th  width="300">编辑</th>
                            <th  width="300">删除</th>
                        </tr>
                        </thead>
                        <%
                                for (int i = userList.size()-1; i >=0; i--) {
                        %>
                        <tbody>
                            <tr>
                                <td align="center"><%=userList.get(i).getName()%></td>
                                <td align="center"><%=userList.get(i).getPhone()%></td>
                                <td align="center"><%=userList.get(i).getNickname()%></td>
                                <td align="center"><%=userList.get(i).getProfession()%></td>
                                <td align="center"><%=userList.get(i).getAge()%></td>
                                <td align="center"><%=userList.get(i).getGender()%></td>
                                <td align="center"><%=userList.get(i).getAddress()%></td>
                                <td align="center"><%=userList.get(i).getIntroduction()%></td>
                                <td align="center">
                                    <a href="managerupdateuser.jsp?userId=<%=userList.get(i).getId()%>" ><img src="<%=basePath %>images/编辑.png"></a>
                                </td>
                                <td align="center">
                                    <a href="managerdeleteuser.jsp?userId=<%=userList.get(i).getId()%>"
                                       onclick='return confirm("即将删除与该用户相关的所有信息，确认要删除吗?")'>
                                        <img src="<%=basePath %>images/trash.gif"></a>
                                </td>
                            </tr>
                        </tbody>
                        <%
                            }
                        %>
                    </table>
                </dl>
            </div>
            <!--wz end-->
            <%

            }else {
            %>          </br><h3 align="center">没有用户</h3></br>
            <%
                }
            %>

        </div>
    </div>
    <!--left end-->
    <!--right-->
    <%--<jsp:include page="managerright.jsp"/>--%>
    <%--<!--right end-->--%>
    <%--<div class="clear"></div>--%>
</div>
<!--content end-->
<!--footer start-->
<div id="footer">
</div>
<!--footer end-->
<script type="text/javascript">jQuery(".lanmubox").slide({easing:"easeOutBounce",delayTime:400});</script>
<script  type="text/javascript" src="js/nav.js"></script>
</body>
</html>
