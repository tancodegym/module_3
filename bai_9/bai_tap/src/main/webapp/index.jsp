<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 06/10/2021
  Time: 4:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>

  <h1> Product Discount Calculator</h1>
  <form action="/discount" method="post">
    <table>
      <tr>
        <td>Product Description :</td>
        <td>
          <input type="text" name="description" >
        </td>
      </tr>
      <tr>
        <td>List Price :</td>
        <td>
          <input type="text" name="price" >
        </td>
      </tr>
      <tr>
        <td>Discount Percent :</td>
        <td>
          <input type="text" name="percent" >
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button type="submit">Calculate Discount</button>
        </td>
      </tr>
    </table>
  </form>
  </body>
</html>
