<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Armor Details</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div>
		<c:if test="${not empty updateMessage}">
			<h1>${updateMessage}</h1>
			<br>
		</c:if>
	</div>
	<div>
		<c:choose>
			<c:when test="${not empty armor}">
				<h2>${armor.name}</h2>
				<br>
				<p>Description: ${armor.description}</p>
				<br>
				<p>Defense: ${armor.defense}</p>
				<br>
				<p>Armor Tier: ${armor.tier}</p>
				<br>

				<div>
					<h2>Update this armor in the database</h2>
					<form action="updateArmor.do" method="POST" id="updateArmorForm">

						<input type="hidden" name="id" value="${armor.id}">
						<label for="name"><em>What would you like to rename this armor to?</em></label>
						<input type="text" id="name" name="name">
						<br>
						<label for="description"><em>What would you like to say about the description of this armor?</em></label>
						<input type="text" id="description" name="description">
						<br>
						<label for="defense"><em>How much defense does this armor have now?</em></label>
						<input type="range" id="defense" name="defense" min="1" max="5">
						<br>
						<label for="tier"><em>What tier is this armor now?</em></label>
						<input type="range" id="tier" name="tier" min="1" max="3">
						<br>
						<input type="submit" value="Update Armor" />
					</form>
					<br>
					<strong>Delete items wisely because that's your only way to win fights against monsters!</strong>
					<form action="deleteArmor.do" method="POST">
						<input type="hidden" name="id" value="${armor.id}" />
						<input type="submit" value="Delete Armor" />
					</form>
					<br>
					<form action="manageInventory.do" method="GET">
						<input type="hidden" name="playerId" value="${player.id}">
						<input type="submit" value="Manage Inventory">
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<h2>Armor not found.</h2>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>