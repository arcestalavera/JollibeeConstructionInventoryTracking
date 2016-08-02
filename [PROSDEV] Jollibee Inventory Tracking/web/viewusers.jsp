<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header.html" %>
<%@ include file="topnav.jsp" %>
<%@ include file="leftnav.jsp" %>

<script type ="text/javascript">
    function redirect(id) {
        if (id === -1)
            location.href = "HandleUser?action=redirect&type=add";
        else
            location.href = "User?id=" + id;
    }
    
    function edit(id){
        location.href = "HandleUser?action=redirect&type=edit&id=" + id;
    }
</script>
<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Item.js"></script>
<%
    ArrayList<User> userList = (ArrayList<User>) request.getSession().getAttribute("users");
    User user;
%>
<div id="page-wrapper">

            <div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            View User List
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Users</a>
            </li>
            <li class="active">
                <i class="fa fa-edit"></i> View User
        </ol>
    </div>
</div>
<!-- /.row -->

<!-- Page Content -->
<div class="row">

    <div class="row">
        <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
            <button id="add-item" class="btn btn-primary" onclick="redirect(-1)">Add User</button>
        </div>
    </div>

    <div class="col-lg-12">

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th style="width: 100%;">Username</th>
                        <th style="text-align: right;">Type</th>
                        <th style="text-align: right;"></th>
                    </tr>
                </thead>
                <tbody id="itemTableBody">
                    <%
                        for (int i = 0; i < userList.size(); i++) {
                            user = userList.get(i);
                    %>
                    <tr id = "i<%=user.getUserID()%>">
                        <td id ="item-count"><%=(i + 1)%></td>

                        <td><button type="button" class="btn btn-link name" onclick = "redirect(<%=user.getUserID()%>)"><%=user.getUsername()%></button></td>
                        <td style="text-align: right;"><%=user.getType()%></td> <!--getUnit-->
                        <td id = "item-actions" style="white-space: nowrap">
                            <a class="edit-button" onclick="edit(<%=user.getUserID()%>)">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a id = "d<%=user.getUserID()%>-<%=(i + 1)%>" class="delete-item delete-button" data-toggle="modal" 
                               data-target="#itemsmodal" data-verdict="delete">
                                <i class="fa fa-trash-o"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div><!-- end of .table-responsive -->

    </div><!-- end of .col-lg-12 -->

</div><!-- end of .row -->

<div class="modal fade" id="itemsmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h4 class="modal-title" id="modal-message"></h4>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.html"%>
