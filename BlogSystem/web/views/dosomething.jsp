<%--
  Created by IntelliJ IDEA.
  User: wunaifu
  Date: 2017/7/6
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,java.lang.*" isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


    <title>操作提示</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<h3 align="center">操作提示信息</h3>
<div>
    <p align="center"><%= exception.toString() %></p>
    <p align="center"><a href="javascript:history.back();"  >返回</a></p>
</div>
</body>
</html>

