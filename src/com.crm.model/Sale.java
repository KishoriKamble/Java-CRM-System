package com.crm.model;

import java.sql.Timestamp;

public class Sale {
    private int saleId;
    private int customerId;
    private double amount;
    private Timestamp saleDate;
    private String status;

    // Constructors
    public Sale() {}

    public Sale(int customerId, double amount, Timestamp saleDate, String status) {
        this.customerId = customerId;
        this.amount = amount;
        this.saleDate = saleDate;
        this.status = status;
    }

    public Sale(int saleId, int customerId, double amount, Timestamp saleDate, String status) {
        this.saleId = saleId;
        this.customerId = customerId;
        this.amount = amount;
        this.saleDate = saleDate;
        this.status = status;
    }

    // Getters and Setters
    public int getSaleId() { return saleId; }
    public void setSaleId(int saleId) { this.saleId = saleId; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public Timestamp getSaleDate() { return saleDate; }
    public void setSaleDate(Timestamp saleDate) { this.saleDate = saleDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
