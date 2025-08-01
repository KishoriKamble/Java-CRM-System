# Java-CRM-System


CRM stands for customer relationship management, which is a system for managing all of your company’s interactions with current and potential customers. The goal is simple: improve relationships to grow your business. CRM technology helps companies stay connected to customers, streamline processes, and improve profitability.

When people talk about CRM, they’re usually referring to a CRM system: software that helps track each interaction you have with a prospect or customer. That can include sales calls, customer service interactions, marketing emails, and more.

# Java CRM System (Customer Relationship Management)

This is a **Java-based CRM System** designed for managing customer data, interactions, leads, sales, and tasks. The project is built using:

- **Java** (JSP/Servlets)
- **PostgreSQL** for database
- **HTML/CSS** for the front-end
- **IntelliJ IDEA** as the IDE

---
## 📁 Project Structure

CRM-System/
│
├── model/ # Java model classes
├── dao/ # Java DAO classes (database operations)
├── servlet/ # Servlet classes (handling requests)
├── web/ # Web content (JSP files, HTML, CSS)
│ ├── addCustomer.jsp
│ ├── viewCustomers.jsp
│ ├── login.jsp
│ └── ...
├── sql/ # SQL schema and insert scripts
│ └── crm_schema.sql
├── web.xml # Web deployment descriptor

---

## 💾 Database Setup

- DBMS: **PostgreSQL**
- Database name: `java_crm_system`
- Username: `postgresql`
- Password: `admin`

Run the SQL file located in `/sql/crm_schema.sql` to create the necessary tables.

---

## 🚀 How to Run the Project

1. Open the project in **IntelliJ IDEA**.
2. Ensure PostgreSQL is running and accessible.
3. Add the PostgreSQL JDBC driver (`postgresql.jar`) to your project’s `lib` folder.
4. Deploy the project on **Apache Tomcat**.
5. Access the application via your browser:
http://localhost:8080/CRM/index.jsp

## 🔐 Login Info

Only admin users can access certain modules. Login using:

- **Username:** admin
- **Password:** admin123

*(Change credentials in the database for more security.)*

---

## 📌 Features

- User authentication (admin only)
- Add/View/Update/Delete customers
- Record customer interactions
- Manage leads and sales
- Assign and track tasks

---


## 📚 Technologies Used

- Java (JSP/Servlets)
- HTML5 & CSS3 (No Bootstrap)
- PostgreSQL
- Apache Tomcat
- IntelliJ IDEA

---

## 👨‍💻 Author

Developed by **Kishori Kamble**  
For academic purposes / learning Java-based Web Development

---

