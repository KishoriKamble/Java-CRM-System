package com.crm.model;

public class Customer {
    private int customer_id;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String company_name;
    private int added_by_user; // changed from String to int

    public Customer() {}

    public Customer(String name, String email, String phone, String address, String company_name, int added_by_user) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.company_name = company_name;
        this.added_by_user = added_by_user;
    }

    public Customer(int customer_id, String name, String email, String phone, String address, String company_name, int added_by_user) {
        this.customer_id = customer_id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.company_name = company_name;
        this.added_by_user = added_by_user;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public int getAdded_by_user() {
        return added_by_user;
    }

    public void setAdded_by_user(int added_by_user) {
        this.added_by_user = added_by_user;
    }
}
