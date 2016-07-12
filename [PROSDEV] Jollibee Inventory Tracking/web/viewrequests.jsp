<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.Item"%>
<%@page import="Models.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.html" %>
<%@ include file="topnav.jsp" %>
<%@ include file="leftnav.html" %>
<%
    ArrayList<Request> requestList = (ArrayList<Request>) request.getSession().getAttribute("requests");
    Request req;
    String status;
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
%>

<div id="page-wrapper">

            <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    View Request List
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Requests</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i> View Request List
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Content -->
        <div class="row">
            <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                <button id="add-item" class="btn btn-primary">Add Request</button>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-12">

                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style = "width: 5%;"></th>
                                <th style="width: 15%;">Request Name</th>
                                <th style="width: 15%;">Source Warehouse</th>
                                <th style="width: 15%;">Destination Warehouse</th>
                                <th style="width: 15%;">Start Date</th>
                                <th style="width: 15%;">End Date</th>
                                <th style="width: 15%;">Status</th>
                                <th style = "width: 5%;"></th>
                            </tr>
                        </thead>
                        <tbody id="requestsTableBody">
                            <%
                                for (int i = 0; i < requestList.size(); i++) {
                                    req = requestList.get(i);
                                    status = req.getStatus();
                            %>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td><button type="button" class="btn btn-link name"><%=req.getName()%></button></td>
                                <td><button type="button" class="btn btn-link name"><%=req.getSourceWarehouse().getName()%></button></td>
                                <td><button type="button" class="btn btn-link name"><%=req.getDestWarehouse().getName()%></button></td>
                                <td><%=sdf.format(req.getStartDate())%></td>
                                <td><%=req.getEndDate() == null ? "-": sdf.format(req.getEndDate())%></td>
                                <td class = "s<%=req.getRequestID()%>"><%=req.getStatus()%></td>
                                <td style="white-space: no-wrap">
                                    <a class="edit-button">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <%
                                        if (status.equals("Pending")) {
                                    %>
                                    <a id = "<%=status.substring(0, 1).toLowerCase()%><%=req.getRequestID()%>" class="approve-button" data-toggle="modal" 
                                       data-target="#requestsmodal" data-verdict="approve">
                                        <i class="fa fa-check"></i>
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

            </div><!-- end of .col-lg-12 -->
        </div><!-- end of .row -->

        <div class="modal fade" id="requestsmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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
