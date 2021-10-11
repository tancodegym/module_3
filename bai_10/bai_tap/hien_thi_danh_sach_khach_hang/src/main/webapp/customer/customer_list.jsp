<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 07/10/2021
  Time: 10:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Display model.Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
</head>
<body>
<h1 class="text-center text-primary  ">List model.Customer</h1>
<table class="table table-striped">

    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Date of Birth</th>
        <th scope="col">Address</th>
        <th scope="col">Picture</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}">
    <tr>
        <th scope="row">${customer.name}</th>
        <td>${customer.dateOfBirth}</td>
        <td>${customer.address}</td>
        <td><img class="img-fluid" style="width:150px;height: 150px" src="${customer.picture}" alt=""></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.min.js"
        integrity="sha384-PsUw7Xwds7x08Ew3exXhqzbhuEYmA2xnwc8BuD6SEr+UmEHlX8/MCltYEodzWA4u"
        crossorigin="anonymous"></script>
</body>
</html>
