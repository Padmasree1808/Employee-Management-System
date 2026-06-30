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
            background-image: url('https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg');
            /* ★ NEW background for Registration Page */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            padding-top: 150px;
            transition: background-image ease;
        }

        .welcome-bar {
            position: fixed;
            top: 0;
            width: 100%;
            text-align: center;
            padding: 15px 0;
            font-size: 24px;
            font-weight: bold;
            color: black;
            z-index: 1000;
        }

        .welcome-bar:hover {
            text-decoration: none;
            color: beige;
        }

        nav {
            position: fixed;
            top: 55px;
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 15px 0;
            z-index: 999;
            background-color: transparent;
        }

        nav a {
            color: black;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
        }

        nav a:hover {
            text-decoration: underline;
            color: bisque;
        }

        .container,
        .section-content {
            max-width: 500px;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.75);
            padding: 30px;
            border-radius: 25px;
            border: 2px solid #444;
            display: block;
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

        input,
        select,
        textarea {
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
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #005f9e;
        }

        .home-content {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: darkslategray;
        }
    </style>
</head>

<body>
    <div class="welcome-bar">
        <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
    </div>

    <nav>
        <a href="index">Home</a>
        <a href="register">Registration</a>
        <a href="login">Login</a>
        <a href="aboutus">About Us</a>
        <a href="contactus">Contact Us</a>
    </nav>

    <div id="home" class="container">
        <form action='save'>
            <h1 style="text-align: center;">Registration Page</h1>

            <% if(request.getAttribute("status") != null){ %>
                <h1 style="text-align: center;"><%=request.getAttribute("status")%></h1>
            <%} %>

            <label for="name">Name</label>
            <input type="text" name="name" required />

            <label for="email">Email</label>
            <input type="text" name="email" required />

            <label for="password">Password</label>
            <input type="password" name="password" required />

            <label for="age">Enter Age</label>
            <input type="text" name="age" required />

            <label>Gender</label>
            <div class="gender">
                <label><input type="radio" name="gender" value="male" required /> Male</label>
                <label><input type="radio" name="gender" value="female" required /> Female</label>
                <label><input type="radio" name="gender" value="others" required /> Others</label>
            </div>

            <label for="mobile">Mobile</label>
            <input type="text" name="mobile" pattern="[0-9]{10}" required />

            <label for="department">Department</label>
            <input type="text" name="department" required />

            <label for="address">Address</label>
            <textarea name="address" rows="3" required></textarea>

            <button type="submit">Register</button>
        </form>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll('.container, .section-content').forEach(div => {
                if (div.innerHTML.trim() === '') {
                    div.style.display = 'none';
                }
            });
        });
    </script>

</body>

</html>
