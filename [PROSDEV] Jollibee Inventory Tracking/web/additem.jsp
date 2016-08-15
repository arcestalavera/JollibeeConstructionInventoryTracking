<%@page import="Models.Item"%>
<%@ include file="scratch/header.html"%>
<%@ include file="topnav.jsp"%>

<%
    int userType = (int)request.getSession().getAttribute("type");
    //if(userType<0 || userType>2){
    //    response.sendRedirect("notfound.jsp");
    //} else {
    if(user!=null && userType==1){
        
%>
<%@ include file="leftnav.jsp" %>

<script type = "text/javascript" src = "js/jquery.js"></script>
<script type = "text/javascript" src = "js/Item.js"></script>
<%
    String action = "";
    try{
    action = request.getSession().getAttribute("action").toString();
    } catch(Exception e){
        action = "add";
    }

    Item item = new Item();
    String label = null;
    if (action.equals("edit")) {
        item = (Item) request.getSession().getAttribute("item");
        label = "Edit Item";
    } else if (action.equals("add")) {
        label = "Add Item";
    }
%>
<!-- Page Heading -->
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <%=label%>
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="blank-page.jsp">Items</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-pencil-square-o"></i> 
                        <%=label%>
                    </li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Content -->
        <div id="error" class="alert alert-warning">
        </div>
        
        <div id = "add-items-div" class="row">
            <div class="col-lg-12">
                <%
                    if (action.equals("add")) {
                %>
                <!--<form id="add-item-form" class = "add-items-form" onsubmit = "return checkInput(-1)" method = "POST">-->
                <form id="add-item-form" class = "add-items-form" onsubmit = "return addItem()" method = "POST">
                    <%
                    } else if (action.equals("edit")) {
                    %>
                    <!--<form id="add-item-form" class = "add-items-form" onsubmit = "return checkInput(<%=item.getItemID()%>)" method = "POST">-->
                    <form id="add-item-form" class = "add-items-form" onsubmit = "return editItem(<%=item.getItemID()%>)" method = "POST">
                        <%
                            }
                        %>
                        <div class="form-group">
                            <label>Name</label>
                            <%                if (action.equals("add")) {
                            %>
                            <input id = "name" class="form-control" name="name" required>
                            <%
                            } else if (action.equals("edit")) {
                            %>
                            <input id = "name" class="form-control" name="name" value = "<%=item.getName()%>"required>
                            <%
                                }
                            %>
                        </div><!-- end of .form-group -->
                        <div class="form-group">
                            <label>Item Description</label>
                            <%                if (action.equals("add")) {
                            %>
                            <input id="description" class="form-control" name="description" required>
                            <%
                            } else if (action.equals("edit")) {
                            %>
                            <input id="description" class="form-control" name="description" value="<%=item.getDescription()%>" required>
                            <%
                                }
                            %>
                        </div><!-- end of .form-group -->
                        <div class="form-group">
                            <label>Unit of measure</label>
                            <%                if (action.equals("add")) {
                            %>
                            <input id="unitofmeasure" class="form-control" name="unitofmeasure" required>
                            <%
                            } else if (action.equals("edit")) {
                            %>
                            <input id="unitofmeasure" class="form-control" name="unitofmeasure" value="<%=item.getUnit()%>" required>
                            <%
                                }
                            %>
                        </div><!-- end of .form-group -->
                        <input type="submit" class="btn btn-primary" value="<%=label%>" id="submit">
                    </form>
            </div>
        </div>

        <%@ include file="scratch/footer.html"%>
<% 
    } //else response.sendRedirect("index.jsp");
%>