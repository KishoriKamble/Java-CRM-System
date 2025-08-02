package com.crm.model;

import java.sql.Date;

public class Task {
    private int taskId;
    private String title;
    private String description;
    private Date dueDate;
    private int assignedTo;
    private int relatedCustomer;
    private String status;

    public Task() {}

    public Task(String title, String description, Date dueDate, int assignedTo, int relatedCustomer, String status) {
        this.title = title;
        this.description = description;
        this.dueDate = dueDate;
        this.assignedTo = assignedTo;
        this.relatedCustomer = relatedCustomer;
        this.status = status;
    }

    public Task(int taskId, String title, String description, Date dueDate, int assignedTo, int relatedCustomer, String status) {
        this(title, description, dueDate, assignedTo, relatedCustomer, status);
        this.taskId = taskId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public int getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(int assignedTo) {
        this.assignedTo = assignedTo;
    }

    public int getRelatedCustomer() {
        return relatedCustomer;
    }

    public void setRelatedCustomer(int relatedCustomer) {
        this.relatedCustomer = relatedCustomer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
