<%@page import="Models.Item"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Delivery"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.html"%>
<%@include file="topnav.jsp"%>
<%@include file="leftnav.jsp"%>

<%    ArrayList<Delivery> deliveryList = (ArrayList<Delivery>) request.getSession().getAttribute("deliveries");
    Delivery delivery;
    Item item;
%>
<script>
    function redirect(id) {
        var type = id.substr(0, 1);
        if (type === 'i') {
            location.href = "Item?id=" + id.substr(1, id.length - 1);
        } else if (type === 'r') {
            location.href = "Request?id=" + id.substr(1, id.length - 1);
        }
    }
</script>
<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Request.js"></script>
<div id="page-wrapper">

    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    View Delivery List
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Deliveries</a>
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
                                <th style="width: 18%;">Request Name of Delivery</th>
                                <th style="width: 18%;">Type</th>
                                <th style="width: 18%;">Item Being Delivered</th>
                                <th style="width: 18%;">Count</th>
                                <th style="width: 18%;">Status</th>
                                <th style="width: 5%;"></th>
                            </tr>
                        </thead>
                        <tbody id="deliveryTableBody">
                            <%
                                for (int i = 0; i < deliveryList.size(); i++) {
                                    delivery = deliveryList.get(i);
                                    item = delivery.getItem();
                                    String status = delivery.getStatus();
                            %>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td style="width: 18%;"><button type="button" class="btn btn-link name" onclick="redirect('r<%=delivery.getRequest().getRequestID()%>')"><%=delivery.getRequest().getName()%></button></td>
                                <td style="width: 18%;"><%=delivery.getType()%></td>
                                <td style="width: 18%;"><button type="button" class="btn btn-link name" onclick = "redirect('i<%=item.getItemID()%>')"><%=item.getName()%></button></td>
                                <td style="width: 18%;"><%=item.getCount()%></td>
                                <td id = "d<%=delivery.getDeliveryID()%>-status" style="width: 18%;"><%=delivery.getStatus()%></td>
                                <td id = "d<%=delivery.getDeliveryID()%>-actions" style="width: 5%;">
                                    <%
                                        if (delivery.getType().equals("Incoming") && (!delivery.getStatus().equals("Finished") && !delivery.getStatus().equals("Cancelled"))) {
                                    %>
                                    <a class = "edit-button" name="d<%=delivery.getDeliveryID()%>" title="Cancel Delivery"  id="activate-modal" class="activate-modal" data-toggle="modal" data-target="#requestmodal" data-verdict="cancel">
                                        <i class="fa fa-ban"></i>
                                    </a>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (!delivery.getStatus().equals("Finished") && !delivery.getStatus().equals("Cancelled")) {
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

            </div>
            <!-- /.col-lg-12 -->

        </div>
        <!-- /.row -->
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
