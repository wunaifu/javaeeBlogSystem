package com.fu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by wunaifu on 2017/6/30.
 */
public class Utils {
    public static String DateURL = "jdbc:mysql://localhost:3306/blogsystem?useUnicode=true&characterEncoding=utf-8";
    public static void ConnectDatabase( Connection con,Statement sm,ResultSet re){
//        String url="jdbc:mysql://localhost:3306/blogsystem?useUnicode=true&characterEncoding=utf-8";
//        con = null;
//        sm = null;
//        re = null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            con= DriverManager.getConnection(url,"root","root");
//            sm=con.createStatement();
//        } catch (Exception e) {
//
//            e.printStackTrace();
//        }
    }
}
