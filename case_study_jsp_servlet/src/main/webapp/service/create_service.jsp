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
    <title>Create Customer</title>
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
    <h1 class="text-danger">Create Service</h1>
</center>
<h2>
    <a href="service?action=service"><i class="fas fa-arrow-left"></i> Back to Service Page</a>
</h2>
<h2>
    <a href="/"><i class="fas fa-arrow-left"></i> Back to Home</a>
</h2>

<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Service Name:</th>
                <td>
                    <input type="text" required name="name" value="${service_name}"/>
                    <c:if test="${mapMessage.get('name') != null}">
                        <small  class="form-text text-danger">${mapMessage.get('name')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Service Area:</th>
                <td>
                    <input type="text" name="area" required value="${service_area}"/>
                    <c:if test="${mapMessage.get('area') != null}">
                        <small  class="form-text text-danger">${mapMessage.get('area')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Service Cost:</th>
                <td>
                    <input type="text" name="cost" required value="${service_cost}"/>
                    <c:if test="${mapMessage.get('cost') != null}">
                        <small class="form-text text-danger">${mapMessage.get('cost')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Service Max People:</th>
                <td>
                    <input type="text" name="max_people" required value="${service_people}"/>
                    <c:if test="${mapMessage.get('maxPeople') != null}">
                        <small class="form-text text-danger">${mapMessage.get('maxPeople')}</small>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Rent Type:</th>
                <td>
                    <select class="form-select" name="rent_type_id" aria-label="Default select example">
                        <option selected>Choose type of rent</option>
                        <c:forEach var="type" items="${typeRent}">
                            <c:choose>
                                <c:when test="${type.rent_type_id == rent_type_id}">
                                    <option value="${type.rent_type_id}" selected>${type.rent_type_name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${type.rent_type_id}">${type.rent_type_name}</option>
                                </c:otherwise>

                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Service Type:</th>
                <td>
                    <select class="form-select" name="service_type_id" aria-label="Default select example">
                        <option selected>Choose type of service</option>
                        <c:forEach var="type" items="${typeService}">
                            <c:choose>
                                <c:when test="${type.service_type_id == service_type_id}">
                                    <option value="${type.service_type_id}" selected>${type.service_name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${type.service_type_id}">${type.service_name}</option>
                                </c:otherwise>

                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Standard Room:</th>
                <td>
                    <input type="text" name="standard_room" required value="${standard_room}"/>
                </td>
            </tr>
            <tr>
                <th>Decription:</th>
                <td>
                    <input type="text" name="description" required value="${description}"/>
                </td>
            </tr>
            <tr>
                <th>Pool Area:</th>
                <td>
                    <input type="text" name="pool_area" value="${pool_area}"/>
                    <c:if test="${mapMessage.get('poolArea') != null}">
                        <small class="form-text text-danger">${mapMessage.get('poolArea')}</small>
                    </c:if>

                </td>
            </tr>
            <tr>
                <th>Number of Floors:</th>
                <td>
                    <input type="text" name="number_floor" required value="${number_floor}"/>
                    <c:if test="${mapMessage.get('numberOfFloor') != null}">
                        <small class="form-text text-danger">${mapMessage.get('numberOfFloor')}</small>
                    </c:if>
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
