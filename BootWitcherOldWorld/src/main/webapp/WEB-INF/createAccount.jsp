<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Witcher Board Game - Create Account</title>
</head>
<body>

    <h2>Create Account</h2>
    <form action="createAccount.do" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
<br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
<br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
<br>
        <input type="hidden" name="role" value="player">

        <input type="hidden" name="enabled" value="true">
        <input type="submit" value="Create Account">
    </form>
</body>
</html>
