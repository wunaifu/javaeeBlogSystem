<%@ page import="com.fu.model.User" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新用户个人信息</title>
</head>
<body>
<%

    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    User user=new User();
    user.setId(request.getParameter("id"));
    System.out.println("userId="+user.getId());
    user.setName(request.getParameter("name"));
    user.setNickname(request.getParameter("nickname"));
    user.setAge(request.getParameter("age"));
    user.setGender(request.getParameter("gender"));
    user.setAddress(request.getParameter("address"));
    user.setProfession(request.getParameter("profession"));
    user.setIntroduction(request.getParameter("introduction"));
    if ( "".equals(user.getName()) ||"".equals(user.getNickname())
        ||"".equals(user.getAge()) ||"".equals(user.getGender()) ||"".equals(user.getAddress())
        ||"".equals(user.getProfession()) ||"".equals(user.getIntroduction())  ){

%>
        </br></br><h3 align="center">填写内容不能为空，请<a href="javascript:history.back();"  >返回</a>继续填写</h3></br>
<%
    }else{
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
//            re = sm.executeQuery("select * from user_tab");
//            boolean flag = false;
//            while(re.next()){
//                if (user.getPhone().equals(re.getString("phone"))) {
//                    break;
//                }
//            }
            sm.execute("update user_tab set name='"
                            +user.getName()+"', nickname='"
                            +user.getNickname()+"', age='"
                            +user.getAge()+"', gender='"
                            +user.getGender()+"', address='"
                            +user.getAddress()+"', introduction='"
                            +user.getIntroduction()+"', profession='"
                            +user.getProfession()+"' where id = '"+user.getId()+"'");
            re.close();
            sm.close();
            con.close();
        } catch (Exception e) {

            e.printStackTrace();
        }
%>
        </br></br><h3 align="center">修改信息成功，请<a href="myinfo.jsp"  >查看个人信息</a></h3></br>
<%
    }

%>
</body>
</html>
