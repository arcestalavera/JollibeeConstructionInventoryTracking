/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Database.Database;
import Models.Delivery;
import Models.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author YING LOPEZ
 */
public class HandleDelivery extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Delivery delivery;
        Request req;
        Database db = Database.getInstance();
        String action, resp;
        int id;

        action = request.getParameter("action");

        System.out.println("a = " + action);
        switch (action) {
            case "respond":
                id = Integer.parseInt(request.getParameter("id").substring(1, 2));

                resp = request.getParameter("resp");
                db.respondDelivery(id, resp);
                break;
            case "cancel":
                id = Integer.parseInt(request.getParameter("id"));

                db.changeDeliveryStatus(id, "Cancelled");
                delivery = db.getDeliveryDetails(id);
                req = delivery.getRequest();

                //if request has no more deliveries, change its status
                if (db.getRequestDeliveries(req.getRequestID(), false).isEmpty()) {
                    Date endDate = new Date();
                    db.changeRequestStatus(req.getRequestID(), "Finished");
                    db.changeRequestEndDate(req.getRequestID(), new java.sql.Date(endDate.getTime()));
                    out.write("Finished-" + sdf.format(endDate));
                }
                break;
            case "finish":
                id = Integer.parseInt(request.getParameter("id"));

                db.changeDeliveryStatus(id, "Finished");
                delivery = db.getDeliveryDetails(id);
                req = delivery.getRequest();

                //if request has no more deliveries, change its status
                if (db.getRequestDeliveries(req.getRequestID(), false).isEmpty()) {
                    Date endDate = new Date();
                    db.changeRequestStatus(req.getRequestID(), "Finished");
                    db.changeRequestEndDate(req.getRequestID(), new java.sql.Date(endDate.getTime()));
                    out.write("Finished-" + sdf.format(endDate));
                } else {
                    if (req.getStatus().equals("In Transit")) {
                        db.changeRequestStatus(req.getRequestID(), "In Transit - Incomplete");
                        out.write("Incomplete");
                    }
                }
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
