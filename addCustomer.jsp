<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #264653;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="number"]:focus {
            border-color: #2a9d8f;
            outline: none;
        }

        input[type="submit"] {
            background-color: #2a9d8f;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #21867a;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2a9d8f;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>➕ Add Customer</h2>
    <form name="addForm" action="addCustomer" method="post" onsubmit="return validateForm();">

        <label>Name:</label>
        <input type="text" name="name" required />

        <label>Email:</label>
        <input type="email" name="email" required />

        <label>Phone:</label>
        <input type="text" name="phone" required />

        <label>Address:</label>
        <input type="text" name="address" />

        <label>Company:</label>
        <input type="text" name="company_name" />

        <label>Added By (User ID):</label>
        <input type="number" name="added_by_user" value="1" />

        <input type="submit" value="Add Customer" />
    </form>
    <a class="back-link" href="viewCustomers">📋 View All Customers</a>
</div>
<script>
function validateForm() {
    const name = document.forms["addForm"]["name"].value.trim();
    const email = document.forms["addForm"]["email"].value.trim();
    const phone = document.forms["addForm"]["phone"].value.trim();
    const address = document.forms["addForm"]["address"].value.trim();
    const company = document.forms["addForm"]["company_name"].value.trim();
    const userId = document.forms["addForm"]["added_by_user"].value.trim();

    const nameRegex = /^[A-Za-z\s]+$/;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const phoneRegex = /^[987]\d{9}$/;
    const userIdRegex = /^\d+$/;

    if (!nameRegex.test(name)) {
        alert("Name should contain only letters.");
        return false;
    }
    if (!emailRegex.test(email)) {
        alert("Invalid email format.");
        return false;
    }
    if (!phoneRegex.test(phone)) {
        alert("Phone must start with 9, 8, or 7 and be 10 digits.");
        return false;
    }
    if (company !== "" && !nameRegex.test(company)) {
        alert("Company name should contain only letters.");
        return false;
    }
    if (!userIdRegex.test(userId)) {
        alert("User ID should be an integer.");
        return false;
    }

    return true; // allow form submission
}
</script>

</body>
</html>
