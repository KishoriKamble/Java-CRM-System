package com.crm.dao;

import com.crm.model.Lead;
import com.crm.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeadDAO {

    public void addLead(Lead lead) {
        String sql = "INSERT INTO leads (customer_id, source, status, created_at) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, lead.getCustomerId());
            stmt.setString(2, lead.getSource());
            stmt.setString(3, lead.getStatus());
            stmt.setTimestamp(4, lead.getCreatedAt());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Lead> getAllLeads() {
        List<Lead> leads = new ArrayList<>();
        String sql = "SELECT * FROM leads ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Lead l = new Lead();
                l.setLeadId(rs.getInt("lead_id"));
                l.setCustomerId(rs.getInt("customer_id"));
                l.setSource(rs.getString("source"));
                l.setStatus(rs.getString("status"));
                l.setCreatedAt(rs.getTimestamp("created_at"));
                leads.add(l);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leads;
    }
}
