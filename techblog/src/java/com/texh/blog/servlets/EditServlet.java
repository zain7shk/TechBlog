/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.texh.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.connprovider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author zain
 */

@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            

        //fetch all data
            String userEmail=request.getParameter("user_email");
            String userName=request.getParameter("user_name");
            String userPassword=request.getParameter("user_password");
            String userAbout=request.getParameter("user_about");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
           // get the user froom session
           HttpSession s=request.getSession();
           User user=(User)s.getAttribute("currentuser");
           user.setEmail(userEmail);
           user.setName(userName);
           user.setPassword(userPassword);
           user.setAbout(userAbout);
           String oldfile=user.getProfile();
           user.setProfile(imageName);
           
           
            //update dataabse..
            UserDao userDao=new UserDao(connprovider.getConnection());
            boolean ans=userDao.updateUser(user);
            if(ans)
            {
                String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                String patholdfile=request.getRealPath("/")+"pics"+File.separator + oldfile;
               
                if(!oldfile.equals("default.png")){
                    
                Helper.deleteFile(patholdfile);
                }
               
                    if(Helper.saveFile(part.getInputStream(),path))
                    {
                        out.println("profile updated");
                         Message msg=new Message("profile details updated","success","alert-success");
                         s.setAttribute("msg",msg);
                    }
                    else{
                        Message msg=new Message("profile details  not updated","error","alert-danger");
                         s.setAttribute("msg",msg);
                    }
            }
            else{
                out.println("not updated");
                 Message msg=new Message("profile details  not updated","error","alert-danger");
                 s.setAttribute("msg",msg);
            }
            
            response.sendRedirect("profile.jsp");
        
            
            out.println("</body>");
            out.println("</html>");
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
