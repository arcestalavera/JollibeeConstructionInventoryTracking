<%@include file="header.html"%>
<%@include file="topnav.jsp"%>
<%@include file="leftnav.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        location.href="/notfound.jsp";
    });
</script>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            404
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i>  <a href="homepage.jsp">Home Page</a>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row">
                    <div class="col-lg-12">
                        <p class="text-danger">
                            The page you are looking for is not found. <br>
                            You can only access the pages found in the navigation at the left side of your screen. <br> 
                        </p>
                    </div>
                </div>

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
