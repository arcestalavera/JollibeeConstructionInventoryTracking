<%@page import="Models.Supplier"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>JCI Inventory Tracking - Suppliers</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <%
            ArrayList<Supplier> supplierList = (ArrayList<Supplier>) request.getSession().getAttribute("suppliers");
            Supplier supplier;
        %>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Jollibee Construction Inc. - Inventory Tracking</a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <!-- <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                            </li> -->
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
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
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
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                View Suppliers
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="blank-page.html">Suppliers</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-edit"></i> View Supplier List
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
                    <div class="row">

                        <div class="col-lg-12">

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th style="width: 100%;">Supplier Name</th>
                                            <th style="text-align: right;">Location</th>
                                            <th style="text-align: right;">Contact #</th>
                                            <th style="text-align: right;">Email</th>
                                        </tr>
                                    </thead>
                                    <tbody id="supplierTableBody">
                                        <%
                                            for (int i = 0; i < supplierList.size(); i++) {
                                                supplier = supplierList.get(i);
                                        %>
                                        <tr>
                                            <td><%=(i + 1)%></td>
                                            <td><%=supplier.getName()%></td>
                                            <td style="text-align: right;"><%=supplier.getLocation()%></td>
                                            <td style="text-align: right;"><%=supplier.getContactNumber()%></td>
                                            <td style="text-align: right;"><%=supplier.getEmailAddress()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div><!-- end of .table-responsive -->

                        </div><!-- end of .col-lg-12 -->

                    </div><!-- end of .row -->

                    <!-- Pagination Options (bottom) -->
                    <!-- <div class="row pagination-options">
                        <div class="col-lg-3" style="text-align: left; margin-bottom: 15px;">
                            <select id="choosePageNumber" class="form-control">
                            </select>
                        </div>
                        
                        <div class="col-lg-6">
                            <ul class="pager" style="margin: 0 0 15px;">
                                <li><a class="previous prevPage"><i class="fa fa-arrow-left"></i></a></li>
                                <li class="pageIndicator">Page 1 of 10</li>
                                <li><a class="next nextPage"><i class="fa fa-arrow-right"></i></a></li>
                            </ul>
                        </div>
                        
                        <div class="col-lg-3" style="text-align: right; margin-bottom: 15px;">
                            <div style="width: 30%; float: left;">
                                <input id="itemsPerPage" class="form-control" type="number" min="1"/> 
                            </div>
                            <div style="width: 70%; float: right;">
                                <button type="button" class="btn btn-default" id="chooseItemsPerPage" style="width: 95%;">Set Items Per Page</button>
                            </div>
                            <div class="clear: both;"></div>
                        </div>
                    </div> -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>