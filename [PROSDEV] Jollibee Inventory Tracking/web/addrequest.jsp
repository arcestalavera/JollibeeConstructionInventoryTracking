<%@ include file="header.html" %>
<%@ include file="topnav.html" %>
<%@ include file="leftnav.html" %>

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Add Request
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.html">Requests</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-pencil-square-o"></i> Add Request
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Page Content -->
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="add-item-form">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="form-control" name="name" required>
                                </div><!-- end of .form-group -->
                                <div class="table-group">
                                <div class="col-md-10 nopad leftelem">
                                    <select id="itemselection" name="itemselection" class="form-control">
                                        <option value="item1" data-unit="kg" >Item 1</option>
                                        <option value="item2" data-unit="100g pack">Item 2</option>
                                        <option value="item3" data-unit="pc">Item 3</option>
                                    </select>
                                </div>
                                <div class="col-md-2 nopad rightelem">
                                    <button type="button" class="additem btn btn-default" onclick="additem();">Add Item</button>
                                </div>
                                <table class="col-lg-12"  id="itemlist">
                                    <tr>
                                        <th></th>
                                        <th style="width: 100%;">Item Name</th>
                                        <th style="text-align: right;">Unit Measure</th>
                                        <th style="text-align: right;">Amount</th>
                                        <th style="text-align: right;"></th>
                                    </tr>
                                </table>
                                </div>  
                                <div class="col-md-11 nopad">
                                    <input type="submit" class="btn btn-primary" value="Add Request">
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="addrequestmodal" tabindex="-1" role="dialog" aria-labelledby="messageModal">
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
