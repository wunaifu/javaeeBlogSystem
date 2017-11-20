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
<%@ page import="com.fu.model.Discuss" %><%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/4
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String essayId = request.getParameter("essayId");//用request得到
%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>文章内容</title>
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
<jsp:include page="top.jsp"/>
<!--header end-->
<%
    String userIdNow = "";
    boolean collectFlag = false;
    Essay essay=new Essay();
    User user = new User();
    Connection con=null;
    Statement userSm=null;
    ResultSet userRe=null;
    Statement sm=null;
    ResultSet re=null;
    Statement smC=null;
    ResultSet reC=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con= DriverManager.getConnection(Utils.DateURL,"root","root");
        sm=con.createStatement();
        userSm=con.createStatement();
        smC=con.createStatement();
    } catch (Exception e) {

        e.printStackTrace();
    }
    try {
        re = sm.executeQuery("select * from essay_tab");
        while(re.next()){
            if (essayId.equals(re.getString("essayId"))) {
                essay.setEssayId(essayId);
                String id = re.getString("userId");
                essay.setUserId(id);
                userRe = userSm.executeQuery("select * from user_tab");
                while(userRe.next()){
                    if (id.equals(userRe.getString("id"))) {

                        user.setId(id);
                        user.setNickname(userRe.getString("nickname"));
                        user.setName(userRe.getString("name"));
                        user.setProfession(userRe.getString("profession"));
                        user.setIntroduction(userRe.getString("introduction"));

                        break;
                    }
                }
                essay.setEssayTitle(re.getString("essayTitle"));
                essay.setEssayContent(re.getString("essayContent"));
                essay.setSendIime(TimeUtil.stringToDate(re.getString("sendTime")));
                break;
            }
        }

        Cookie cookie=null;
        Cookie[] cookies=null;
        cookies=request.getCookies();
        if (cookies!=null) {
            for (int i = 0; i < cookies.length-1; i++) {
                cookie=cookies[i];
                if(cookie.getName().equals("id")){
                    userIdNow = URLDecoder.decode(cookie.getValue(),"UTF-8");
                }
            }
        }else {

        }

        reC=smC.executeQuery("select * from collect_tab");
        while(reC.next()){
            if (essayId.equals(reC.getString("essayId"))) {
                if (userIdNow.equals(reC.getString("collectorId"))) {
                    collectFlag = true;
                    break;
                }
            }
        }
        smC.close();
        reC.close();
        userSm.close();
        userRe.close();
        re.close();
        sm.close();
        con.close();
    } catch (Exception e) {

        e.printStackTrace();
    }
