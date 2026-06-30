<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Management System</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-image: url('https://t4.ftcdn.net/jpg/09/02/53/81/240_F_902538150_JCEcejSQkRHHR7d5jE1nbmfhXHdcd9E3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            padding-top: 150px;
        }

        .welcome-bar {
            position: fixed;
            top: 0;
            width: 100%;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-weight: bold;
            color: whitesmoke;
            z-index: 1000;
        }

        nav {
            position: fixed;
            top: 55px;
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 0;
            background-color: transparent;
            z-index: 999;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
        }

        nav a:hover {
            text-decoration: underline;
            color: bisque;
        }

        .container, .section-content {
            max-width: 500px;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.65);
            padding: 30px;
            border-radius: 25px;
            border: 2px solid #444;
            display: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
        }

        input, select, textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #aaa;
            border-radius: 5px;
        }

        .gender {
            display: flex;
            justify-content: space-around;
            margin-top: 5px;
        }

        .gender label {
            font-weight: normal;
        }

        button {
            margin-top: 20px;
            padding: 12px;
            background-color: lightblue;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #005f9e;
        }

    </style>
</head>

<body>

    <div class="welcome-bar">
        <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a onclick="showSection('home')">Home</a>
        <a href="findAll">View Employees</a>
        <a href="search">Search Employee</a>
        <a href="emplogout">Logout</a>
    </nav>

    <!-- HOME (EDIT EMPLOYEE FORM) -->
    <div id="home" class="container">
        <h2>Welcome </h2>

        <h1 style="text-align: center;">Edit Employee</h1>

        <% if(request.getAttribute("status") != null){ %>
            <h3 style="color:red; text-align:center;"><%=request.getAttribute("status")%></h3>
        <% } %>

        <form action="edituser">

            <label>Id</label>
            <input type="number" name="id" value='<%=request.getParameter("id")%>' readonly />

            <label>Name</label>
            <input type="text" name="name" value='<%=request.getParameter("name")%>' required/>

            <label>Email</label>
            <input type="text" name="email" value='<%=request.getParameter("email")%>' required/>

            <label>Password</label>
            <input type="text" name="password" value='<%=request.getParameter("password")%>' readonly/>

            <label>Age</label>
            <input type="text" name="age" value='<%=request.getParameter("age")%>' required/>

            <label>Gender</label>
            <div class="gender">
                <label><input type="radio" name="gender" value="male" required> Male</label>
                <label><input type="radio" name="gender" value="female" required> Female</label>
                <label><input type="radio" name="gender" value="others" required> Others</label>
            </div>

            <label>Mobile</label>
            <input type="text" name="mobile" value='<%=request.getParameter("mobile")%>' required/>

            <label>Department</label>
            <input type="text" name="department" value='<%=request.getParameter("department")%>' required/>

            <label>Address</label>
            <textarea name="address" rows="3" required><%=request.getParameter("address")%></textarea>

            <button type="submit">Update Employee</button>
        </form>
    </div>

    <!-- EMPTY SECTIONS (HIDDEN) -->
    <div id="registration" class="container"></div>
    <div id="login" class="container"></div>
    <div id="admin" class="section-content"></div>
    <div id="about" class="section-content"></div>
    <div id="contact" class="section-content"></div>

    <!-- SIMPLE SCRIPT -->
    <script>
        function showSection(sectionId) {
            const sections = ["home", "registration", "login", "admin", "about", "contact"];

            sections.forEach(id => {
                document.getElementById(id).style.display =
                    (id === sectionId) ? "block" : "none";
            });
        }

        // Default open
        showSection('home');
    </script>

</body>
</html>
