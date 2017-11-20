<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="com.fu.utils.TimeUtil" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/6
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发表文章验证</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    if (title.equals("") || content.equals("")) {
%>
        </br></br><h3 align="center">填写内容不能为空，请<a href="javascript:history.back();"  >返回</a>继续填写</h3></br>
<%

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
            sm.execute("insert into essay_tab(userId,essayTitle,essayContent,sendTime) values('"+userId+"','"+title+"','"+content+"','"+ TimeUtil.dateToString(new Date())+"')");

            sm.close();
            con.close();
        } catch (Exception e) {

            e.printStackTrace();
        }
%>
        </br></br><h3 align="center">发表成功，请前往<a href="homepage.jsp">主页</a>或<a href="javascript:history.back();"  >返回</a></h3></br>
<%
    }
%>
</body>
</html>
