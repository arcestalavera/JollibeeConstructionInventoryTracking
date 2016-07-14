<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Request"%>
<%@page import="Models.Warehouse"%>
<%@page import="Models.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Item"%>
<%@ include file="header.html"%>
<%@ include file="topnav.html"%>
<%@ include file="leftnav.html"%>

<%
    Request req = (Request) request.getSession().getAttribute("request");
    ArrayList<Item> itemList = req.getItemList();
    Warehouse sourceWarehouse = req.getSourceWarehouse();
    Warehouse destWarehouse = req.getDestWarehouse();
    Item item;
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
%>

<script>
    function redirect(id) {
        var type = id.substr(0, 1);
        if (type === 'i') {
            location.href = "Item?id=" + id.substr(1, id.length - 1);
        }
    }
</script>
<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    View Request Info
                </h1>

                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Request</a>
                    </li>
                    <li>
                        <i class="fa fa-edit"></i> <a href="Request">View Request List</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i> View Request Information
                    </li>
                </ol>
            </div>

        </div>
        <!-- /.row -->

        <!-- Page Content -->
        <div class="row">
            <div class ="col-lg-12">
                <h4 class = "text-info">Details of <%=req.getName()%></h4>
                <ul class = "list-group">
                    <li class = "list-group-item"><b class = "text-info">Start Date: </b><%=sdf.format(req.getStartDate())%></li>
                    <li class = "list-group-item"><b class = "text-info">End Date: </b><%=req.getEndDate() == null ? " - " : sdf.format(req.getEndDate())%></li>
                    <li class = "list-group-item"><b class = "text-info">Source Warehouse: </b><button type="button" class="btn btn-link name"><%=sourceWarehouse.getName()%></button></li>
                    <li class = "list-group-item"><b class = "text-info">Destination Warehouse: </b><button type="button" class="btn btn-link name"><%=destWarehouse.getName()%></button></li>
                    <br/>
                    <li class = "list-group-item">
                        <b class = "text-info">Status: </b><%=req.getStatus()%>
                        <a class="edit-button" title = "Change the Status of <%=req.getName()%>">
                            <i class="fa fa-edit"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div><!-- end of .row -->      

        <div class="row">
            <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                <button class="btn btn-primary">Send Progress Report</button>
            </div>
        </div>

        <div class ="row">
            <div class="col-md-12">
                <h4 class = "text-info">Items Requested in <%=req.getName()%></h4>
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

                                <td><button type="button" class="btn btn-link name" onclick = "redirect('i<%=item.getItemID()%>')"><s><%=item.getName()%></s></button></td>
                                <td style="text-align: right;"><s><%=item.getDescription()%></s></td>
                    <td style="text-align: right;"><s><%=item.getUnit()%></s></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div><!-- end of .table-responsive -->
            </div><!-- end of .col-md-12 -->
        </div><!-- end of .row-->


        <%@ include file="footer.html"%>