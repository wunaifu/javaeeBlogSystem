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
    <title>更新用户手机号</title>
</head>
<body>
<%

    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    String userId = "";
    String pswold = "";
    String pswnew = "";
    userId = request.getParameter("id");
    pswold = request.getParameter("pswold");
    pswnew = request.getParameter("pswnew");
    System.out.println("userId="+userId);
    System.out.println("pswold="+pswold);
    System.out.println("pswnew="+pswnew);
    if ( "".equals(pswold) ||"".equals(pswnew)  ){

%>
        </br></br><h3 align="center">填写内容不能为空，请<a href="javascript:history.back();"  >返回</a>继续填写</h3></br>
<%
    }else{
        if (pswnew.equals(pswold)) {
%>
            </br></br><h3 align="center">新旧手机号不能相同，请<a href="javascript:history.back();">返回</a>继续填写</h3></br>
<%
        } else {
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
                boolean flag2 = false;
                while(re.next()){
                    if (pswold.equals(re.getString("phone"))) {
                        flag = true;
                        if (pswnew.equals(re.getString("phone"))) {
                            flag2 = true;
                        }
                    }
                }
                if (flag == true) {
                    if (flag2 == true) {
%>
                        </br></br><h3 align="center">已存在该手机号，请<a href="javascript:history.back();"  >返回</a>重新填写</h3></br>
<%
                    } else {
                        sm.execute("update user_tab set phone = '"+pswnew+"' where id = '"+userId+"'");
%>
                        </br></br><h3 align="center">手机号修改成功，请重新<a href="../index.jsp"  >登录</a></h3></br>
<%
                    }

                } else {
%>
                    </br></br><h3 align="center">旧手机号错误，请<a href="javascript:history.back();"  >返回</a>重新填写</h3></br>
<%
                }

                re.close();
                sm.close();
                con.close();
            } catch (Exception e) {

                e.printStackTrace();
            }
        }

    }

%>
</body>
</html>
