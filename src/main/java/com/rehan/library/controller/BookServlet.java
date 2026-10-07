package com.rehan.library.controller;

import com.rehan.library.exception.LibraryException;
import com.rehan.library.service.LibraryService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private final LibraryService service=new LibraryService();
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        try{
            String search=request.getParameter("search"), category=request.getParameter("category");
            request.setAttribute("books",service.getBooks(search,category));
            request.setAttribute("categories",service.getCategories());
            request.setAttribute("search",search==null?"":search);
            request.setAttribute("selectedCategory",category==null?"":category);
            request.getRequestDispatcher("/books.jsp").forward(request,response);
        }catch(LibraryException e){throw new ServletException(e);}
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        try{
            service.addBook(request.getParameter("title"),request.getParameter("author"),request.getParameter("category"),Integer.parseInt(request.getParameter("quantity")));
            response.sendRedirect(request.getContextPath()+"/books?added=1");
        }catch(Exception e){request.setAttribute("error",e.getMessage());doGet(request,response);}
    }
}
