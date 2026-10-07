package com.rehan.library.model;

public class BookItem extends LibraryItem {
    public BookItem(int id, String title) {
        super(id, title);
    }

    @Override
    public String getItemType() {
        return "BOOK";
    }
}
