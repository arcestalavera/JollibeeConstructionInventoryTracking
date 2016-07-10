<%@ include file="header.html"%>
<%@ include file="topnav.html"%>
<%@ include file="leftnav.html"%>

<script type = "text/javascript" src = "js/Item.js"></script>
<div id="page-wrapper">

            <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Add Item
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.html">Deliveries</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-pencil-square-o"></i> Add Item
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Page Content -->
                    <div id = "add-items-div" class="row">
                        <div class="col-lg-12">
                            <form id="add-item-form" class = "add-items-form" onsubmit = "return addItem()" method = "POST">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input id = "name" class="form-control" name="name" required>
                                </div><!-- end of .form-group -->

                                <div class="form-group">
                                    <label>Unit of measure</label>
                                    <input id="unitofmeasure" class="form-control" name="unitofmeasure" required>
                                </div><!-- end of .form-group -->
                                <input type="submit" class="btn btn-primary" value="Add Item">
                            </form>
                        </div>
                    </div>

        <%@ include file="footer.html"%>
