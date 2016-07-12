<%@ include file="header.html"%>
<%@ include file="topnav.jsp"%>
<%@ include file="leftnav.html"%>

<script type = "text/javascript" src = "js/Warehouse.js">
</script>

<div id="page-wrapper">

            <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Add Warehouse
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Warehouse</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-pencil-square-o"></i> Add Warehouse
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Content -->
        <div id = "add-warehouse-div" class="row">
            <div class="col-lg-12">
                <form id="add-item-form" class="add-warehouse-form" onsubmit="return addWarehouse()" method = "POST">
                    <div class="form-group">
                        <label>Name</label>
                        <input id = "name" class="form-control" name="name" required>
                    </div><!-- end of .form-group -->

                    <div class="form-group">
                        <label>Location</label>
                        <input id="location" class="form-control" name="location" required>
                    </div><!-- end of .form-group -->
                    <input type="submit" class="btn btn-primary" value="Add Warehouse">
                </form>
            </div>
        </div>

<%@ include file="footer.html"%>
