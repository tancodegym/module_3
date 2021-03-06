<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13/10/2021
  Time: 9:47 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Contract</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

</head>
<body>
<div class="row">
    <div class="col-12">
        <jsp:include page="../common/header.jsp"></jsp:include>
    </div>
</div>
<center>
    <h1 class="text-danger">Create Contract</h1>
</center>
<h2>
    <a href="contract?action=contract"><i class="fas fa-arrow-left"></i> Back to Contract Page</a>
</h2>
<h2>
    <a href="/"><i class="fas fa-arrow-left"></i> Back to Home</a>
</h2>

<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Start Date:</th>
                <td>
                    <input type="date" name="start_date" value="${start_date}"/>
                    <c:if test="${mapMessage.get('startDate') != null}">
                        <small  class="form-text text-danger">${mapMessage.get('startDate')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>End Date:</th>
                <td>
                    <input type="date" name="end_date" value="${end_date}"/>
                    <c:if test="${mapMessage.get('endDate') != null}">
                        <small  class="form-text text-danger">${mapMessage.get('endDate')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Contract Deposit:</th>
                <td>
                    <input type="text" name="deposit" value="${deposit}"/>
                    <c:if test="${mapMessage.get('deposit') != null}">
                        <small  class="form-text text-danger">${mapMessage.get('deposit')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Employee Name:</th>
                <td>
                    <select class="form-select" name="employee_id" aria-label="Default select example">
                        <option selected>Choose Employee</option>
                        <c:forEach var="type" items="${employeeList}">
                            <c:choose>
                                <c:when test="${type.id == employee_id}">
                                    <option value="${type.id}" selected>${type.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${type.id}">${type.name}</option>
                                </c:otherwise>

                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <select class="form-select" name="customer_id" aria-label="Default select example">
                        <option selected>Choose Customer</option>
                        <c:forEach var="type" items="${customerList}">
                                <c:choose>
                                    <c:when test="${type.id == customer_id}">
                                        <option value="${type.id}" selected>${type.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.id}">${type.name}</option>
                                    </c:otherwise>
                                </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Service Name:</th>
                <td>
                    <select class="form-select" name="service_id" aria-label="Default select example">
                        <option selected>Choose Service</option>
                        <c:forEach var="type" items="${serviceList}">
                            <c:choose>
                                <c:when test="${type.service_id == service_id}">
                                    <option value="${type.service_id}" selected>${type.service_name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${type.service_id}">${type.service_name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="bg-success" type="submit" name="action" value="Create"/>
                </td>
            </tr>
        </table>

    </form>
</div>

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
