package com.rehan.library.service;

import com.rehan.library.dao.BookDAO;
import com.rehan.library.exception.LibraryException;
import com.rehan.library.model.Book;
import java.sql.SQLException;
import java.util.List;

public class LibraryService {
    private final BookDAO bookDAO=new BookDAO();
    public List<Book> getBooks(String keyword,String category)throws LibraryException{try{return bookDAO.search(keyword,category);}catch(SQLException e){throw new LibraryException("Unable to load books.",e);}}
    public List<String> getCategories()throws LibraryException{try{return bookDAO.findCategories();}catch(SQLException e){throw new LibraryException("Unable to load categories.",e);}}
    public void addBook(String title,String author,String category,int quantity)throws LibraryException{
        if(title==null||title.isBlank()||author==null||author.isBlank()||quantity<=0)throw new LibraryException("Enter valid book details.");
        try{bookDAO.save(new Book(0,title.trim(),author.trim(),category==null||category.isBlank()?"General":category.trim(),quantity,quantity));}
        catch(SQLException e){throw new LibraryException("Unable to add book.",e);}
    }
}
