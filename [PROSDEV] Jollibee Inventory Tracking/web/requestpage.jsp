<%@page import="Models.Delivery"%>
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
    ArrayList<Delivery> deliveryList = req.getDeliveryList();
    Warehouse sourceWarehouse = req.getSourceWarehouse();
    Warehouse destWarehouse = req.getDestWarehouse();
    Item item;
    Delivery delivery;
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
%>

<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Request.js"></script>
<script>
    function redirect(id) {
        var type = id.substr(0, 1);
        if (type === 'i') {
            location.href = "Item?id=" + id.substr(1, id.length - 1);
        }else if (type === 'w') {
            location.href = "Warehouse?id=" + id.substr(1, id.length - 1);
        }
    }

    function sendReport(id) {
        location.href = "HandleRequest?action=report&id=" + id;
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
                    <li class = "list-group-item"><b class = "text-info">End Date: </b><p id = "request-enddate" style="display:inline;"><%=req.getEndDate() == null ? " - " : sdf.format(req.getEndDate())%></p></li>
                    <li class = "list-group-item"><b class = "text-info">Source Warehouse: </b><button type="button" class="btn btn-link name" onClick="redirect('w<%=sourceWarehouse.getWarehouseID()%>')"><%=sourceWarehouse.getName()%></button></li>
                    <li class = "list-group-item"><b class = "text-info">Destination Warehouse: </b><button type="button" class="btn btn-link name" onClick="redirect('w<%=destWarehouse.getWarehouseID()%>')"><%=destWarehouse.getName()%></button></li>
                    <br/>
                    <li class = "list-group-item"><b class = "text-info" style="display: inline;">Status: </b><p id = "request-status" style="display:inline;"><%=req.getStatus()%></p></li>
                </ul>
            </div>
        </div><!-- end of .row -->      

        <div class="row">
            <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                <button class="btn btn-primary" onclick = "sendReport(<%=req.getRequestID()%>)">Send Progress Report</button>
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
                                <th style="width: 18%;">Item Name</th>
                                <th style="width: 18%;">Description</th>
                                <th style="width: 18%">Unit Measure</th>
                                <th style="width: 18%">Delivery Status</th>
                                <th style="width: 18%">Delivery Type</th>
                                <th style="width: 5%"></th>
                            </tr>
                        </thead>

                        <tbody id="itemTableBody">
                            <%
                                for (int i = 0; i < deliveryList.size(); i++) {
                                    delivery = deliveryList.get(i);
                                    item = delivery.getItem();
                            %>
                            <tr>
                                <td style="text-align: right;"><%=(i + 1)%></td>

                                <td style="width: 18%;"><button type="button" class="btn btn-link name" onclick = "redirect('i<%=item.getItemID()%>')"><%=item.getName()%></button></td>
                                <td style="width: 18%;"><%=item.getDescription()%></td>
                                <td style="width: 18%;"><%=item.getUnit()%></td>
                                <td id = "d<%=delivery.getDeliveryID()%>-status" style="width: 18%;"><%=delivery.getStatus()%></td>
                                <td id = "d<%=delivery.getDeliveryID()%>-status" style="width: 18%;"><%=delivery.getType()%></td>

                                <td id = "d<%=delivery.getDeliveryID()%>-actions" style="width: 5%;">
                                    <%
                                        if (delivery.getType().equals("Incoming") && !delivery.getStatus().equals("Finished")) {
                                    %>
                                    <a class = "edit-button" name="d<%=delivery.getDeliveryID()%>" title="Cancel Delivery"  id="activate-modal" class="activate-modal" data-toggle="modal" data-target="#requestmodal" data-verdict="cancel">
                                        <i class="fa fa-ban"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (!delivery.getStatus().equals("Finished")) {
                                    %>
                                    <a class = "edit-button" name="d<%=delivery.getDeliveryID()%>" title="Mark Delivery of <%=delivery.getItem().getName()%> as Finished"  id="activate-modal" class="activate-modal" data-toggle="modal" data-target="#requestmodal" data-verdict="finish">
                                        <i class="fa fa-check-circle"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div><!-- end of .table-responsive -->
            </div><!-- end of .col-md-12 -->
        </div><!-- end of .row-->

        <div class="modal fade" id="requestmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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