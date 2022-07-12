<%-- 
    Document   : Edit-Ticket
    Created on : Jul 12, 2022, 10:51:38 PM
    Author     : WahyuAu
--%>
<%@page import="Helper.StringHelper"%>
<%@page import="Controller.AccountController"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page='layouts/head.jsp'>
        <jsp:param name="title" value="Homepage" />
    </jsp:include>
    <style>
        .input-group-append {
            cursor: pointer;
        }
    </style>
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css">

</head>

<body class="d-flex flex-column h-100">
    <jsp:include page='layouts/navbar.jsp'></jsp:include>

        <% while(rs.next()) { %>
            <!-- Begin page content -->
            <main class="flex-shrink-0">
                <div class="container">
                    <h1 class="mt-5">Edit Ticket -
                        <%= rs.getString("name") %>
                    </h1>
                    <p class="lead">Edit Ticket
                        <%= rs.getString("name")  %> Ubah detail Ticket</p>
                    <div class="row pt-5">
                        <div class="col-12">
                            <form method="POST" action="edit">
                                <input type="hidden" name="id" value="<%= rs.getString(" id ")%>" />
                                <div class="mb-3">
                                    <label class="form-label">Name</label>
                                    <input type="text" class="form-control" placeholder="Enter your name" name="name" required value="<%= rs.getString(" name ")%>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Age</label>
                                    <input type="number" min="0" class="form-control" placeholder="Enter your Age" name="age" required value="<%= rs.getString(" price ") %>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Gender</label>
                                    <select class="form-select" aria-label="Default select example" name="Gender" required>
                                    <option value="Male" 
                                            <%= rs.getString("product_type") == "Male" ? "selected" : ""%>
                                            >Male</option>
                                    <option value="Female"
                                            <%= rs.getString("product_type") == "Female" ? "selected" : ""%>
                                            >Female</option>
                                    <option value="PreferNotToSay"
                                            <%= rs.getString("product_type") == "PreferNotToSay" ? "selected" : ""%>
                                            >PreferNotToSay</option>
                                </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone number</label>
                                    <input type="number" min="0" class="form-control" placeholder="Enter Your Phone number" name="number" required value="<%= rs.getString(" number ") %>">
                                </div>
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary btn-small btn-rounded">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
            <% } %>


                <jsp:include page='layouts/footer.jsp'></jsp:include>
                <jsp:include page='layouts/scripts.jsp'></jsp:include>
                <script src="https://unpkg.com/js-datepicker"></script>


</body>

</html>
