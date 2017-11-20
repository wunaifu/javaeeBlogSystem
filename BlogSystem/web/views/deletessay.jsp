<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="com.fu.utils.TimeUtil" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/6
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除文章</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String essayId = request.getParameter("essayId");
    String userType = request.getParameter("type");
        Connection con=null;
        Statement sm=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection(Utils.DateURL,"root","root");
            sm=con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            sm.execute("delete from discuss_tab where essayId = " + essayId );
            sm.execute("delete from collect_tab where essayId = " + essayId );
            sm.execute("delete from essay_tab where essayId = " + essayId );
            sm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userType.equals("1")) {
%>
            </br></br><h3 align="center">删除文章成功，请返回<a href="managerpage.jsp"  >首页</a></h3></br>
<%
        } else {
%>
            </br></br><h3 align="center">删除文章成功，请返回<a href="homepage.jsp"  >首页</a></h3></br>
<%
//        if (userType.equals("1")) {
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/managerpage.jsp");
//        }else {
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/homepage.jsp");
        }
%>
</body>
</html>
