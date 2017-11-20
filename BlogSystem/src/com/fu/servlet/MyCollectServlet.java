package com.fu.servlet;

import com.fu.model.Essay;
import com.fu.utils.TimeUtil;
import com.fu.utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wunaifu on 2017/7/5.
 */
@WebServlet(name = "MyCollectServlet")
public class MyCollectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dop(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dop(request,response);
    }

    public void dop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String userId = "";
        String userName = "";
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
            while(re.next()){
                if (userId.equals(re.getString("collectorId"))) {
                    if (essayId.equals(re.getString("essayId"))) {
                        //已收藏
                        flag = true;
                        break;
                    }
                }
            }
            if (flag == false) {
                //未收藏时，
                sm.execute("insert into collect_tab(essayId,collectorId,collectTime) valuse("+essayId+","+userId+","+TimeUtil.dateToString(new Date())+")");
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
        response.sendRedirect("http://localhost:8080/BlogSystem/views/homepage.jsp");
//        response.sendRedirect("http://localhost:8080/BlogSystem/views/essayinfo.jsp?essayId=" + essayId);
//        request.setAttribute( "ValueA","sdaf");
//        request.getRequestDispatcher( "http://localhost:8080/BlogSystem/views/essayinfo.jsp").forward(request,response);
    }
}
