package com.crm.model;

import java.sql.Timestamp;

public class Lead {
    private int leadId;
    private int customerId;
    private String source;
    private String status;
    private Timestamp createdAt;

    public Lead() {}

    public Lead(int customerId, String source, String status, Timestamp createdAt) {
        this.customerId = customerId;
        this.source = source;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getLeadId() {
        return leadId;
    }

    public void setLeadId(int leadId) {
        this.leadId = leadId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
