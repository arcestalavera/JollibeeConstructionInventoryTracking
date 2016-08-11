/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Database.Database;
import Models.Item;
import Models.Supplier;
import Models.Warehouse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arces
 */
public class ViewItem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher reqDispatcher = null;
        Database db = Database.getInstance();
        PrintWriter out = response.getWriter();
        ArrayList<Item> itemList = new ArrayList<>();
        ArrayList<Warehouse> warehouseList;
        ArrayList<Supplier> supplierList;
        Item item;
        int count;
        
        String id = request.getParameter("id");

        if (id != null) {
            int iid = Integer.parseInt(id);
            item = db.getItemDetails(iid, false);
            System.out.println("ID = " + id);
            if(db.getItemWarehouses(iid)==null){
                System.out.println("No warehouses");
                warehouseList = null;
            } else warehouseList = db.getItemWarehouses(iid);
            supplierList = db.getItemSuppliers(iid);
            count = db.getItemCount(iid);
            
            request.getSession().setAttribute("item", item);
            request.getSession().setAttribute("item_warehouse", warehouseList);
            request.getSession().setAttribute("item_supplier", supplierList);
            request.getSession().setAttribute("count", count);
            reqDispatcher = request.getRequestDispatcher("itempage.jsp");
        } else {
            itemList = db.getItems(false);

            request.getSession().setAttribute("items", itemList);
            reqDispatcher = request.getRequestDispatcher("viewitems.jsp");
        }
        
        reqDispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
