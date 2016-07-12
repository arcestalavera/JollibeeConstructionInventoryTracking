<%@page import="Models.Warehouse"%>
<%@page import="Models.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Item"%>
<%@ include file="header.html"%>
<%@ include file="topnav.jsp"%>
<%@ include file="leftnav.html"%>

<%
    Item item = (Item) request.getSession().getAttribute("item");
    ArrayList<Warehouse> warehouseList = (ArrayList<Warehouse>) request.getSession().getAttribute("item_warehouse");
    ArrayList<Supplier> supplierList = (ArrayList<Supplier>) request.getSession().getAttribute("item_supplier");
    Warehouse warehouse;
    int count = (Integer) request.getSession().getAttribute("count");
    Supplier supplier;
%>

<script>
    function redirect(id) {
        if (id === -1) {
            //location for edit
        } else {
            if (id.substr(0, 1) === 's') {
                location.href = "Supplier?id=" + id.substr(1, id.length - 1);
            }
            else if (id.substr(0, 1) === 'w') {
                location.href = "Warehouse?id=" + id.substr(1, id.length - 1);
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
            View Item Info
        </h1>

        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Items</a>
            </li>
            <li>
                <i class="fa fa-edit"></i> <a href="Item">View Item List</a>
            </li>
            <li class="active">
                <i class="fa fa-edit"></i> View Item Information
            </li>
        </ol>
    </div>

</div>
<!-- /.row -->
<!-- Page Content -->
<div class="row">
    <div class ="row">
        <h4 class = "text-info">Details of <%=item.getName()%></h4>
        <ul class = "list-group">
            <li class = "list-group-item"><b class = "text-info">Description: </b><%=item.getDescription()%></li>
            <li class = "list-group-item"><b class = "text-info">Unit Measure: </b><%=item.getUnit()%></li>
            <li class = "list-group-item"><b class = "text-info">Stock: </b><%=count%></li>
        </ul>
    </div>

    <div class="row">
        <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
            <button id="add-item" class="btn btn-primary">Edit Item Details</button>
        </div>
    </div>
    <div class = "row">
        <ul class="nav nav-tabs nav-justified">
            <li class="active"><a data-toggle="tab" href="#warehouse">Warehouses Containing Item</a></li>
            <li><a data-toggle="tab" href="#supplier">Suppliers of Item</a></li>
        </ul>
        <div class ="tab-content">
            <div id = "warehouse" class = "tab-pane fade in active">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width:5%;"></th>
                                <th style="width: 40%; text-align: center;">Warehouse Name</th>
                                <th style="width: 40%; text-align: center;">Location</th>
                                <th style="width: 10%; text-align: center;">Stock in Warehouse</th>
                                <th style="width: 5%"></th>
                            </tr>
                        </thead>

                        <tbody id="itemTableBody">
                            <%
                                for (int i = 0; i < warehouseList.size(); i++) {
                                    warehouse = warehouseList.get(i);
                            %>
                            <tr>
                                <td style="text-align: right;"><%=(i + 1)%></td>
                                <td style="text-align: center;"><button type="button" class="btn btn-link name" onclick="redirect('w<%=warehouse.getWarehouseID()%>')"><%=warehouse.getName()%></button></td>
                                <td style="text-align: center;"><%=warehouse.getLocation()%></td>
                                <td style="text-align: center;"><%=warehouse.getItem(item.getItemID()).getCount()%></td>
                                <td id = "item-actions" style="white-space: nowrap">
                                    <a class="edit-button" title="Edit Item Count In Warehouse">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div><!-- end of .table-responsive -->
            </div>
            <div id = "supplier" class = "tab-pane fade">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style = "width: 5%;"></th>
                                <th style="width: 20%; text-align: center;">Supplier Name</th>
                                <th style="width: 20%; text-align: center;">Location</th>
                                <th style="width: 20%; text-align: center;">Contact Number</th>
                                <th style="width: 20%; text-align: center;">Email Address</th>
                                <th style="width: 20%; text-align: center;">Contact Person</th>
                            </tr>
                        </thead>

                        <tbody id="itemTableBody">
                            <%
                                for (int i = 0; i < supplierList.size(); i++) {
                                    supplier = supplierList.get(i);
                            %>
                            <tr>
                                <td style="text-align: right;"><%=(i + 1)%></td>
                                <td style="text-align: center;"><button type="button" class="btn btn-link name" onclick = "redirect('s<%=supplier.getSupplierID()%>')"><%=supplier.getName()%></button></td>
                                <td style="text-align: center;"><%=supplier.getLocation()%></td>
                                <td style="text-align: center;"><%=supplier.getContactNumber()%></td>
                                <td style="text-align: center;"><%=supplier.getEmailAddress()%></td>
                                <td style="text-align: center;"><%=supplier.getContactPerson()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div><!-- end of .table-responsive -->
            </div>
        </div> <!-- end of .tab-content -->
    </div> <!-- end of .row-->
</div><!-- end of .row -->

<%@ include file="footer.html"%>