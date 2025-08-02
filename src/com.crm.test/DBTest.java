package com.crm.test;

import com.crm.util.DBUtil;
import java.sql.Connection;
import java.sql.SQLException;

public class DBTest {
    public static void main(String[] args) {
        try (Connection conn = DBUtil.getConnection()) {
            if (conn != null) {
                System.out.println("Connected to: " + conn.getMetaData().getURL());
            } else {
                System.out.println("❌ Connection is NULL. Check DBUtil configuration.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
