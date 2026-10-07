package com.rehan.library.dao;

import com.rehan.library.model.IssueRecord;
import com.rehan.library.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class IssueBookDAO {
    public void issueBook(int userId,int bookId) throws SQLException {
        String check="SELECT available_quantity FROM books WHERE id=? FOR UPDATE";
        String update="UPDATE books SET available_quantity=available_quantity-1 WHERE id=? AND available_quantity>0";
        String insert="INSERT INTO issued_books(user_id,book_id,issue_date,status) VALUES(?,?,?,'ISSUED')";
        try(Connection con=DBConnection.getConnection()){
            con.setAutoCommit(false);
            try(PreparedStatement c=con.prepareStatement(check); PreparedStatement u=con.prepareStatement(update); PreparedStatement i=con.prepareStatement(insert)){
                c.setInt(1,bookId);
                try(ResultSet rs=c.executeQuery()){
                    if(!rs.next()) throw new SQLException("Book not found.");
                    if(rs.getInt(1)<=0) throw new SQLException("This book is currently unavailable.");
                }
                u.setInt(1,bookId);
                if(u.executeUpdate()==0) throw new SQLException("Unable to update book availability.");
                i.setInt(1,userId); i.setInt(2,bookId); i.setDate(3,Date.valueOf(LocalDate.now())); i.executeUpdate();
                con.commit();
            }catch(SQLException e){con.rollback();throw e;}finally{con.setAutoCommit(true);}
        }
    }

    public void returnBook(int issueId,int bookId) throws SQLException {
        String issue="UPDATE issued_books SET return_date=?,status='RETURNED' WHERE id=? AND status='ISSUED'";
        String book="UPDATE books SET available_quantity=LEAST(quantity,available_quantity+1) WHERE id=?";
        try(Connection con=DBConnection.getConnection()){
            con.setAutoCommit(false);
            try(PreparedStatement i=con.prepareStatement(issue);PreparedStatement b=con.prepareStatement(book)){
                i.setDate(1,Date.valueOf(LocalDate.now())); i.setInt(2,issueId);
                if(i.executeUpdate()==0) throw new SQLException("Issue record not found or already returned.");
                b.setInt(1,bookId); b.executeUpdate(); con.commit();
            }catch(SQLException e){con.rollback();throw e;}finally{con.setAutoCommit(true);}
        }
    }

    public List<IssueRecord> findAll() throws SQLException { return find(""); }
    public List<IssueRecord> findActive() throws SQLException { return find("WHERE ib.status='ISSUED'"); }

    private List<IssueRecord> find(String condition) throws SQLException {
        List<IssueRecord> list=new ArrayList<>();
        String sql="SELECT ib.id,ib.user_id,u.name user_name,ib.book_id,b.title book_title,ib.issue_date,ib.return_date,ib.status " +
                "FROM issued_books ib JOIN users u ON ib.user_id=u.id JOIN books b ON ib.book_id=b.id " + condition + " ORDER BY ib.id DESC";
        try(Connection con=DBConnection.getConnection();PreparedStatement ps=con.prepareStatement(sql);ResultSet rs=ps.executeQuery()){
            while(rs.next()) list.add(new IssueRecord(rs.getInt("id"),rs.getInt("user_id"),rs.getString("user_name"),rs.getInt("book_id"),rs.getString("book_title"),rs.getDate("issue_date").toLocalDate(),rs.getDate("return_date")==null?null:rs.getDate("return_date").toLocalDate(),rs.getString("status")));
        }
        return list;
    }
}
