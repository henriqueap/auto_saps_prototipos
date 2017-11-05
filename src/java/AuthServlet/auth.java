/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AuthServlet;

import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hpereira
 */
public class auth extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */

  /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      try (PrintWriter out = response.getWriter()) {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Auth</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet auth at " + request.getContextPath() + "</h1>");
        out.println("</body>");
        out.println("</html>");
      }
  }*/

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  /*@Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throw ServletException, IOException {
    //empty
  } */

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    String mat = request.getParameter("matricula");
    String pwd = request.getParameter("senha");
    if (mat.equals("169.610-6")){
       if (pwd.equals("root")){
        HttpSession sessao = request.getSession();
        sessao.setAttribute("mat", mat);
        sessao.setAttribute("logado", "true");
        response.sendRedirect("cliente.jsp");
      }
      else {
        response.sendRedirect("login.jsp?type=danger&&message=Acesso Negado!");
      }
    }
    else {
      response.sendRedirect("login.jsp?type=warning&&message=Usuário não cadastrado");
    }
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */ 
  @Override
  public String getServletInfo() {
      return "Servlet que autentica o usuário";
  }// </editor-fold>

}