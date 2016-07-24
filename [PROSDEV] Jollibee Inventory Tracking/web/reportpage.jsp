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
<script>
    function redirect(id) {
        location.href = "Request?id=" + id;
    }
</script>
<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Report.js"></script>
<%
    Request req = (Request) request.getSession().getAttribute("request");
    ArrayList<Delivery> deliveryList = req.getDeliveryList();
    Item item;
    Delivery delivery;
%>


<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Send Progress Report About <%=req.getName()%>
                </h1>

                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Request</a>
                    </li>
                    <li>
                        <i class="fa fa-edit"></i> <a href="Request">View Request List</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i> <a href = "#" onclick = "redirect(<%=req.getRequestID()%>)">View Request Information</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i> Send Progress Report
                    </li>
                </ol>
            </div>

        </div>
        <!-- /.row -->

        <!-- Page Content -->
        <div class="row">
            <div class ="col-lg-12">
                <h4 class = "text-info">Summary of <%=req.getName()%></h4>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th></th>
                                <th style="width: 23%;">Item Name</th>
                                <th style="width: 23%;">Description</th>
                                <th style="width: 23%">Unit Measure</th>
                                <th style="width: 23%">Delivery Status</th>
                                <th style="width: 23%">Delivery Type</th>
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

                                <td style="width: 23%;"><%=item.getName()%></td>
                                <td style="width: 23%;"><%=item.getDescription()%></td>
                                <td style="width: 23%;"><%=item.getUnit()%></td>
                                <td style="width: 23%;"><%=delivery.getStatus()%></td>
                                <td style="width: 23%;"><%=delivery.getType()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div><!-- end of .table-responsive -->
            </div>
        </div><!-- end of .row -->    
        <div id = "send-div" class="row">
            <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                <button id="activate-modal" class="btn btn-primary activate-modal" data-toggle="modal" data-target="#reportmodal" data-verdict="question">Send Report</button>
            </div>
        </div>

        <div class="modal fade" id="reportmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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