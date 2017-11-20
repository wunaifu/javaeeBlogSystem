package com.fu.servlet;

import com.fu.utils.Utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static java.awt.SystemColor.window;

/**
 * Created by wunaifu on 2017/6/30.
 */
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

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

        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>登录验证</TITLE></HEAD>");
        out.println("  <BODY>");

        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        if("".equals(phone) ||"".equals(password)){

            out.println("</br></br><h3 align='center'>账号密码不能为空</h3></br>");
            out.println("<p align='center'><a href='javascript:history.back();'  >返回</a></p>");

        }else{
            try {
                re = sm.executeQuery("select * from user_tab");
                boolean flag = false;
                while(re.next()){
                	String ph=re.getString("phone");
                    if (ph.equals(phone)) {
                        flag = true;
                        String psw=re.getString("password");
                        String type = re.getString("type");
                        if (psw.equals(password)) {
                            Cookie idCk = new Cookie("id",URLEncoder.encode(re.getString("id"), "UTF-8"));
                            Cookie phoneCk = new Cookie("phone", URLEncoder.encode(phone, "UTF-8"));
                            Cookie nameCk = new Cookie("name", URLEncoder.encode(re.getString("name"), "UTF-8"));
                            Cookie nicknameCk = new Cookie("nickname", URLEncoder.encode(re.getString("nickname"), "UTF-8"));
                            Cookie typenameCk = new Cookie("type", URLEncoder.encode(type, "UTF-8"));
//                            System.out.println(re.getString("name"));
                            idCk.setMaxAge(60*60*24);
                            phoneCk.setMaxAge(60*60*24);
                            nameCk.setMaxAge(60*60*24);
                            nicknameCk.setMaxAge(60*60*24);
                            typenameCk.setMaxAge(60*60*24);

                            idCk.setPath(path);
                            phoneCk.setPath(path);
                            nameCk.setPath(path);
                            nicknameCk.setPath(path);
                            typenameCk.setPath(path);

                            response.addCookie(idCk);
                            response.addCookie(phoneCk);
                            response.addCookie(nameCk);
                            response.addCookie(nicknameCk);
                            response.addCookie(typenameCk);
                            if (type.equals("0")) {
                                response.sendRedirect("http://localhost:8080/BlogSystem/views/homepage.jsp");
                            }else {
                                response.sendRedirect("http://localhost:8080/BlogSystem/views/managerpage.jsp");
                            }
//                            request.getRequestDispatcher("http://localhost:8080/BlogSystem/views/homepage.jsp").forward(request,response);
                        }
                        else {
                            out.println("</br></br><h3 align='center'>密码错误</h3></br>");
                            out.println("<p align='center'><a href='javascript:history.back();'  >返回</a></p>");
                        }
                        break;
                    }else {

                    }
                }
                if (flag == false) {
                    out.println("</br></br><h3 align='center'>账号错误</h3></br>");
                    out.println("<p align='center'><a href='javascript:history.back();'  >返回</a></p>");
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
        try {
            re.close();
            sm.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
