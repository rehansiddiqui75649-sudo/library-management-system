package com.rehan.library.model;

import java.time.LocalDate;

public class IssuedBook {
    private int id;
    private int userId;
    private int bookId;
    private LocalDate issueDate;
    private LocalDate returnDate;
    private String status;

    public IssuedBook() {}

    public IssuedBook(int id, int userId, int bookId, LocalDate issueDate,
                      LocalDate returnDate, String status) {
        this.id=id; this.userId=userId; this.bookId=bookId;
        this.issueDate=issueDate; this.returnDate=returnDate; this.status=status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id=id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId=userId; }
    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId=bookId; }
    public LocalDate getIssueDate() { return issueDate; }
    public void setIssueDate(LocalDate issueDate) { this.issueDate=issueDate; }
    public LocalDate getReturnDate() { return returnDate; }
    public void setReturnDate(LocalDate returnDate) { this.returnDate=returnDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status=status; }
}
