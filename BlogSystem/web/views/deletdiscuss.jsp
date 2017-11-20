<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="com.fu.utils.TimeUtil" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/5
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除评论</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String essayId = request.getParameter("essayId");
    String discussId = request.getParameter("discussId");
    String userType = request.getParameter("type");
    String userId = "";

    Cookie cookie=null;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    if (cookies!=null) {
        for (int i = 0; i < cookies.length-1; i++) {
            cookie=cookies[i];
            if(cookie.getName().equals("id")){
                userId = URLDecoder.decode(cookie.getValue(),"UTF-8");
            }
        }
    }else {

    }

    Connection con=null;
    Statement sm=null;
//    ResultSet re=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection(Utils.DateURL,"root","root");
        sm=con.createStatement();
    } catch (Exception e) {

        e.printStackTrace();
    }
    try {
        sm.execute("delete from discuss_tab where id = " + discussId );

        sm.close();
        con.close();
    } catch (Exception e) {

        e.printStackTrace();
    }
    if (userType.equals("1")) {
%>
        </br></br><h3 align="center">删除评论成功，请<a href="manageressayinfo.jsp?essayId=<%=essayId%>"  >返回</a></h3></br>
<%
    } else {
%>
        </br></br><h3 align="center">删除评论成功，请<a href="essayinfo.jsp?essayId=<%=essayId%>"  >返回</a></h3></br>
<%
//    if (userType.equals("1")) {
//        response.sendRedirect("http://localhost:8080/BlogSystem/views/manageressayinfo.jsp?essayId="+essayId);
//    }else {
//        response.sendRedirect("http://localhost:8080/BlogSystem/views/essayinfo.jsp?essayId="+essayId);
//
    }
%>
</body>
</html>
