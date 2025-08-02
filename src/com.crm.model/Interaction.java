package com.crm.model;

import java.sql.Timestamp;

public class Interaction {
    private int interactionId;
    private int customerId;
    private int userId;
    private String type;
    private Timestamp interactionDate;
    private String notes;

    public Interaction() {}

    public Interaction(int customerId, int userId, String type, Timestamp interactionDate, String notes) {
        this.customerId = customerId;
        this.userId = userId;
        this.type = type;
        this.interactionDate = interactionDate;
        this.notes = notes;
    }

    public Interaction(int interactionId, int customerId, int userId, String type, Timestamp interactionDate, String notes) {
        this.interactionId = interactionId;
        this.customerId = customerId;
        this.userId = userId;
        this.type = type;
        this.interactionDate = interactionDate;
        this.notes = notes;
    }


    public int getInteractionId() {
        return interactionId;
    }

    public void setInteractionId(int interactionId) {
        this.interactionId = interactionId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getInteractionDate() {
        return interactionDate;
    }

    public void setInteractionDate(Timestamp interactionDate) {
        this.interactionDate = interactionDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
