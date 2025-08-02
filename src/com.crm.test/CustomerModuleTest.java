package com.crm.test;
import com.crm.dao.CustomerDAO;
import com.crm.model.Customer;

import java.util.List;
import java.util.Scanner;

public class CustomerModuleTest{

    private final CustomerDAO dao = new CustomerDAO();
    private final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("=== CRM Customer Console ===");
        new CustomerModuleTest().run();
    }

    private void run() {
        boolean running = true;
        while (running) {
            printMenu();
            System.out.print("Choose option: ");
            String choice = scanner.nextLine().trim();
            switch (choice) {
                case "1" -> addCustomer();
                case "2" -> viewCustomers();
                case "3" -> updateCustomer();
                case "4" -> deleteCustomer();
                case "5" -> { running = false; System.out.println("Exiting..."); }
                case "h", "H" -> help();
                default -> System.out.println("Invalid option. Type 'h' for help.");
            }
            System.out.println();
        }
    }

    private void printMenu() {
        System.out.println("-----------------------------");
        System.out.println("1. Add Customer");
        System.out.println("2. View All Customers");
        System.out.println("3. Update Customer");
        System.out.println("4. Delete Customer");
        System.out.println("5. Exit");
        System.out.println("(h for help)");
    }

    private void help() {
        System.out.println("Help:");
        System.out.println(" - Add: Inserts new customer (requires valid added_by_user id)");
        System.out.println(" - View: Lists all customers");
        System.out.println(" - Update: Find customer by ID then change fields");
        System.out.println(" - Delete: Remove by ID");
    }

    private void addCustomer() {
        System.out.println("-- Add Customer --");
        String name = prompt("Name");
        String email = prompt("Email");
        String phone = prompt("Phone");
        String address = prompt("Address");
        String company = prompt("Company Name");
        int addedBy = promptInt("Added By (user_id integer)");

        Customer c = new Customer(name, email, phone, address, company, addedBy);
        boolean ok = dao.addCustomer(c);
        System.out.println(ok ? "✅ Customer added." : "❌ Failed to add (check constraints / duplicate email)." );
    }

    private void viewCustomers() {
        System.out.println("-- Customer List --");
        List<Customer> list = dao.getAllCustomers();
        if (list.isEmpty()) {
            System.out.println("(no customers)");
            return;
        }
        list.forEach(c -> System.out.printf(
                "ID=%d | Name=%s | Email=%s | Phone=%s | Address=%s | Company=%s | AddedBy=%d%n",
                c.getCustomer_id(), c.getName(), c.getEmail(), c.getPhone(), c.getAddress(), c.getCompany_name(), c.getAdded_by_user()
        ));
    }

    private void updateCustomer() {
        System.out.println("-- Update Customer --");
        int id = promptInt("Customer ID to update");

        // Fetch current list to find existing customer
        Customer existing = dao.getAllCustomers().stream()
                .filter(c -> c.getCustomer_id() == id)
                .findFirst()
                .orElse(null);
        if (existing == null) {
            System.out.println("❌ Customer ID not found.");
            return;
        }
        System.out.println("Current values (press Enter to keep):");
        String name = promptOptional("Name [" + existing.getName() + "]");
        String email = promptOptional("Email [" + existing.getEmail() + "]");
        String phone = promptOptional("Phone [" + existing.getPhone() + "]");
        String address = promptOptional("Address [" + existing.getAddress() + "]");
        String company = promptOptional("Company [" + existing.getCompany_name() + "]");
        String addedByStr = promptOptional("Added By (user_id) [" + existing.getAdded_by_user() + "]");

        if (!name.isEmpty()) existing.setName(name);
        if (!email.isEmpty()) existing.setEmail(email);
        if (!phone.isEmpty()) existing.setPhone(phone);
        if (!address.isEmpty()) existing.setAddress(address);
        if (!company.isEmpty()) existing.setCompany_name(company);
        if (!addedByStr.isEmpty()) {
            try {
                existing.setAdded_by_user(Integer.parseInt(addedByStr));
            } catch (NumberFormatException e) {
                System.out.println("⚠ Invalid number for added_by_user. Keeping old value.");
            }
        }

        boolean ok = dao.updateCustomer(existing);
        System.out.println(ok ? "✅ Updated successfully." : "❌ Update failed (check constraints)." );
    }

    private void deleteCustomer() {
        System.out.println("-- Delete Customer --");
        int id = promptInt("Customer ID to delete");
        boolean ok = dao.deleteCustomer(id);
        System.out.println(ok ? "✅ Deleted." : "❌ Delete failed (ID not found / constraint)." );
    }

    private String prompt(String label) {
        System.out.print(label + ": ");
        return scanner.nextLine().trim();
    }

    private String promptOptional(String label) {
        System.out.print(label + ": ");
        return scanner.nextLine().trim();
    }

    private int promptInt(String label) {
        while (true) {
            System.out.print(label + ": ");
            String input = scanner.nextLine().trim();
            try {
                return Integer.parseInt(input);
            } catch (NumberFormatException e) {
                System.out.println("Enter a valid integer.");
            }
        }
    }
}