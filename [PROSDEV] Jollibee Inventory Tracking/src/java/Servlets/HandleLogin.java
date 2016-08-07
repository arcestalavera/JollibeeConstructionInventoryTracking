/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Database.Database;
import Database.Security;
import Models.User;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Darren
 */
public class HandleLogin extends HttpServlet {

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
        Security sec = Security.getInstance();
        ArrayList<User> userList = new ArrayList();
        User user = null;

        boolean pass = false;
        int i = 0;

        String username = request.getParameter("username");
        String tempPass = request.getParameter("password");
        
        String s1, s2, password;
        s1 = sec.createSalt(username, 1);
        s2 = sec.createSalt(username, 2);
        password = s1 + sec.encryptString(tempPass) + s2;
        userList = db.getUsers();

        for (i = 0; i < userList.size(); i++) {
            if (username.equals(userList.get(i).getUsername())) {
                if (password.equals(userList.get(i).getPassword())) {
                    user = userList.get(i);
                    pass = true;
                    break;
                } else {
                    break;
                }
            }
        }

        if (pass == false) {
            reqDispatcher = request.getRequestDispatcher("login.html");
        } else {
            request.getSession().setAttribute("loggedUser", user);
            request.getSession().setAttribute("type", user.getType());
            if (user.getType() == 3) {
                //generate token
                UUID uid = UUID.randomUUID();
                String token = uid.toString().replaceAll("-", "");
                byte[] tokenBytes = token.getBytes();
                //store token
                DataOutputStream dos = new DataOutputStream(new FileOutputStream("token.dat"));
                dos.write(tokenBytes);
                dos.flush();
                dos.close();
                request.getSession().setAttribute("token", token);
            }
            reqDispatcher = request.getRequestDispatcher("homepage.jsp");
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
