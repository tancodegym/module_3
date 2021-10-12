<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/10/2021
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>

<center>
    <h1>User Have Country ${country}</h1>

</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>

        </tr>
        <c:forEach var="user" items="${userCountry}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>

            </tr>

        </c:forEach>

    </table>
    <h1><a href="/">Back to User list</a></h1>
</div>

</body>
</html>
