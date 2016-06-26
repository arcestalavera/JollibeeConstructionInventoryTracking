<%@ include file="header.html"%>
<%@ include file="topnav.html"%>
<%@ include file="leftnav.html"%>

<script type = "text/javascript" src = "js/Supplier.js">
</script>
<!--<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>JCI Inventory Tracking - Deliveries</title>

        Custom CSS
        <link href="css/custom-css.css" rel="stylesheet">

         Bootstrap Core CSS 
        <link href="css/bootstrap.min.css" rel="stylesheet">

         Custom CSS 
        <link href="css/sb-admin.css" rel="stylesheet">

         Custom Fonts 
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

         HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries 
         WARNING: Respond.js doesn't work if you view the page via file:// 
        [if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]

    </head>

    <body>

        <div id="wrapper">

             Navigation 
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                 Brand and toggle get grouped for better mobile display 
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Jollibee Construction Inc. - Inventory Tracking</a>
                </div>
                 Top Menu Items 
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                             <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                            </li> 
                            <li>
                                <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                 Sidebar Menu Items - These collapse to the responsive navigation menu on small screens 
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a data-target="#suppliersNav" data-toggle="collapse" href="javascript:;"> 
                                Suppliers
                                <b class="caret" style="float: right; margin-top: 10px;"></b>
                            </a>
                            <ul id="suppliersNav" class="collapse">
                                <li>
                                    <a href="Supplier"><i class="fa fa-fw fa-file"></i> View Suppliers</a>
                                    <a href="addsupplier.html"><i class="fa fa-fw fa-file"></i> View Suppliers</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-target="#warehousesNav" data-toggle="collapse" href="javascript:;"> 
                                Warehouses
                                <b class="caret" style="float: right; margin-top: 10px;"></b>
                            </a>
                            <ul id="warehousesNav" class="collapse">
                                <li>
                                    <a href="Warehouse"><i class="fa fa-fw fa-file"></i> View Warehouses</a>
                                    <a href="addwarehouse.html"><i class="fa fa-fw fa-file"></i> Add Warehouse</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-target="#itemsNav" data-toggle="collapse" href="javascript:;"> 
                                Items
                                <b class="caret" style="float: right; margin-top: 10px;"></b>
                            </a>
                            <ul id="itemsNav" class="collapse">
                                <li>
                                    <a href="Item"><i class="fa fa-fw fa-file"></i> View Items</a>
                                    <a href="additem.html"><i class="fa fa-fw fa-file"></i> Add Item</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-target="#deliveriesNav" data-toggle="collapse" href="javascript:;"> 
                                Deliveries
                                <b class="caret" style="float: right; margin-top: 10px;"></b>
                            </a>
                            <ul id="deliveriesNav" class="collapse">
                                <li>
                                    <a href="viewdeliveries.html"><i class="fa fa-fw fa-file"></i> View Deliveries</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-target="#requestsNav" data-toggle="collapse" href="javascript:;"> 
                                Requests
                                <b class="caret" style="float: right; margin-top: 10px;"></b>
                            </a>
                            <ul id="requestsNav" class="collapse">
                                <li>
                                    <a href="Request"><i class="fa fa-fw fa-file"></i> View Requests</a>
                                    <a href="addrequest.html"><i class="fa fa-fw fa-file"></i> Add Request</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                 /.navbar-collapse 
            </nav>-->

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

                    <!-- Pagination Options (top) -->
                    <!-- <div class="row pagination-options">
                        <ul class="pager" style="margin: 0 0 15px;">
                            <li><a class="previous prevPage"><i class="fa fa-arrow-left"></i></a></li>
                            <li class="pageIndicator">Page 1 of 10</li>
                            <li><a class="next nextPage"><i class="fa fa-arrow-right"></i></a></li>
                        </ul>
                    </div> -->

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
                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <%@ include file="footer.html"%>
