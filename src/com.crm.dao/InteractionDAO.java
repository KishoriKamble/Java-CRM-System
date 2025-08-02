package com.crm.dao;

import com.crm.model.Interaction;
import com.crm.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InteractionDAO {

    public void addInteraction(Interaction interaction) {
        String sql = "INSERT INTO interactions (customer_id, user_id, type, interaction_date, notes) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, interaction.getCustomerId());
            stmt.setInt(2, interaction.getUserId());
            stmt.setString(3, interaction.getType());
            stmt.setTimestamp(4, interaction.getInteractionDate());
            stmt.setString(5, interaction.getNotes());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Interaction> getAllInteractions() {
        List<Interaction> interactions = new ArrayList<>();
        String sql = "SELECT * FROM interactions ORDER BY interaction_date DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Interaction i = new Interaction();
                i.setInteractionId(rs.getInt("interaction_id"));
                i.setCustomerId(rs.getInt("customer_id"));
                i.setUserId(rs.getInt("user_id"));
                i.setType(rs.getString("type"));
                i.setInteractionDate(rs.getTimestamp("interaction_date"));
                i.setNotes(rs.getString("notes"));
                interactions.add(i);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interactions;
    }
}
