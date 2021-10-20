<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13/10/2021
  Time: 7:53 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Employee</title>
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
    <h1 class="text-primary">Edit Employee</h1>
</center>
<h2>
    <a href="employee?action=employee"><i class="fas fa-arrow-left"></i> Back to Employee Page</a>
</h2>
<h2>
    <a href="/"><i class="fas fa-arrow-left"></i> Back to Home</a>
</h2>
<h1 class="text-center">
    <c:if test='${requestScope["message"] != null}'>
        <span class="message  text-success">${requestScope["message"]}</span>
    </c:if>
</h1>
<c:if test='${requestScope["message"] == null}'>
    <span class="message  text-success">${requestScope["message"]}</span>
    <div align="center">
        <form method="post">
            <table border="1" cellpadding="5">
                <c:if test="${employee != null}">
                    <input type="hidden" name="id" value="<c:out value='${employee.id}' />"/>
                </c:if>
                <tr>
                    <th>Employee Name:</th>
                    <td>
                        <input type="text" name="name" value="${name}" />
                        <c:if test="${mapMessage.get('name') != null}">
                        <small id="name" class="form-text text-danger">${mapMessage.get('name')}</small>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>User Name:</th>
                    <td>
                        <select class="form-select" name="username" required  aria-label="Default select example">
                            <option value="">Choose user name of employee</option>
                            <c:forEach var="type" items="${user}">
                                <c:choose>
                                    <c:when test="${type.username == username}">
                                        <option value="${type.username}" selected>${type.username}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.username}">${type.username}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Salary:</th>
                    <td>
                        <input type="text" name="salary" value="${salary}" />
                        <c:if test="${mapMessage.get('salary') != null}">
                            <small id="salary" class="form-text text-danger">${mapMessage.get('salary')}</small>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>Employee Birthday:</th>
                    <td>
                        <input type="date" name="birthday" value="${birthday}" />
                        <c:if test="${mapMessage.get('birthday') != null}">
                            <small id="salary" class="form-text text-danger">${mapMessage.get('birthday')}</small>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>Employee ID Card:</th>
                    <td>
                        <input type="text" name="idCard" value="${idCard}" />
                        <c:if test="${mapMessage.get('idCard') != null}">
                            <small id="salary" class="form-text text-danger">${mapMessage.get('idCard')}</small>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>Employee Number Phone:</th>
                    <td>
                        <input type="text" name="phone"  value="${phone}"/>
                        <c:if test="${mapMessage.get('phone') != null}">
                            <small id="salary" class="form-text text-danger">${mapMessage.get('phone')}</small>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>Employee Email:</th>
                    <td>
                        <input type="text" name="email"  value="${email}" />
                        <c:if test="${mapMessage.get('email') != null}">
                            <small id="salary" class="form-text text-danger">${mapMessage.get('email')}</small>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>Employee Address:</th>
                    <td>
                        <input type="text" name="address" value="${address}"  />
                        <c:if test="${mapMessage.get('address') != null}">
                            <small id="salary" class="form-text text-danger">${mapMessage.get('address')}</small>
                        </c:if>
                    </td>
                </tr>

                <tr>
                    <th>Division:</th>
                    <td>
                        <select class="form-select" required name="division" aria-label="Default select example">
                            <option value="">Choose division of employee</option>
                            <c:forEach var="type" items="${division}">
                                <c:choose>
                                    <c:when test="${type.division_id == division_id}">
                                        <option value="${type.division_id}" selected>${type.division_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.division_id}">${type.division_name}</option>
                                    </c:otherwise>

                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Position:</th>
                    <td>
                        <select class="form-select" required name="position" aria-label="Default select example">
                            <option value="">Choose position of employee</option>
                            <c:forEach var="type" items="${position}">
                                <c:choose>
                                    <c:when test="${type.position_id == position_id}">
                                        <option value="${type.position_id}" selected>${type.position_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.position_id}">${type.position_name}</option>
                                    </c:otherwise>

                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Education Degree:</th>
                    <td>
                        <select class="form-select" required name="education" aria-label="Default select example">
                            <option value="">Choose position of employee</option>
                            <c:forEach var="type" items="${education}">
                                <c:choose>
                                    <c:when test="${type.education_id == education_id}">
                                        <option value="${type.education_id}" selected>${type.education_name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${type.education_id}">${type.education_name}</option>
                                    </c:otherwise>

                                </c:choose>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input class="bg-success" type="submit" name="action" value="Edit"/>
                    </td>
                </tr>


            </table>

        </form>



    </div>
</c:if>
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
