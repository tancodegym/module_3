<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13/10/2021
  Time: 8:40 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <jsp:include page="../common/header.jsp"></jsp:include>
        </div>
    </div>

    <div class="row bg-secondary">
        <div class="col-12">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/service?action=create_service">Add Service </a>
                </li>


            </ul>
        </div>
    </div>
    <div class="row text-center bg-primary">
        <div class=col-12><h2>List of Service</h2></div>
    </div>
    <div class="row">
        <div class="col-3">123abc</div>
        <div class="col-9">
            <table id="tableCustomer" class="table table-striped" style="display: inline-block; width: 100%; overflow-x: auto">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Cost</th>
                    <th>Max People</th>
                    <th>Rent Type</th>
                    <th>Service Type</th>
                    <th>Room Standard</th>
                    <th>Description</th>
                    <th>Pool Area</th>
                    <th>Number of Floor</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="service" items="${listService}">
                    <tr>
                        <td><c:out value="${service.service_id}"/></td>
                        <td><c:out value="${service.service_name}"/></td>
                        <td><c:out value="${service.service_area}"/></td>
                        <td><c:out value="${service.service_cost}"/></td>
                        <td><c:out value="${service.service_max_people}"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${service.rent_type_id==1}">Year</c:when>
                                <c:when test="${service.rent_type_id==2}">Month</c:when>
                                <c:when test="${service.rent_type_id==3}">Day</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${service.service_type_id==1}">Villa</c:when>
                                <c:when test="${service.service_type_id==2}">House</c:when>
                                <c:when test="${service.service_type_id==3}">Room</c:when>
                            </c:choose>
                        </td>
                        <td><c:out value="${service.standard_room}"/></td>
                        <td><c:out value="${service.description}"/></td>
                        <td><c:out value="${service.pool_area}"/></td>
                        <td><c:out value="${service.number_of_floors}"/></td>
<%--                        <td>--%>
<%--                            <a href="/service?action=edit&id_edit=${service.service_id}">--%>
<%--                                <button class="btn btn-primary" type="button">Edit--%>
<%--                                </button>--%>
<%--                            </a>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <button onclick="onDelete('${service.service_id}')" type="button" class="btn btn-danger"--%>
<%--                                    data-toggle="modal" data-target="#modelId">Delete--%>
<%--                            </button>--%>
<%--                        </td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <h1 class="text-primary text-center">${messageFind}</h1>

    </div>
<%--</div>--%>

<%--<!-- Modal -->--%>
<%--<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">Confirm Delete</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <form action="/customers">--%>
<%--                <input type="hidden" name="action" value="delete">--%>
<%--                <input type="hidden" name="idCustomer" id="idCustomer">--%>
<%--                <div class="modal-body">--%>
<%--                    <div class="container-fluid">--%>
<%--                        Are you sure to delete?--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                    <button type="submit" class="btn btn-danger">Delete</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.min.js"
        integrity="sha384-PsUw7Xwds7x08Ew3exXhqzbhuEYmA2xnwc8BuD6SEr+UmEHlX8/MCltYEodzWA4u"
        crossorigin="anonymous"></script>
<script>
    // function onDelete(id) {
    //     document.getElementById("idCustomer").value = id;
    // }
    // function onSearch() {
    //     let a = document.getElementById("select").value;
    //     let b = document.getElementById("search").value;
    //     document.getElementById("idSearch").value = a;
    //     document.getElementById("content_search").value = b;
    // }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    $('#exampleModal').on('show.bs.modal', event => {
        var button = $(event.relatedTarget);
        var modal = $(this);
    });
</script>

</body>
</html>
