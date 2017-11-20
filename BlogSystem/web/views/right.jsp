<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.fu.utils.Utils" %>
<%@ page import="com.fu.model.User" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/4
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user=new User();
    String name = "";
    String userId = "";
    Cookie cookie=null;
    Cookie[] cookies=null;
    cookies=request.getCookies();
    if (cookies!=null) {
        for (int i = 0; i < cookies.length-1; i++) {
            cookie=cookies[i];
//            name = URLDecoder.decode(cookie.getValue(),"UTF-8");
            if(cookie.getName().equals("name")){
                name = URLDecoder.decode(cookie.getValue(),"UTF-8");
                user.setName(name);
            }
            if(cookie.getName().equals("id")){
                userId = URLDecoder.decode(cookie.getValue(),"UTF-8");
                user.setId(userId);
            }
        }
    }else {
        name = "请登录";
    }
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
        while(re.next()){
            if (userId.equals(re.getString("id"))) {
                user.setName(re.getString("name"));
                user.setProfession(re.getString("profession"));
                user.setIntroduction(re.getString("introduction"));
                break;
            }
        }
        re.close();
        sm.close();
        con.close();
    } catch (Exception e) {

        e.printStackTrace();
    }
%>
<!--right-->
<div class="right" id="c_right">
    <div class="s_about">
        <h2><a href="myinfo.jsp">我的信息</a></h2>
        <a href="myinfo.jsp"><img src="images/my1.jpg" width="100" height="100" alt="博主"/></a>
        <p>姓名：<%=user.getName()%></p>
        <p>职业：<%=user.getProfession()%></p>
        <p>简介：<%=user.getIntroduction()%></p>
        <p>
        <div class="clear"></div>
        </p>
    </div>
    <!--栏目分类-->
    <div class="lanmubox">
        <div class="hd">
            <ul><li>精心推荐</li><li>最新文章</li><li class="hd_3">随机文章</li></ul>
        </div>
        <div class="bd">
            <ul>
                <li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
                <li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
                <li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
                <li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
                <li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
            </ul>
            <ul>
                <li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
                <li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
                <li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
                <li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
                <li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
            </ul>
            <ul>
                <li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
                <li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
                <li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
                <li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
                <li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
            </ul>


        </div>
    </div>
    <!--end-->
</div>
<!--right end-->
