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
    <title>Create Customer Using Service</title>
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
    <h1 class="text-danger">Create Customer Using Service</h1>
</center>
<h2>
    <a href="customer_using?action=customer_using"><i class="fas fa-arrow-left"></i> Back </a>
</h2>
<h2>
    <a href="/"><i class="fas fa-arrow-left"></i> Back to Home</a>
</h2>
<p class="text-center">
    <c:if test='${requestScope["message"] != null}'>
        <span class="message  text-success">${requestScope["message"]}</span>
    </c:if>
</p>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Customer ID:</th>
                <td>
                    <select class="form-select" name="customer_id" aria-label="Default select example">
                        <option selected>Choose id of customer</option>
                        <c:forEach var="customer" items="${customerList}">
                            <option value="${customer.id}">${customer.id}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <th>Customer Name:</th>
                <td>
                    <select class="form-select" name="customer_name" aria-label="Default select example">
                        <option selected>Choose id of customer</option>
                        <c:forEach var="customer" items="${customerList}">
                            <option value="${customer.name}">${customer.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Contract ID:</th>
                <td>
                    <select class="form-select" name="contract_id" aria-label="Default select example">
                        <option selected>Choose id of contract</option>
                        <c:forEach var="contract" items="${contractList}">
                            <option value="${contract.contract_id}">${contract.contract_id}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Contract Start Date:</th>
                <td>
                    <input type="date" name="start_date" id="start_date" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Contract Detail ID:</th>
                <td>
                    <select class="form-select" name="contract_detail_id" aria-label="Default select example">
                        <option selected>Choose id of contract detail</option>
                        <c:forEach var="contract_detail" items="${contractDetailLíst}">
                            <option value="${contract_detail.contract_detail_id}">${contract_detail.contract_detail_id}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Attach Service ID:</th>
                <td>
                    <select class="form-select" name="attach_service_id" aria-label="Default select example">
                        <option selected>Choose attach service</option>
                        <c:forEach var="attach_service" items="${attachServiceList}">
                            <option value="${attach_service.id}">${attach_service.attach_service_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input class="bg-success" type="submit" name="action" value="add"/>
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
