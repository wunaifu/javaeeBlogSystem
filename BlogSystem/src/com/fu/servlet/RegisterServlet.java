package com.fu.servlet;

import com.fu.utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by wunaifu on 2017/7/6.
 */
@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String profession = request.getParameter("profession");

        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>注册验证</TITLE></HEAD>");
        out.println("  <BODY>");

        if("".equals(phone) ||"".equals(password)||"".equals(profession)){

            out.println("</br></br><h3 align='center'>填写内容不能为空</h3></br>");
            out.println("<p align='center'><a href='javascript:history.back();'  >返回</a></p>");

        }else{
            boolean flag = false;

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
                while(re.next()) {
                    if (phone.equals(re.getString("phone"))) {
                        flag = true;
                    }
                }
                if (flag == false) {
                    //未有该号码，进行注册
                    sm.execute("insert into user_tab(phone,password,type,profession) values('"+phone+"','"+password+"','0','"+profession+"')");
                    out.println("</br></br><h3 align='center'>注册成功，请<a href='http://localhost:8080/BlogSystem/index.jsp'  >登录</a>或者<a href='javascript:history.back();'  >返回</a>注册页面</h3></br>");

                }else {
                    //已有该号码，注册失败
                    out.println("</br></br><h3 align='center'>已存在该账号，请返回填写信息</h3></br>");
                    out.println("<p align='center'><a href='javascript:history.back();'  >返回</a></p>");
                }

                sm.close();
                con.close();
            } catch (Exception e) {

                e.printStackTrace();
            }
        }


//        response.sendRedirect("http://localhost:8080/BlogSystem/index.jsp");

        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