%>
<!--content start-->
<div id="content">
    <!--left-->
    <div class="left" id="c_left">
        <div class="weizi">
            <div class="wz_text">当前位置：<a href="homepage.jsp">首页</a>><a href="#">文章</a></a>><h1><%=essay.getEssayTitle()%></h1></div>
        </div>
        <div class="s_tuijian">
            <div class="s_tuijian">
                <h2 align="center"><%=essay.getEssayTitle()%></h2>
            </div>
        </div>
        <div class="content_text">

            <div class="wz">
                <dl>
                    <%--<dt><img src="images/s.jpg" width="200"  height="123" alt=""></dt>--%>
                    <dd>
                        <p class="dd_text_2">
                            <span class="left author"><%=user.getNickname()%></span>
                            <span class="left sj">时间:<%=TimeUtil.dateToStrNoTime(essay.getSendIime())%></span>
                            <span class="left yd" ><a href="collectessay.jsp?essayId=<%=essayId%>&type=0" title="是否收藏该文章" id="collectspan">
                                <%
                                if (collectFlag == true) {
                                %>
                                    已收藏文章
                                <%}else {%>
                                    未收藏文章
                                <%}%>
                            </a></span>
                                <%
                                    if (userIdNow.equals(essay.getUserId())) {
                                %>
                                    <span class="left fl"><a href="deletessay.jsp?essayId=<%=essayId%>&type=0" onclick='return confirm("确认要删除吗?")'>删除</a></span>
                                <%
                                }
                                %>

                        <div class="clear"></div>
                        </p>
                    </dd>
                    <div class="clear"></div>
                </dl>
            </div>
            <!--wz end-->
            <p style="font-size: 16px;padding: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=essay.getEssayContent()%></p><br/>
        </div>
        <div class="clear"></div>
        <%
            List<Discuss> discussList = new ArrayList<>();
            Connection conDiscuss=null;
            Statement userSmDiscuss=null;
            ResultSet userReDiscuss=null;
            Statement smDiscuss=null;
            ResultSet reDiscuss=null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conDiscuss= DriverManager.getConnection(Utils.DateURL,"root","root");
                userSmDiscuss=conDiscuss.createStatement();
                smDiscuss=conDiscuss.createStatement();
            } catch (Exception e) {

                e.printStackTrace();
            }
            try {
                reDiscuss = smDiscuss.executeQuery("select * from discuss_tab");
                while(reDiscuss.next()){
                    if (essayId.equals(reDiscuss.getString("essayId"))) {
                        Discuss discuss = new Discuss();
                        discuss.setId(reDiscuss.getString("id"));
                        discuss.setEssayId(essayId);
                        String discussor = reDiscuss.getString("discusserId");
                        discuss.setDiscusserId(discussor);
                        discuss.setDiscussTime(TimeUtil.dateToString( TimeUtil.stringToDate(reDiscuss.getString("discussTime"))));
                        discuss.setDiscussContent(reDiscuss.getString("discussContent"));

                        userReDiscuss = userSmDiscuss.executeQuery("select * from user_tab");
                        while(userReDiscuss.next()){
                            if (discussor.equals(userReDiscuss.getString("id"))) {

                                discuss.setNickname(userReDiscuss.getString("nickname"));
                                discuss.setProfession(userReDiscuss.getString("profession"));

                                break;
                            }
                        }
                        discussList.add(discuss);
                    }
                }
                userSmDiscuss.close();
                userReDiscuss.close();
                smDiscuss.close();
                reDiscuss.close();
                conDiscuss.close();
            } catch (Exception e) {

                e.printStackTrace();
            }
        %>
        <!--left 评论-->
        <div class="left" id="c_left1">
            <div class="s_tuijian">
            </div>
            <%--<hr/>--%>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评论内容</h3>
            <%
                if (discussList != null && discussList.size() > 0) {
                    for (int i = 0; i <discussList.size(); i++) {

            %>
                        <!--评论list-->
                        <div class="content_text">
                            <hr/>
                            <!--评论-->
                            <div class="wz">
                                <dl>
                                    <dd>
                                        <span>&nbsp;&nbsp;&nbsp;<%=i+1%>楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        <%
                                            if (userIdNow.equals(discussList.get(i).getDiscusserId())) {
                                        %>
                                                <a href="deletdiscuss.jsp?essayId=<%=essayId%>&discussId=<%=discussList.get(i).getId()%>&type=0" onclick='return confirm("确认要删除吗?")'>删除</a> <br/>
                                        <%
                                            }
                                        %>
                                        <p class="dd_text_2">
                                            <span class="left author"><%=discussList.get(i).getNickname()%></span>
                                            <span class="left fl">职业:<%=discussList.get(i).getProfession()%></span>
                                            <span class="left sj" style="width: 240px;">评论时间:<%=discussList.get(i).getDiscussTime()%></span>
                                        <div class="clear"></div>
                                        </p>
                                        <h4 style="margin-left: 30px;margin-bottom: 10px;font-size: 16px;"><%=discussList.get(i).getDiscussContent()%></h4>
                                    </dd>
                                    <div class="clear"></div>
                                </dl>
                            </div>
                            <!--评论 end-->
                        </div>
            <%
                    }
                }else {
            %>
                    </br><h4 align="center">目前还没有评论</h4></br>
            <%
                }
            %>



        </div>


    </div>
    <!--left end-->

    <!--right-->
    <div class="right" id="c_right">
        <div class="s_about">
            <h2>博主信息</h2>
            <img src="images/my1.jpg" width="100" height="100" alt="博主"/>
            <p>姓名：<%=user.getNickname()%></p>
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

        <div class="s_about"style="min-height: 250px;">
            <br/><h3 align="center">评论板</h3><br/>
            <form name id class="Form" action="senddiscuss.jsp?type=0" method="post">
                <span class="wordage">&nbsp;&nbsp;请填写评论&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题剩余字数：<span id="sy" style="color:Red;">60</span></span>
                <br />
                <input name="essayId" hidden="hidden" value="<%=essayId%>">
                <textarea id="TextArea1" name="discussStr" onkeyup="checkLengthT(this);" style="width:230px;min-height:100px;
                margin-left: 4px;font-size:16px;padding: 10px;"></textarea><br />

                <strong><input id="submindis" type="submit" value="发表评论" style="color:#fff;float:left;font-size:17px;background:#4B9CDD ;margin-left: 93px;"></strong>

            </form>
            <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
            <script type="text/javascript">

                function checkLengthT(which) {
                    var maxChars = 60; //
                    if(which.value.length > maxChars){
                        alert("您输入的字数超过限制!");
                        // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
                        which.value = which.value.substring(0,maxChars);
                        return false;
                    }else{
                        var curr = maxChars - which.value.length; //250 减去 当前输入的
                        document.getElementById("sy").innerHTML = curr.toString();
                        return true;
                    }

                }
            </script>
        </div>
    </div>
    <!--right end-->
    <div class="clear"></div>
</div>


</body>
</html>
