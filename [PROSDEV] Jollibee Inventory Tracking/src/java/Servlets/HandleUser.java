/* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Database.Database;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Stella
 */
public class HandleUser extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher reqDispatcher = null;
        PrintWriter out = response.getWriter();
        Database db = Database.getInstance();
        String action, username, password, name;
        int type;
        int id;
        User user;

        action = request.getParameter("action");

        switch (action) {
            case "add":
                username = request.getParameter("uname");
                password = request.getParameter("upass");
                type = Integer.parseInt(request.getParameter("utype"));
                System.out.println("utype = "+request.getParameter("utype"));
                name = request.getParameter("name");

                db.addUser(username, password, type, name);
                System.out.println("name = " + username);
                out.write("<p id = \"add-user-message\" style=\"font-size: 16px; color: green; margin:0px\" align=\"center\">User <i>"
                        + username + "</i> has been added! </p>");
                break;
                
            case "deleteFrmList":
                id = Integer.parseInt(request.getParameter("id"));

                db.deleteUser(id);
                break;
                
            case "deleteFrmView":
                id = Integer.parseInt(request.getParameter("id"));

                db.deleteUser(id);
                response.sendRedirect("User");
                break;
            
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                username = request.getParameter("username");
                password = request.getParameter("password");
                type = Integer.parseInt(request.getParameter("type"));
                name = request.getParameter("ufname");
                
                db.editUser(id, username, password, type, name);
                
                out.write("<p id = \"add-user-message\" style=\"font-size: 16px; color: green; margin:0px\" align=\"center\">User <i>"
                        + username + "</i> has been updated! </p>");
                
                break;
            case "redirect":
                action = request.getParameter("action");

                if (action.equals("add")) {
                    reqDispatcher = request.getRequestDispatcher("adduser.jsp");
                    request.getSession().setAttribute("action", "add");
                } else if (action.equals("edit")) {
                    reqDispatcher = request.getRequestDispatcher("adduser.jsp");
                    request.getSession().setAttribute("action", "edit");
                    id = Integer.parseInt(request.getParameter("id"));
                    user = db.getUserDetails(id);
                    request.getSession().setAttribute("user", user);
                }
                reqDispatcher.forward(request, response);
                break;
            case "error":
                reqDispatcher = request.getRequestDispatcher("adduser.jsp");
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
