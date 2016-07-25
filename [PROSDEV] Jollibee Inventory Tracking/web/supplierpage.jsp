<%@page import="Models.Supplier"%>
<%@page import="Models.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header.html"%>
<%@ include file="topnav.jsp"%>
<%@ include file="leftnav.html"%>

<%
    Supplier supplier = (Supplier) request.getSession().getAttribute("supplier");
    ArrayList<Item> itemList = supplier.getItemList();
    Item item;
%>
<script type ="text/javascript">
    function edit(id){
        location.href = "HandleSupplier?action=redirect&type=edit&id=" + id;
    }
    
    function delete(id){
        location.href = "HandleSupplier?actiondeleteFrmView&id=" + id;
    }
</script>
<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Supplier.js"></script>
<div id="page-wrapper">

            <div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <%=supplier.getName()%>
        </h1>

        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Suppliers</a>
            </li>
            <li>
                <i class="fa fa-edit"></i> <a href="Supplier">View Supplier List</a>
            </li>
            <li class="active">
                <i class="fa fa-edit"></i> View Supplier Information
            </li>
        </ol>
    </div>

</div>
<!-- /.row -->
    <!-- Page Content -->
    <div class="row">
        <div class ="col-lg-12">
            <h4 class = "text-info">About <%=supplier.getName()%></h4>
            <ul class = "list-group">
                <li class = "list-group-item"><b class = "text-info">Location: </b> <%=supplier.getLocation()%></li>
                <li class = "list-group-item"><b class = "text-info">Contact Number: </b> <%=supplier.getContactNumber()%></li>
                <li class = "list-group-item"><b class = "text-info">Email Address: </b> <%=supplier.getEmailAddress()%></li>
                <li class = "list-group-item"><b class = "text-info">Contact Person: </b> <%=supplier.getContactPerson()%></li>
            </ul>
        </div>
    </div><!-- end of .row -->
    
    <div class="row">
        <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
            <button id="d<%= supplier.getSupplierID()%>" class="delete-supplier delete-button btn btn-primary" data-toggle="modal"
                    data-target="#viewsuppliersmodal" data-verdict="delete">Delete Item</button>
            <button id="add-item" class="btn btn-primary" onclick="edit(<%= supplier.getSupplierID()%>)">Edit Supplier Details</button>
        </div>
    </div>
        
    <div class ="row">
        <div class="col-md-12">
            <h4>Items supplied by <%=supplier.getName()%></h4>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="width: 100%;">Item Name</th>
                            <th style="width: 100%;">Description</th>
                            <th style="text-align: right;">Unit Measure</th>
                            <th style="text-align: right;"></th>
                        </tr>
                    </thead>

                    <tbody id="itemTableBody">
                        <%
                            for (int i = 0; i < itemList.size(); i++) {
                                item = itemList.get(i);
                        %>
                        <tr>
                            <td><%=(i + 1)%></td>

                            <td><button type="button" class="btn btn-link name"><%=item.getName()%></button></td>
                            <td style="text-align: right;"><%=item.getDescription()%></td>
                            <td style="text-align: right;"><%=item.getUnit()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div><!-- end of .table-responsive -->
        </div><!-- end of .col-md-12 -->
    </div><!-- end of .row-->
    
    <div class="modal fade" id="viewsuppliersmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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
