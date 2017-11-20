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
    <title>管理员主页面</title>
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
    <div class="left" id="c_left">
        <div class="s_tuijian">
            <h2>文章<span>推荐</span></h2>
        </div>
        <div class="content_text">
            <%
                List<Essay> essayList = new ArrayList<>();
                Connection con=null;
                Statement userSm=null;
                ResultSet userRe=null;
                Statement sm=null;
                ResultSet re=null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con= DriverManager.getConnection(Utils.DateURL,"root","root");
                    sm=con.createStatement();
                    userSm=con.createStatement();
                } catch (Exception e) {

                    e.printStackTrace();
                }
                try {
                    re = sm.executeQuery("select * from essay_tab");
                    while(re.next()){
                        Essay essay=new Essay();
                        essay.setEssayId(re.getString("essayId"));
                        String id = re.getString("userId");
                        essay.setUserId(id);
//                        userSm = null;
//                        userRe = null;
                        userRe = userSm.executeQuery("select * from user_tab");
                        while(userRe.next()){
                            if (id.equals(userRe.getString("id"))) {
                                essay.setUserNickname(userRe.getString("nickname"));
                                break;
                            }
                        }

                        essay.setEssayTitle(re.getString("essayTitle"));
                        essay.setEssayContent(re.getString("essayContent"));
                        essay.setSendIime(TimeUtil.stringToDate(re.getString("sendTime")));
                        essayList.add(essay);
                    }
                    userSm.close();
                    userRe.close();
                    re.close();
                    sm.close();
                    con.close();
                } catch (Exception e) {

                    e.printStackTrace();
                }
            %>
            <%
                if (essayList != null && essayList.size() > 0) {
                    for (int i = essayList.size()-1; i >=0; i--) {
            %>
            <!--wz-->
            <div class="wz">
                <h3><a href="manageressayinfo.jsp?essayId=<%=essayList.get(i).getEssayId()%>" title="文章标题"><%=essayList.get(i).getEssayTitle()%></a></h3>
                <dl>
                    <dt><img src="images/s.jpg" width="200"  height="123" alt=""></dt>
                    <dd>
                        <p class="dd_text_1"><%=essayList.get(i).getEssayContent()%></p>
                        <p class="dd_text_2">
                            <span class="left author"><%=essayList.get(i).getUserNickname()%></span>
                            <span class="left sj">时间:<%=TimeUtil.dateToStrNoTime(essayList.get(i).getSendIime())%></span>
                            <span class="left fl">分类:文章</span><span class="left yd">
                                <a href="manageressayinfo.jsp?essayId=<%=essayList.get(i).getEssayId()%>" title="阅读全文">阅读全文</a>
                            </span>
                        <div class="clear"></div>
                        </p>
                    </dd>
                    <div class="clear"></div>
                </dl>
            </div>
            <hr/>
            <!--wz end-->
            <%
                }
            }else {
            %>          </br><h3 align="center">没有文章</h3></br>
            <%
                }
            %>

        </div>
    </div>
    <!--left end-->
    <!--right-->
    <jsp:include page="managerright.jsp"/>
    <!--right end-->
    <div class="clear"></div>
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
