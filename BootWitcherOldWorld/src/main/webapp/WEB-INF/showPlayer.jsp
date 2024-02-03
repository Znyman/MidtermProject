<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Player Details</title>
</head>
<body>
	<div>
		<c:if test="${not empty updateMessage}">
			<h1>${updateMessage}</h1>
			<br>
		</c:if>
	</div>
	<div>
		<c:choose>
			<c:when test="${not empty player}">
				<h2>${player.name}</h2>
				<br>
				<p>Description: ${player.description}</p>
				<br>
				<p>Current Health: ${player.currentHealth}</p>
				<br>
				<p>Max Health: ${player.maxHealth}</p>
				<br>
				<p>Experience: ${player.experienceLevel}</p>
				<br>

				<div>
					<h2>Update this player in the database</h2>
					<form action="updatePlayer.do" method="POST" id="updatePlayerForm">

						<input type="hidden" name="id" value="${player.id}">
						<label for="name"><em>What would you like to rename this player to?</em></label>
						<input type="text" id="name" name="name">
						<br>
						<label for="description"><em>What would you like to say about the description of this player?</em></label>
						<input type="text" id="description" name="description">
						<br>
					</form>
					<form action="deletePlayer.do" method="POST">
						<input type="hidden" name="id" value="${player.id}" />
						<input type="submit" value="Delete Player" />
					</form>
					<form action="manageInventory.do" method="GET">
						<input type="submit" value="Manage" />
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<h2>Player not found.</h2>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>