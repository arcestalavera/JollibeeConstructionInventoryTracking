<%@page import="Models.Item"%>
<%@page import="Models.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.html" %>
<%@ include file="topnav.html" %>
<%@ include file="leftnav.html" %>
<%
    ArrayList<Request> requestList = (ArrayList<Request>) request.getSession().getAttribute("requests");
    Request req;
    Item item;
    String status;
%>

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
                                <th></th>
                                <th style="width: 100%;">Request Name</th>
                                <th style="text-align: right;">Item Name</th>
                                <th style="text-align: right;">Count</th>
                                <th style="text-align: right;">Status</th>
                            </tr>
                        </thead>
                        <tbody id="requestsTableBody">
                            <%
                                for (int i = 0; i < requestList.size(); i++) {
                                    req = requestList.get(i);
                                    item = req.getItem();
                                    status = req.getStatus();
                            %>
                            <tr>
                                <td><%=(i + 1)%></td>
                                <td><button type="button" class="btn btn-link name"><%=req.getRequestName()%></button></td>
                                <td style="text-align: right;"><%=item.getName()%></td>
                                <td style="text-align: right;"><%=req.getCount()%></td>
                                <td class = "s<%=req.getRequestID()%>" style="text-align: right;"><%=req.getStatus()%></td>
                                <td style="white-space: no-wrap">
                                    <a class="edit-button">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <%
                                        if (status.equals("Pending Approval")) {
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
