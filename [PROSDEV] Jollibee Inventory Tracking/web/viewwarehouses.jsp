<%@page import="Database.Database"%>
<%@page import="Models.Warehouse"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header.html" %>
<%@ include file="topnav.html" %>
<%@ include file="leftnav.html" %>

<script type="text/javascript">
    function redirect(){
        location.href = "addwarehouse.jsp";
    }
</script>
<%
    ArrayList<Warehouse> warehouseList = (ArrayList<Warehouse>) request.getSession().getAttribute("warehouses");
    Warehouse warehouse;
%>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                View Warehouse List
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Warehouses</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-edit"></i> View Warehouse List
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Page Content -->
                    <div class="row">
                        <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                            <button id="add-item" class="btn btn-primary" onclick="redirect()">Add Warehouse</button>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-lg-12">

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th style="width: 100%;">Warehouse Name</th>
                                            <th style="text-align: right;">Location</th>
                                            <th style="text-align: right;"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="warehouseTableBody">

                                        <%
                                            for (int i = 0; i < warehouseList.size(); i++) {
                                                warehouse = warehouseList.get(i);
                                        %>
                                        <tr>
                                            <td><%=(i + 1)%></td>
                                            <td><button type="button" class="btn btn-link name"><%=warehouse.getName()%></button></td>
                                            <td style="text-align: right;"><%=warehouse.getLocation()%></td>
                                            <td style="white-space: nowrap">
                                                <a class="edit-button">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a class="delete-button" data-toggle="modal" 
                                                    data-target="#warehousesmodal" data-verdict="delete">
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

                    <div class="modal fade" id="warehousesmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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
