/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Database.Database;
import Models.Item;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arces
 */
public class HandleItem extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Database db = Database.getInstance();
        String action, name, type, unit, description;
        int id;
        Item item;

        action = request.getParameter("action");

        switch (action) {
            case "add":
                name = request.getParameter("name");
                unit = request.getParameter("unitofmeasure");
                description = request.getParameter("description");

                db.addItem(name, description, unit);
                System.out.println("name = " + name);
                out.write("<p id = \"add-warehouse-message\" style=\"font-size: 16px; color: green; margin:0px\" align=\"center\">Item <i>"
                        + name + "</i> has been added! </p>");
                break;
                
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));

                db.deleteItem(id);
                break;
            
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                name = request.getParameter("name");
                unit = request.getParameter("unitofmeasure");
                description = request.getParameter("description");
                
                db.editItem(id, name, description, unit);
                
                out.write("<p id = \"add-warehouse-message\" style=\"font-size: 16px; color: green; margin:0px\" align=\"center\">Item <i>"
                        + name + "</i> has been updated! </p>");
                
                break;
            case "redirect":
                type = request.getParameter("type");

                if (type.equals("add")) {
                    reqDispatcher = request.getRequestDispatcher("additem.jsp");
                    request.getSession().setAttribute("action", "add");
                } else if (type.equals("edit")) {
                    reqDispatcher = request.getRequestDispatcher("additem.jsp");
                    request.getSession().setAttribute("action", "edit");
                    id = Integer.parseInt(request.getParameter("id"));
                    item = db.getItemDetails(id);
                    request.getSession().setAttribute("item", item);
                }
                reqDispatcher.forward(request, response);
                break;
        }
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
