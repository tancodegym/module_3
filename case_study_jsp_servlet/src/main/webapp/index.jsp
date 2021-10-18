<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/10/2021
  Time: 8:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Furama Resort</title>
    <!-- Required meta tags -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="row">
    <div class="col-12">
        <jsp:include page="/common/header.jsp"></jsp:include>
    </div>
</div>

<div class="row bg-secondary">
    <div class="col-12">
        <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/employee?action=employee">Employee</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/customers?action=customer">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/service?action=service">Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contract?action=contract">Contract</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/customer_using?action=customer_using">List Customer Using Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/contract_detail?action=contract_detailt">Contract Detail</a>
            </li>
            <li class="nav-item">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-primary" type="submit">Search</button>
                </form>
            </li>
        </ul>
    </div>
</div>

<div class="row ">
    <div class="col-3 bg-body">
        <div class="row">
            <iframe src="https://www.youtube.com/embed/PgvSSl4jm1U"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
            <h4>Furama Resort Đà Nẵng</h4>

        </div>
        <div class="row">
            <div class="col-12">
                <iframe src="https://www.youtube.com/embed/VzDrgGaXBjY"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                <h4>FURAMA RESORT DANANG, VIETNAM, 5 SAO BEACH RESORT</h4>

            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <iframe src="https://www.youtube.com/embed/JbiY06WhjyY"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                <h4>Resort Furama Đà Nẵng 2019</h4>

            </div>
        </div>

    </div>
    <div class="col-9 bg-light ">
        <div class="row">
            <div class="col-12 text-center">
                <img class="img-fluid" src="https://i.imgur.com/iky5E1S.jpg" alt="">
                <h2 style="font-size: 24px;color: #cbbe73;line-height: 36px;text-align: center;font-family:Playfair Display;font-weight:700;font-style:normal"
                    class="vc_custom_heading">KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI, FURAMA ĐÀ NẴNG, NỔI TIẾNG LÀ KHU NGHỈ
                    DƯỠNG ẨM THỰC TẠI VIỆT NAM.</h2>

            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12 bg-secondary text-center text-light">
        COVID 19 UPDATE: The safety and well-being are our utmost priority
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>