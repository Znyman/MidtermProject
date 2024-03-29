<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Witcher Old World - Home</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-image: url('https://images.alphacoders.com/128/1282154.jpg'); 
        background-size: cover; 
        background-attachment: fixed; 
        color: #fff; 
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        margin-top: 75px; 
        font-size: 66px; 
        color: #fff; 
    	font-family: 'Papyrus', 'Mason Serif', serif; 
    }

    form {
        max-width: 400px;
        margin: 50px auto; 
        text-align: center;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="submit"] {
        width: calc(100% - 22px); 
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #555; 
        border-radius: 5px;
        background-color: #444; 
        color: #fff; 
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus {
        outline: none; 
        border-color: #45a049; 
    }

    input[type="submit"] {
        border: none;
        background-color: #4CAF50; 
        cursor: pointer;
        transition: background-color 0.3s; 
    }

    input[type="submit"]:hover {
        background-color: #45a049; 
    }

    .create-account-button {
        background-color: #555; 
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px;
        margin-top: 20px;
        cursor: pointer;
        width: calc(100% - 22px); 
    }

.create-account-button {
    width: auto; 
    padding: 8px 12px;
    font-size: 14px; 
    font-weight: bold; 
    border: none;
    background-color: #800080; 
    color: black; 
    cursor: pointer;
    transition: background-color 0.3s;
    display: block;
    margin: 5px auto 5px; 
}

    .account-creation-form {
        display: none; 
        background-color: #555; 
        border: 1px solid #888; 
        border-radius: 5px;
        padding: 20px;
        margin-top: 20px;
    }

    .form-header {
        text-align: center;
        margin-bottom: 10px;
        color: #fff; 
    }

    /* Animation */
    @keyframes loginAnimation {
        0% { transform: scale(1); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }
</style>

</head>
<body>
    <jsp:include page="nav.jsp" />

    <h2>Welcome to the Witcher Old World Game</h2>

    <form action="login.do" method="POST">
        <input type="text" name="username" placeholder="Username" required>
        <br>
        <input type="password" name="password" placeholder="Password" required>
        <br>
        <input type="submit" value="Log In" onclick="animateLogin()">
    </form>

    <!-- Create Account button -->
    <button class="create-account-button" onclick="toggleAccountCreation()">Create Account</button>

    <!-- Account creation form -->
    <div class="account-creation-form" id="accountCreationForm">
        <jsp:include page="createAccount.jsp"/>
    </div>

    <!-- JavaScript to toggle account creation form visibility -->
    <script>
        function toggleAccountCreation() {
            var form = document.querySelector('.account-creation-form');
            if (form.style.display === 'none' || form.style.display === '') {
                form.style.display = 'block';
            } else {
                form.style.display = 'none';
            }
        }

        function animateLogin() {
            var submitButton = document.querySelector('input[type="submit"]');
            submitButton.style.animation = 'loginAnimation 1s';
            setTimeout(function() {
                submitButton.style.animation = '';
                // Redirect to account page after animation
                window.location.href = 'accountPage.jsp';
            }, 1000); // Adjust the delay as needed
        }
    </script>

</body>
</html>
