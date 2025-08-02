package com.crm.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String URL = "jdbc:postgresql://localhost:5432/java_crm_system";
    private static final String USER = "postgres";
    private static final String PASS = "admin";

    public DBUtil() {
    }

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            conn.setAutoCommit(true); // Ensure auto-commit is enabled
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
