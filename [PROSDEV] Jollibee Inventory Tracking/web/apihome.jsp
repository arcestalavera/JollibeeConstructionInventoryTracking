<%@include file="header.html"%>
<%@include file="topnav.jsp"%>
<%@include file="leftnav.jsp"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/customjs.js"></script>
<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Home Page
                </h1>
                <ol class="breadcrumb">
                    <li class="active">
                        <i class="fa fa-dashboard"></i>  <a href="homepage.jsp">Dashboard</a>
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div id="info" class="alert alert-info">
                    Click on either View Item, View Item Information, View Requests, View Suppliers, View Supplier Info or View Warehouses.
                </div>
                <!--<form id="api-request-form" class = "api-request-form" onsubmit = "" method = "POST">-->
                    <div id="request-fill-in">
                        <!--                        <div class="form-group">
                                                    <label id="req-label">Request:</label>
                                                    <input id="req" class="form-control" name="req">
                                                </div>
                                                <div style="text-align: right; margin-right: 15px; margin-bottom: 30px;">
                                                    <button id="submit-request" class="btn" onclick=#">Submit Request</button>
                                                </div>-->
                    </div>
                <!--</form>-->    
            </div>    
            <div class="col-lg-12">
                <button id="view-items" class="btn btn-primary">View Item</button>
                <button id="view-item-info" class="btn btn-primary">View Item Information</button>
                <button id="view-requests" class="btn btn-primary">View Requests</button>
                <button id="view-suppliers" class="btn btn-primary">View Suppliers</button>
                <button id="view-supplier-info" class="btn btn-primary">View Supplier Info</button>
                <button id="view-warehouses" class="btn btn-primary">View Warehouses</button>
            </div>
            <div id="results" style="margin-top: 10px; text-align: center;">
            </div>
        </div>

        <%@ include file="footer.html"%>