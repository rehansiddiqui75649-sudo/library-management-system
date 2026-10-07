package com.rehan.library.dao;

import java.sql.SQLException;
import java.util.List;

public interface CrudDAO<T> {
    List<T> findAll() throws SQLException;
    T findById(int id) throws SQLException;
    boolean save(T item) throws SQLException;
}
