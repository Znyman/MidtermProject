<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Witcher Old World - Home</title>
</head>
<body>

	<jsp:include page="nav.jsp" />

	<h2>Welcome to the Witcher Old World Game</h2>

	<form action="login.do" method="POST">
		<input type="text" name="username" placeholder="Username" required>
		<input type="password" name="password" required>
		<input type="submit" value="Log In">
	</form>


</body>
</html>
