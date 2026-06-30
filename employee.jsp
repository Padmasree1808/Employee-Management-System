<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management System</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-image: url('https://images.pexels.com/photos/3184635/pexels-photo-3184635.jpeg');
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
    padding: 15px;
    font-size: 24px;
    font-weight: bold;
    color: black;
}

nav {
    position: fixed;
    top: 55px;
    width: 100%;
    display: flex;
    justify-content: center;
    gap: 30px;
    padding: 15px;
}

nav a {
    color: black;
    text-decoration: none;
    font-weight: bold;
    font-size: 18px;
}

nav a:hover {
    color: beige;
    text-decoration: underline;
}

.container {
    width: 500px;
    margin: auto;
    background: rgba(255,255,255,0.7);
    padding: 30px;
    border-radius: 20px;
    text-align: center;
    border: 2px solid gray;
}

.container h2 {
    color: darkblue;
    margin-bottom: 20px;
}

.container p {
    font-size: 18px;
}
</style>

</head>

<body>

<div class="welcome-bar">
    <h3>WELCOME TO EMPLOYEE MANAGEMENT SYSTEM</h3>
</div>

<nav>
    <a href="employee">Home</a>
    <a href="view?email=${email}">View Profile</a>
    <a href="emplogout">Logout</a>
</nav>

<div class="container">

    <h2>${msg}</h2>

    <p>
        Click <b>View Profile</b> to see your employee details.
    </p>

</div>

</body>
</html>