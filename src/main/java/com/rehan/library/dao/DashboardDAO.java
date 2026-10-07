package com.rehan.library.dao;

import com.rehan.library.model.Book;
import com.rehan.library.util.DBConnection;
import java.sql.*;
import java.util.*;

public class DashboardDAO {
    public Map<String, Integer> getStats() throws SQLException {
        Map<String, Integer> stats = new HashMap<>();
        String sql = "SELECT (SELECT COUNT(*) FROM books) titles, " +
                "COALESCE((SELECT SUM(available_quantity) FROM books),0) available, " +
                "COALESCE((SELECT SUM(quantity-available_quantity) FROM books),0) issued, " +
                "(SELECT COUNT(*) FROM users WHERE role='MEMBER') members";
        try (Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql); ResultSet rs=ps.executeQuery()) {
            if (rs.next()) {
                stats.put("titles", rs.getInt("titles"));
                stats.put("available", rs.getInt("available"));
                stats.put("issued", rs.getInt("issued"));
                stats.put("members", rs.getInt("members"));
            }
        }
        return stats;
    }

    public List<Book> getRecentBooks() throws SQLException {
        List<Book> books=new ArrayList<>();
        String sql="SELECT * FROM books ORDER BY id DESC LIMIT 5";
        try (Connection con=DBConnection.getConnection(); PreparedStatement ps=con.prepareStatement(sql); ResultSet rs=ps.executeQuery()) {
            while(rs.next()) books.add(new Book(rs.getInt("id"),rs.getString("title"),rs.getString("author"),rs.getString("category"),rs.getInt("quantity"),rs.getInt("available_quantity")));
        }
        return books;
    }
}
