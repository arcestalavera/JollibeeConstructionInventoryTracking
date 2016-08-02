<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
<%@ include file="header.html"%>
<%@ include file="topnav.jsp"%>
<%@ include file="leftnav.jsp"%>

<%
    User seluser = (User) request.getSession().getAttribute("seluser");
%>

<script>
    function redirect(id) {
        if (id === -1) {
            //location for edit
        } else {
            if (id.substr(0, 1) === 'u') {
                location.href = "User?id=" + id.substr(1, id.length - 1);
            }
        }
    }
</script>
<div id="page-wrapper">

            <div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            View User Info
        </h1>

        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Users</a>
            </li>
            <li>
                <i class="fa fa-edit"></i> <a href="User">View User List</a>
            </li>
            <li class="active">
                <i class="fa fa-edit"></i> View User Information
            </li>
        </ol>
    </div>

</div>
<!-- /.row -->
<!-- Page Content -->
<div class="row">
    <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
        <button id="add-item" class="btn btn-primary">Edit User Details</button>
    </div>
</div>

<div class="row">
    <div class ="col-md-12">
        <h4 class = "text-info">Details of <%=seluser.getUsername()%></h4>
        <ul class = "list-group">
            <li class = "list-group-item"><b class = "text-info">Password: </b><%=seluser.getPassword()%></li>
            <li class = "list-group-item"><b class = "text-info">Type: </b><%=seluser.getType()%></li>
        </ul>
    </div>
</div><!-- end of .row -->

<%@ include file="footer.html"%>