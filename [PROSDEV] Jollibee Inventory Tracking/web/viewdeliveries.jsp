<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Delivery"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.html"%>
<%@include file="topnav.html"%>
<%@include file="leftnav.html"%>

<%
    ArrayList<Delivery> deliveryList = (ArrayList<Delivery>) request.getSession().getAttribute("deliveries");
    Delivery delivery;
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
%>

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                View Delivery List
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Deliveries</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-sign-in"></i> View Delivery List
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Page Content -->
                    <div class="row">

                        <div class="col-lg-12">

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th style="width: 100%;">Delivery Name</th>
                                            <th style="text-align: right;">Type</th>
                                            <th style="text-align: right;">Date Requested</th>
                                            <th style="text-align: right;">Date Received</th>
                                            <th style="text-align: right;">Status</th>
                                            <th style="text-align: right;"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="deliveryTableBody">
                                        <%
                                            for (int i = 0; i < deliveryList.size(); i++) {
                                                delivery = deliveryList.get(i);
                                        %>
                                        <tr>
                                            <td><%=(i + 1)%></td>
                                            <td><button type="button" class="btn btn-link name"><%=delivery.getDeliveryName()%></button></td>
                                            <td style="text-align: right;"><%=delivery.getType()%></td>
                                            <td style="text-align: right;"><%=sdf.format(delivery.getStartTime())%></td>
                                            <td style="text-align: right;"><%=delivery.getEndTime() == null ? "-" : sdf.format(delivery.getEndTime())%></td>
                                            <td style="text-align: right;"><%=delivery.getStatus()%></td>
                                            <td style="white-space: nowrap">
                                                <a class="edit-button" data-toggle="modal"
                                                   data-target="#deliveriesmodal" data-verdict="cancel">
                                                    <i class="fa fa-times-circle"></i>
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
                            <!-- /.col-lg-12 -->
    
                    </div>
                    <!-- /.row -->
    

                    <div class="modal fade" id="deliveriesmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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
