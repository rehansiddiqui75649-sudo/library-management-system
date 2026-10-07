package com.rehan.library.controller;

import com.rehan.library.dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/members")
public class MembersServlet extends HttpServlet {
    private final UserDAO userDAO=new UserDAO();
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        HttpSession session=request.getSession(false);
        if(session==null||session.getAttribute("user")==null){response.sendRedirect(request.getContextPath()+"/login.jsp");return;}
        try{
            request.setAttribute("members",userDAO.findAll().stream().filter(u->"MEMBER".equalsIgnoreCase(u.getRole())).toList());
            request.getRequestDispatcher("/members.jsp").forward(request,response);
        }catch(Exception e){throw new ServletException("Unable to load members.",e);}
    }
}
