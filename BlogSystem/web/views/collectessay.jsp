<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="com.fu.utils.TimeUtil" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/5
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收藏文章</title>
</head>
<body>
<%
    String userId = "";
    String userName = "";
    String userType = "";
    Cookie cookie=null;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    if (cookies!=null) {
        for (int i = 0; i < cookies.length-1; i++) {
            cookie=cookies[i];
//            name = URLDecoder.decode(cookie.getValue(),"UTF-8");
            if(cookie.getName().equals("id")){
                userId = URLDecoder.decode(cookie.getValue(),"UTF-8");
            }
            if(cookie.getName().equals("nickname")){
                userName = URLDecoder.decode(cookie.getValue(),"UTF-8");
            }
        }
    }else {
        userName = "未填写";
    }

    String essayId = request.getParameter("essayId");
    userType = request.getParameter("type");
    System.out.println("essayId = "+essayId);
    Connection con=null;
    Statement sm=null;
    ResultSet re=null;
//        Statement smE=null;
//        ResultSet reE=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection(Utils.DateURL,"root","root");
        sm=con.createStatement();
//            smE=con.createStatement();
    } catch (Exception e) {

        e.printStackTrace();
    }
    try {
        re = sm.executeQuery("select * from collect_tab");
        boolean flag = false;
        String collectid="0";
        while(re.next()){
            if (userId.equals(re.getString("collectorId"))) {
                if (essayId.equals(re.getString("essayId"))) {
                    //已收藏
                    flag = true;

                }
            }
            collectid = re.getString("collectId");
        }

        if (flag == false) {
            //未收藏时，
            sm.execute("insert into collect_tab(essayId,collectorId,collectTime) values('"+essayId+"','"+userId+"','"+ TimeUtil.dateToString(new Date())+"')");
        } else {
            //已收藏时，取消收藏
            sm.execute("delete from collect_tab where essayId = " + essayId + " and collectorId = " + userId);
        }
//            reE.close();
//            smE.close();
        re.close();
        sm.close();
        con.close();
    } catch (Exception e) {

        e.printStackTrace();
    }
    if (userType.equals("1")) {
        response.sendRedirect("http://localhost:8080/BlogSystem/views/manageressayinfo.jsp?essayId="+essayId);
    } else {
        response.sendRedirect("http://localhost:8080/BlogSystem/views/essayinfo.jsp?essayId="+essayId);
    }
%>
</body>
</html>
