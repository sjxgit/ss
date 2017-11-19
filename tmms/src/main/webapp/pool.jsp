<%--
  Created by IntelliJ IDEA.
  User: java
  Date: 2017-11-6
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="application/msexcel; charset=utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--导出数据的文本名--%>
<%
    response.setHeader("Content-disposition","attachment; filename=stu.xls");

%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="application/msexcel;charset=utf-8"/>     <%--json导出的格式是application--%>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>

</head>
<body>
<tr>
    <td>角色编码</td>
    <td>角色名称</td>
</tr>
    <c:forEach var="item" items="${list}">
        <tr>
            <td>${item.rid}</td>
            <td>${item.rolename}</td>
        </tr>
    </c:forEach>
</body>
</html>
