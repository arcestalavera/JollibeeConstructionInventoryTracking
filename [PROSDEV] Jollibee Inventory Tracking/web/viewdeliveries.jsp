<%@page import="Models.Item"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Delivery"%>
<%@page import="java.util.ArrayList"%>
<%@include file="header.html"%>
<%@include file="topnav.jsp"%>
<%@include file="leftnav.html"%>

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
                                <th style="width: 20%;">Request Name of Delivery</th>
                                <th style="width: 20%;">Type</th>
                                <th style="width: 20%;">Item Being Delivered</th>
                                <th style="width: 20%;">Count</th>
                                <th style="width: 20%;">Status</th>
                            </tr>
                        </thead>
                        <tbody id="deliveryTableBody">
                            <%
                                for (int i = 0; i < deliveryList.size(); i++) {
                                    delivery = deliveryList.get(i);
                                    item = delivery.getItem();
                            %>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td style="width: 20%;"><button type="button" class="btn btn-link name" onclick="redirect('r<%=delivery.getRequest().getRequestID()%>')"><%=delivery.getRequest().getName()%></button></td>
                                <td style="width: 20%;"><%=delivery.getType()%></td>
                                <td style="width: 20%;"><button type="button" class="btn btn-link name" onclick = "redirect('i<%=item.getItemID()%>')"><%=item.getName()%></button></td>
                                <td style="width: 20%;"><%=item.getCount()%></td>
                                <td style="width: 20%;"><%=delivery.getStatus()%></td>
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
