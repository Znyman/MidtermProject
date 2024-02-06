<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Weapon</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div>
		<c:choose>
		<c:when test="${player.experienceLevel > 0}">
			<h2>Add a weapon to the database</h2>
			<form action="newWeapon.do" method="POST" id="newWeaponForm">
	
				<label for="name"><em>What is the name of this weapon?</em></label>
				<input type="text" id="name" name="name" value="Viper's Sting" required>
				<br>
				<label for="description"><em>What would you like to say about the description of this weapon?</em></label>
				<input type="text" id="description" name="description" value="Punctures through most armor and flesh" required>
				<br>
				<label for="damage"><em>How much damage does this weapon have?</em></label>
				<input type="range" id="damage" name="damage" min="1" max="5">
				<br>
				<label for="tier"><em>What tier is this armor now?</em></label>
				<input type="range" id="tier" name="tier" min="1" max="3">
				<br>
				<input type="submit" class="btn btn-primary" value="Add Weapon">
			</form>
		</c:when>
		<c:otherwise>
			Not enough experience to craft gear. Go kill monsters for experience!
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>