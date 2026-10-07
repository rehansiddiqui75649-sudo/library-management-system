package com.rehan.library.controller;

import com.rehan.library.dao.DashboardDAO;
import com.rehan.library.dao.IssueBookDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private final DashboardDAO dashboardDAO=new DashboardDAO();
    private final IssueBookDAO issueBookDAO=new IssueBookDAO();

    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        HttpSession session=request.getSession(false);
        if(session==null||session.getAttribute("user")==null){response.sendRedirect(request.getContextPath()+"/login.jsp");return;}
        try{
            request.setAttribute("stats",dashboardDAO.getStats());
            request.setAttribute("recentBooks",dashboardDAO.getRecentBooks());
            request.setAttribute("recentIssues",issueBookDAO.findAll().stream().limit(5).toList());
            request.getRequestDispatcher("/dashboard.jsp").forward(request,response);
        }catch(Exception e){throw new ServletException("Unable to load dashboard.",e);}
    }
}
