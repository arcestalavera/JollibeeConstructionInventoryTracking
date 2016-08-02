<%@page import="Models.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header.html" %>
<%@ include file="topnav.jsp" %>
<%@ include file="leftnav.jsp" %>

<script type ="text/javascript">
    function redirect(id){
        if (id === -1)
            location.href = "HandleSupplier?action=redirect&type=add";
        else
            location.href = "Supplier?id=" + id;
    }
    
    function edit(id){
        location.href = "HandleSupplier?action=redirect&type=edit&id=" + id;
    }
</script>
<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Supplier.js"></script>
<%
    ArrayList<Supplier> supplierList = (ArrayList<Supplier>) request.getSession().getAttribute("suppliers");
    Supplier supplier;
%>
<div id="page-wrapper">

            <div class="container-fluid">
                
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            View Supplier List
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Suppliers</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> View Supplier List
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <!-- Page Content -->
                <div class="row">
                    <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                        <button id="add-item" class="btn btn-primary" onclick="redirect(-1)">Add Supplier</button>
                    </div>
                </div>

                <div class="row">

                    <div class="col-lg-12">

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th style="width: 100%;">Supplier Name</th>
                                        <th style="text-align: right;">Location</th>
                                        <th style="text-align: right;">Contact #</th>
                                        <th style="text-align: right;">Email Address</th>
                                        <th style="text-align: right;">Contact Person</th>
                                        <th style="text-align: right;"></th>
                                    </tr>
                                </thead>
                                <tbody id="supplierTableBody">
                                    <%
                                        for (int i = 0; i < supplierList.size(); i++) {
                                            supplier = supplierList.get(i);
                                    %>
                                    <tr id = "i<%= supplier.getSupplierID()%>">
                                        <td id ="supplier-count"><%=(i + 1)%></td>
                                        <td><button type="button" class="btn btn-link name" onclick="redirect(<%=supplier.getSupplierID()%>)"><%=supplier.getName()%></button></td>
                                        <td style="text-align: right;"><%=supplier.getLocation()%></td>
                                        <td style="text-align: right;"><%=supplier.getContactNumber()%></td>
                                        <td style="text-align: right;"><%=supplier.getEmailAddress()%></td>
                                        <td style="text-align: right;"><%=supplier.getContactPerson()%></td>
                                        <td id="supplier-actions" style="white-space: nowrap">
                                            <a class="edit-button" onclick="edit(<%= supplier.getSupplierID()%>)">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a id="d<%= supplier.getSupplierID()%>-<%=(i + 1)%>"class="delete-item delete-button" data-toggle="modal" 
                                               data-target="#suppliersmodal" data-verdict="delete">
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

                <div class="modal fade" id="suppliersmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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
