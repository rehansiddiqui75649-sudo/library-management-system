package com.rehan.library.controller;

import com.rehan.library.dao.BookDAO;
import com.rehan.library.dao.IssueBookDAO;
import com.rehan.library.dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/issue-return")
public class IssueBookServlet extends HttpServlet {
    private final UserDAO userDAO=new UserDAO();
    private final BookDAO bookDAO=new BookDAO();
    private final IssueBookDAO issueDAO=new IssueBookDAO();

    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        HttpSession session=request.getSession(false);
        if(session==null||session.getAttribute("user")==null){response.sendRedirect(request.getContextPath()+"/login.jsp");return;}
        try{
            request.setAttribute("users",userDAO.findAll());
            request.setAttribute("books",bookDAO.findAll());
            request.setAttribute("issues",issueDAO.findActive());
            request.getRequestDispatcher("/issue-return.jsp").forward(request,response);
        }catch(Exception e){throw new ServletException("Unable to load transactions.",e);}
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        try{
            String action=request.getParameter("action");
            if("issue".equals(action)) issueDAO.issueBook(Integer.parseInt(request.getParameter("userId")),Integer.parseInt(request.getParameter("bookId")));
            else if("return".equals(action)) issueDAO.returnBook(Integer.parseInt(request.getParameter("issueId")),Integer.parseInt(request.getParameter("bookId")));
            response.sendRedirect(request.getContextPath()+"/issue-return?success="+action);
        }catch(Exception e){request.setAttribute("error",e.getMessage());doGet(request,response);}
    }
}
