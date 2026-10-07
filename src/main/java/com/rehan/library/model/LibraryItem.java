package com.rehan.library.model;

public abstract class LibraryItem {
    protected int id;
    protected String title;

    protected LibraryItem(int id, String title) {
        this.id=id; this.title=title;
    }

    public abstract String getItemType();
    public int getId() { return id; }
    public String getTitle() { return title; }
}
