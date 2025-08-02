package com.crm.dao;

import com.crm.model.Sale;
import com.crm.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SaleDAO {
    public void addSale(Sale sale) {
        String sql = "INSERT INTO sales (customer_id, amount, sale_date, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, sale.getCustomerId());
            stmt.setDouble(2, sale.getAmount());
            stmt.setTimestamp(3, sale.getSaleDate());
            stmt.setString(4, sale.getStatus());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Sale> getAllSales() {
        List<Sale> list = new ArrayList<>();
        String sql = "SELECT * FROM sales";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Sale sale = new Sale(
                        rs.getInt("sale_id"),
                        rs.getInt("customer_id"),
                        rs.getDouble("amount"),
                        rs.getTimestamp("sale_date"),
                        rs.getString("status")
                );
                list.add(sale);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
