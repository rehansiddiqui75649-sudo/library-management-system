package com.rehan.library.model;

import java.time.LocalDate;

public class IssueRecord {
    private final int id, userId, bookId;
    private final String userName, bookTitle, status;
    private final LocalDate issueDate, returnDate;

    public IssueRecord(int id,int userId,String userName,int bookId,String bookTitle,LocalDate issueDate,LocalDate returnDate,String status){
        this.id=id; this.userId=userId; this.userName=userName; this.bookId=bookId; this.bookTitle=bookTitle;
        this.issueDate=issueDate; this.returnDate=returnDate; this.status=status;
    }
    public int getId(){return id;} public int getUserId(){return userId;} public String getUserName(){return userName;}
    public int getBookId(){return bookId;} public String getBookTitle(){return bookTitle;}
    public LocalDate getIssueDate(){return issueDate;} public LocalDate getReturnDate(){return returnDate;} public String getStatus(){return status;}
}
