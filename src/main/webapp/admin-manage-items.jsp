<%@ page import="com.model.Item" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Pasindu Dinal
  Date: 11/1/2022
  Time: 7:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./employee-header.jsp" %>
<html>
<head>
    <title>Food Items</title>
    <link rel="stylesheet" href="styles/button.css">
</head>
<body>
<%
    // HTTP 1.1
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    // HTTP 1.0
    response.setHeader("Pragma", "no-cache");
    // Proxies
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("./employee.jsp");
    }
%>
<%@include file="./employee-manage-orders-header.jsp" %>

<h2 class="display-3 text-center">Food Items</h2>
<a href = "admin-manage-items-create.jsp" >Create +</a>
<%
    ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
    if(items.size() > 0){
%>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Image</th>
        </tr>
        </thead>
        <tbody>
            <%
            for(int i = 0; i < items.size(); i++) {
                    out.print("<tr>" +
                            "<td>" + items.get(i).getId() + "</td>" +
                            "<td>" + items.get(i).getName() + "</td>" +
                            "<td>" + items.get(i).getQty() + "</td>" +
                            "<td>" + items.get(i).getPrice() + "</td>" +
                            "<td>" + items.get(i).getImage() + "</td>" +
                            "<td>" +
                                "<a class='mBtn btn btn-warning' href='ItemsUpdate?id=" + items.get(i).getId() + "'>Update</a>" +
                                "<a class='mBtn btn btn-danger'href='ItemsDelete?id=" + items.get(i).getId() + "'>Delete</a>" +
                            "</td>" +
                            "</tr>");
            }
            out.print("</tbody></table>");
    }else{ %>
        <div class="container alert alert-primary" role="alert">
            <p class="text-center">No Items!</p>
        </div>
            <% } %>
</div>
<%
    try {
        String status = (String) request.getAttribute("updateStatus");
        if(!status.equals(null)){
            if(status.equalsIgnoreCase("success")){
%>
<script>
    swal({
        title: "Order is updated!",
        icon: "success",
        button: "Ok",
    });
</script>
<%
}else{
%>
<script>
    swal({
        title: "Order is not updated!",
        icon: "error",
        button: "Ok",
    });
</script>
<%
            }
        }
        request.removeAttribute("updateStatus");
    }catch (Exception e){
        e.printStackTrace();
    }
%>
<%
    try {
        String status = (String) request.getAttribute("deleteStatus");
        if(!status.equals(null)){
            if(status.equalsIgnoreCase("success")){
%>
<script>
    swal({
        title: "Order is deleted!",
        icon: "success",
        button: "Ok",
    });
</script>
<%
}else{
%>
<script>
    swal({
        title: "Order is not deleted!",
        icon: "error",
        button: "Ok",
    });
</script>
<%
            }
        }
        request.removeAttribute("deleteStatus");
    }catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>
