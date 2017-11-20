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
    <title>删除用户</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
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
            sm.execute("delete from collect_tab where collectorId = " + userId );
            sm.execute("delete from discuss_tab where discusserId = " + userId );
            sm.execute("delete from essay_tab where userId = " + userId );
            sm.execute("delete from user_tab where id = " + userId );
            sm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
%>
            </br></br><h3 align="center">删除用户成功，请<a href="managerusermag.jsp"  >返回</a></h3></br>
<%

//        if (userType.equals("1")) {
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/managerpage.jsp");
//        }else {
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/homepage.jsp");

%>
</body>
</html>
