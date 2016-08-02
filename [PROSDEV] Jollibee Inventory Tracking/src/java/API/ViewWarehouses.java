/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import Database.Database;
import Models.Warehouse;
import com.google.gson.Gson;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arces
 */
public class ViewWarehouses extends HttpServlet implements TokenChecker {

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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Database db = Database.getInstance();
        Gson gson = new Gson();
        String id = request.getParameter("id");
        String json;
        if (checkToken(request)) {
            if (id == null) {
                ArrayList<Warehouse> warehouseList = db.getWarehouses(true);
                json = gson.toJson(warehouseList);
            } else {
                Warehouse warehouse = db.getWarehouseDetails(Integer.parseInt(id), true);
                json = gson.toJson(warehouse);
            }
            out.write(json);
        } else {

            response.setContentType("text/html;charset=UTF-8");
            out.write("<h2>Access Denied For Non-API Clients.</h2>");
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

    @Override
    public boolean checkToken(HttpServletRequest req) {
        boolean canPass = false;
        DataInputStream dis = null;
        String sToken, bToken;
        try {
            File f = new File("token.dat");
            byte[] a = new byte[(int) f.length()];
            dis = new DataInputStream(new FileInputStream(f));
            dis.readFully(a);
            dis.close();

            sToken = (String) req.getSession().getAttribute("token");
            bToken = new String(a);
            if (sToken != null && sToken.equals(bToken)) {
                canPass = true;
            }
        } catch (FileNotFoundException ex) {
            canPass = false;
        } catch (IOException ex) {
            Logger.getLogger(ViewItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return canPass;
    }
}
