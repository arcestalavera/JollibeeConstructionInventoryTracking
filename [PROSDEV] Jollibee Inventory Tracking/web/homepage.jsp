<%@include file="scratch/header.html"%>
<%@include file="topnav.jsp"%>
<%
    if(user!=null){
%>
<%@include file="leftnav.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        location.href="/blank-page.jsp";
    });
</script>

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
                                <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Dashboard</a>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

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
<%
    } //else response.sendRedirect("index.jsp");
%>