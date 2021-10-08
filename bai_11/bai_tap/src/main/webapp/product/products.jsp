<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/10/2021
  Time: 7:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h1>Product List</h1>
<h4>
    <a  href="${pageContext.request.contextPath}/product?action=create">Create new product</a>
</h4>
<h4>
    <a  href="${pageContext.request.contextPath}/product?action=search">Find Product by Name</a>
</h4>
<table class="table table-striped table-inverse table-responsive">
    <thead class="thead-inverse">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Producer</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><a
                    href="${pageContext.request.contextPath}/product?action=view&id=${product.id}">${product.id}</a>
            </td>
            <td scope="row"><a
                    href="${pageContext.request.contextPath}/product?action=view&id=${product.id}">${product.name}</a>
            </td>
            <td><a
                    href="${pageContext.request.contextPath}/product?action=view&id=${product.id}">${product.price}</a>
            </td>
            <td><a
                    href="${pageContext.request.contextPath}/product?action=view&id=${product.id}">${product.description}</a>
            </td>
            <td><a
                    href="${pageContext.request.contextPath}/product?action=view&id=${product.id}">${product.producer}</a>
            </td>
            <td><a href="${pageContext.request.contextPath}/product?action=edit&id=${product.id}">edit</a></td>
            <td><a href="${pageContext.request.contextPath}/product?action=delete&id=${product.id}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>