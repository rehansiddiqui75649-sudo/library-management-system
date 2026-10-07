package com.rehan.library.dao;

import com.rehan.library.model.Book;
import com.rehan.library.util.DBConnection;
import java.sql.*;
import java.util.*;

public class BookDAO implements CrudDAO<Book> {
    @Override public List<Book> findAll() throws SQLException { return search("",""); }
    public List<Book> search(String keyword) throws SQLException { return search(keyword,""); }
    public List<Book> search(String keyword,String category) throws SQLException {
        List<Book> books=new ArrayList<>();
        String sql="SELECT * FROM books WHERE (?='' OR title LIKE ? OR author LIKE ? OR category LIKE ?) AND (?='' OR category=?) ORDER BY id DESC";
        try(Connection con=DBConnection.getConnection();PreparedStatement ps=con.prepareStatement(sql)){
            String key=keyword==null?"":keyword.trim(); String value="%"+key+"%"; String cat=category==null?"":category.trim();
            ps.setString(1,key);ps.setString(2,value);ps.setString(3,value);ps.setString(4,value);ps.setString(5,cat);ps.setString(6,cat);
            try(ResultSet rs=ps.executeQuery()){while(rs.next())books.add(map(rs));}
        }
        return books;
    }
    public List<String> findCategories() throws SQLException {
        List<String> list=new ArrayList<>(); String sql="SELECT DISTINCT category FROM books WHERE category IS NOT NULL AND category<>'' ORDER BY category";
        try(Connection con=DBConnection.getConnection();PreparedStatement ps=con.prepareStatement(sql);ResultSet rs=ps.executeQuery()){while(rs.next())list.add(rs.getString(1));}
        return list;
    }
    @Override public Book findById(int id)throws SQLException{
        String sql="SELECT * FROM books WHERE id=?";
        try(Connection con=DBConnection.getConnection();PreparedStatement ps=con.prepareStatement(sql)){ps.setInt(1,id);try(ResultSet rs=ps.executeQuery()){return rs.next()?map(rs):null;}}
    }
    @Override public boolean save(Book book)throws SQLException{
        String sql="INSERT INTO books(title,author,category,quantity,available_quantity) VALUES(?,?,?,?,?)";
        try(Connection con=DBConnection.getConnection();PreparedStatement ps=con.prepareStatement(sql)){ps.setString(1,book.getTitle());ps.setString(2,book.getAuthor());ps.setString(3,book.getCategory());ps.setInt(4,book.getQuantity());ps.setInt(5,book.getAvailableQuantity());return ps.executeUpdate()>0;}
    }
    private Book map(ResultSet rs)throws SQLException{return new Book(rs.getInt("id"),rs.getString("title"),rs.getString("author"),rs.getString("category"),rs.getInt("quantity"),rs.getInt("available_quantity"));}
}
