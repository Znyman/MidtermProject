<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weapon Details</title>
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
			<c:when test="${not empty weapon}">
				<h2>${weapon.name}</h2>
				<br>
				<p>Description: ${weapon.description}</p>
				<br>
				<p>Damage: ${weapon.damage}</p>
				<br>
				<p>Weapon Tier: ${weapon.tier}</p>
				<br>

				<div>
					<h2>Update this weapon in the database</h2>
					<form action="updateWeapon.do" method="POST" id="updateWeaponForm">

						<input type="hidden" name="id" value="${weapon.id}">
						<label for="name"><em>What would you like to rename this weapon to?</em></label>
						<input type="text" id="name" name="name">
						<br>
						<label for="description"><em>What would you like to say about the description of this weapon?</em></label>
						<input type="text" id="description" name="description">
						<br>
						<label for="damage"><em>How much damage does this weapon do now?</em></label>
						<input type="range" id="damage" name="damage" min="1" max="5">
						<br>
						<label for="tier"><em>What tier is this weapon now?</em></label>
						<input type="range" id="tier" name="tier" min="1" max="3">
						<br>
						<input type="submit" value="Update Weapon" />
					</form>
					<form action="deleteWeapon.do" method="POST">
						<input type="hidden" name="id" value="${weapon.id}" />
						<input type="submit" value="Delete Weapon" />
					</form>
					<form action="manageInventory.do" method="GET">
						<input type="hidden" name="playerId" value="${player.id}">
						<input type="submit" value="Manage Inventory">
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<h2>Weapon not found.</h2>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>