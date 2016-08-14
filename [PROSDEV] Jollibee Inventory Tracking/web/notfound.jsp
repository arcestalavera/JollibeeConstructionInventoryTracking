<%@include file="scratch/header.html"%>
<%@include file="topnav.jsp"%>
<%
    if(user!=null){
%>
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

            <%@include file="scratch/footer.html"%>

</body>

</html>
<%
    } //else response.sendRedirect("index.jsp");
%>