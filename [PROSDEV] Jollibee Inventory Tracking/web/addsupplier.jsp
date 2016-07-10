<%@ include file="header.html"%>
<%@ include file="topnav.html"%>
<%@ include file="leftnav.html"%>

<script type = "text/javascript" src = "js/Supplier.js">
</script>
<div id="page-wrapper">

            <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Add Supplier
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Suppliers</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-sign-in"></i> Add Supplier
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Page Content -->
                    <div id = "add-supplier-div" class="row">
                        <div class="col-lg-12">
                            <form class = "add-supplier-form" id="add-item-form" method = "POST" onsubmit="return addSupplier()">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input id="name" class="form-control" name="name" required>
                                </div><!-- end of .form-group -->

                                <div class="form-group">
                                    <label>Location</label>
                                    <input id="location" class="form-control" name="location" required>
                                </div><!-- end of .form-group -->
                                
                                <div class="form-group">
                                    <label>Number</label>
                                    <input id="contactno" class="form-control" name="contactno" required>
                                </div><!-- end of .form-group -->
                                
                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input id="emailadd" class="form-control" name="emailadd" required>
                                </div><!-- end of .form-group -->
                                <input type="submit" class="btn btn-primary" value="Add Supplier">
                            </form>
                        </div>
                    </div>

        <%@ include file="footer.html"%>
