<%@page import="Models.User"%>
<%@ include file="header.html"%>
<%@ include file="topnav.html"%>
<%@ include file="leftnav.html" %>

<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/User.js"></script>
<%
    String action;
    try {
        action = request.getSession().getAttribute("action").toString();
    } catch (NullPointerException ex){
        action = "add";
    }
    User user = new User();
    String label = null;
    if (action.equals("edit")) {
        user = (User) request.getSession().getAttribute("user");
        label = "Edit User";
    } else if (action.equals("add")) {
        label = "Add User";
    }
%>
<!-- Page Heading -->
<div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <%=label%>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Users</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-pencil-square-o"></i> 
                                <%=label%>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Page Content -->
                <div id="error" class="alert alert-warning">
                </div>
                
                <div id = "add-users-div" class="row">
                    <div class="col-lg-12">
                        <%
                            if (action.equals("add")) {
                        %>
                        <form id="add-user-form" class = "add-users-form" onsubmit = "return addUser()" method = "POST">
                            <%
                            } else if (action.equals("edit")) {
                            %>
                            <form id="add-user-form" class = "add-users-form" onsubmit = "return editUser(<%=user.getUserID()%>)" method = "POST">
                                <%
                                    }
                                %>
                                <div class="form-group">
                                    <label>Username</label>
                                    <%                if (action.equals("add")) {
                                    %>
                                    <input id = "uname" class="form-control" name="uname" required>
                                    <%
                                    } else if (action.equals("edit")) {
                                    %>
                                    <input id = "uname" class="form-control" name="uname" value = "<%=user.getUsername()%>"required>
                                    <%
                                        }
                                    %>
                                </div><!-- end of .form-group -->
                                <div class="form-group">
                                    <label>Name of User</label>
                                    <%                if (action.equals("add")) {
                                    %>
                                    <input id="name" class="form-control" name="name" required>
                                    <%
                                    } else if (action.equals("edit")) {
                                    %>
                                    <input id="name" class="form-control" name="name" value="<%=user.getFullName()%>" required>
                                    <%
                                        }
                                    %>
                                </div><!-- end of .form-group -->
                                <div class="form-group">
                                    <label>User type</label>
                                    <select id="utype" class="form-control">
                                        <option value="0" selected>Administrator</option>
                                        <option value="1">Inventory Manager</option>
                                        <option value="2">External Officer for Supplier</option>
                                        <option value="3">API Client</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <%                if (action.equals("add")) {
                                    %>
                                    <input type="password" id="password" class="form-control" name="pass" required>
                                    <%
                                    } else if (action.equals("edit")) {
                                    %>
                                    <input type="password" id="password" class="form-control" name="pass" value="<%=user.getPassword()%>" required>
                                    <%
                                        }
                                    %>
                                </div><!-- end of .form-group -->
                                <input type="submit" class="btn btn-primary" value="<%=label%>">
                            </form>
                    </div>
                </div>

<%@ include file="footer.html"%>
