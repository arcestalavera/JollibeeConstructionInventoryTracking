<%-- 
    Document   : warehouse
    Created on : 07 19, 16, 10:18:46 AM
    Author     : makoto39
--%>


<%@page import="Models.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Warehouse"%>
<%@ include file="scratch/header.html"%>
<%@ include file="topnav.jsp"%>
<%
    if(user!=null){
%>
<%@ include file="leftnav.jsp"%>

<%
    Warehouse warehouse = (Warehouse) request.getSession().getAttribute("warehouse");
    ArrayList<Item> itemList = (ArrayList<Item>) request.getSession().getAttribute("item_warehouse");
    Item item;
%>

<div id="page-wrapper">
    <div class="container-fluid">
        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <%=warehouse.getName()%>
                </h1>

                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i> <a href="blank-page.jsp">Suppliers</a>
                    </li>
                    <li>
                        <i class="fa fa-file"></i> <a href="Warehouse">View Warehouse List</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-edit"></i> View Warehouse Information
                    </li>
                </ol>
            </div>
        </div>
        
        <!-- Page Content -->
        <div class="row">
            <div class="col-lg-12">
                <h4 class="text-info">About <%=warehouse.getName()%></h4>
                <ul class="list-group">
                    <li class = "list-group-item"><b class = "text-info">Location: </b> <%=warehouse.getLocation()%></li>
                </ul>
            </div>
        </div>
                
        <div class="row">
            <div class="col-md-12">
                <h4>Items found in <%=warehouse.getName()%></h4>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th></th>
                                <th style="width: 100%;">Item Name</th>
                                <th style="width: 100%;">Description</th>
                                <th style="text-align: right;">Unit Measure</th>
                            </tr>
                        </thead>
                        <tbody id="itemTableBody">
                            <%
                                for(int i=0; i<itemList.size(); i++){
                                    item = itemList.get(i);
                            %>
                            <tr>
                                <td><%=(i + 1)%></td>

                            <td><button type="button" class="btn btn-link name"><%=item.getName()%></button></td>
                            <td style="text-align: right;"><%=item.getDescription()%></td>
                            <td style="text-align: right;"><%=item.getUnit()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
            
<%@ include file="scratch/footer.html"%>
<%
    } //else response.sendRedirect("index.jsp");
%>