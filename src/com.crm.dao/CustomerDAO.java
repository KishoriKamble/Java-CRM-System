package com.crm.dao;

import com.crm.model.Customer;
import com.crm.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    // Debug switch
    private static final boolean DEBUG = true;

    private void log(String msg) {
        if (DEBUG) {
            System.out.println("[CustomerDAO] " + msg);
        }
    }

    private void logSQLException(SQLException e, String sql) {
        log("SQL ERROR running: " + sql);
        log("Message: " + e.getMessage());
        log("SQLState: " + e.getSQLState());
        log("ErrorCode: " + e.getErrorCode());
        e.printStackTrace();
    }

    // ----------------------------------------------------------------
    // Add Customer
    // ----------------------------------------------------------------
    public boolean addCustomer(Customer customer) {
        final String sql = "INSERT INTO customers(name, email, phone, address, company_name, added_by_user) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            if (con == null) {
                log("Connection is NULL! Check DBUtil / driver / Tomcat lib / credentials.");
                return false;
            }

            log("Connected to: " + con.getMetaData().getURL());
            log("Adding customer: " + customer);

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getCompany_name());
            ps.setInt(6, customer.getAdded_by_user());

            int rows = ps.executeUpdate();
            log("Rows inserted: " + rows);

            if (rows > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) {
                        int newId = keys.getInt(1);
                        log("Generated customer_id: " + newId);
                    }
                }
            }

            return rows > 0;

        } catch (SQLException e) {
            logSQLException(e, sql);
            return false;
        }
    }

    // ----------------------------------------------------------------
    // Get All Customers
    // ----------------------------------------------------------------
    public List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        final String sql = "SELECT * FROM customers ORDER BY customer_id";
        try (Connection con = DBUtil.getConnection();
             Statement st = con != null ? con.createStatement() : null;
             ResultSet rs = st != null ? st.executeQuery(sql) : null) {

            if (con == null) {
                log("Connection is NULL in getAllCustomers()");
                return list;
            }

            log("Connected to: " + con.getMetaData().getURL());
            log("Fetching all customers...");

            while (rs != null && rs.next()) {
                Customer c = new Customer(
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("company_name"),
                        rs.getInt("added_by_user")
                );
                list.add(c);
            }

            log("Total customers fetched: " + list.size());

        } catch (SQLException e) {
            logSQLException(e, sql);
        }

        return list;
    }

    // ----------------------------------------------------------------
    // Get Customer By ID
    // ----------------------------------------------------------------
    public Customer getCustomerById(int id) {
        final String sql = "SELECT * FROM customers WHERE customer_id = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con != null ? con.prepareStatement(sql) : null) {

            if (con == null || ps == null) {
                log("Connection is NULL in getCustomerById()");
                return null;
            }

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Customer c = new Customer(
                            rs.getInt("customer_id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("phone"),
                            rs.getString("address"),
                            rs.getString("company_name"),
                            rs.getInt("added_by_user")
                    );
                    log("Fetched customer: " + c.getName() + ", ID: " + c.getCustomer_id());
                    return c;
                } else {
                    log("No customer found with ID = " + id);
                }
            }

        } catch (SQLException e) {
            logSQLException(e, sql);
        }

        return null;
    }

    // ----------------------------------------------------------------
    // Update Customer
    // ----------------------------------------------------------------
    public boolean updateCustomer(Customer customer) {
        final String sql = "UPDATE customers SET name=?, email=?, phone=?, address=?, company_name=?, added_by_user=? " +
                "WHERE customer_id=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con != null ? con.prepareStatement(sql) : null) {

            if (con == null || ps == null) {
                log("Connection is NULL in updateCustomer()");
                return false;
            }

            log("Connected to: " + con.getMetaData().getURL());
            log("Updating customer_id=" + customer.getCustomer_id());

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getCompany_name());
            ps.setInt(6, customer.getAdded_by_user());
            ps.setInt(7, customer.getCustomer_id());

            int rows = ps.executeUpdate();
            log("Rows updated: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            logSQLException(e, sql);
        }

        return false;
    }

    // ----------------------------------------------------------------
    // Delete Customer
    // ----------------------------------------------------------------
    public boolean deleteCustomer(int id) {
        String sql = "DELETE FROM customers WHERE customer_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int rows = stmt.executeUpdate();
            return rows > 0; // true if at least one row deleted
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
