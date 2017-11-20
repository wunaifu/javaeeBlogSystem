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
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发表评论</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String essayId = request.getParameter("essayId");
    String discussStr = request.getParameter("discussStr");
    String userType = request.getParameter("type");
    if (discussStr.equals("")) {
%>
        </br></br><h3 align="center">评论不能为空，请<a href="javascript:history.back();"  >返回</a>继续填写</h3></br>
<%
//        if (userType.equals("1")) {
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/manageressayinfo.jsp?essayId="+essayId);
//        } else {
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/essayinfo.jsp?essayId="+essayId);
//        }
    }else {
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

        System.out.println("essayId = "+essayId);
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
            sm.execute("insert into discuss_tab(essayId,discusserId,discussContent,discussTime) values('"+essayId+"','"+userId+"','"+discussStr+"','"+ TimeUtil.dateToString(new Date())+"')");

            sm.close();
            con.close();
        } catch (Exception e) {

            e.printStackTrace();
        }

        if (userType.equals("1")) {
%>
            </br></br><h3 align="center">评论成功，请<a href="manageressayinfo.jsp?essayId=<%=essayId%>"  >返回</a></h3></br>
<%
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/manageressayinfo.jsp?essayId="+essayId);
        } else {
%>
            </br></br><h3 align="center">评论成功，请<a href="essayinfo.jsp?essayId=<%=essayId%>"  >返回</a></h3></br>
<%
//            response.sendRedirect("http://localhost:8080/BlogSystem/views/essayinfo.jsp?essayId="+essayId);
        }
    }

%>
</body>
</html>
