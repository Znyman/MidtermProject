<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Player</title>
</head>
<body>
	<c:choose>
		<c:when test="${loginUser!=null}">
			<h2>Create Account</h2>
			<form action="createPlayer.do" method="POST">
				<label for="name">Character Name:</label>
				<input type="text" id="name" name="name" required>
				<br>
				<label for="description">Character Description/Back Story:</label>
				<input type="text" id="description" name="description" required>
				<br>
				<label for="imageUrl">If you would like to have an image for your character, put in a URL to your preffered image:</label>
				<input type="text" id="imageUrl" name="imageUrl">
				<br> <input type="hidden" name="role" value="player">
				<input type="hidden" name="currentHealth" value="20">
				<input type="hidden" name="maxHealth" value="20">
				<input type="hidden" name="experienceLevel" value="3">
				<input type="submit" value="Create Player">
			</form>
		</c:when>

		<c:otherwise>
			<p>Not Logged In</p>
		</c:otherwise>
	</c:choose>
</body>
</html>