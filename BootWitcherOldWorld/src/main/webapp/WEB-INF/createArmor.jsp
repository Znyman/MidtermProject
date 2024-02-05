<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Armor</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div>
		<c:choose>
		<c:when test="${player.experienceLevel > 0}">
			<h2>Add armor to the database</h2>
			<form action="newArmor.do" method="POST" id="newArmorForm">

				<label for="name"><em>What would you like to name this armor?</em></label>
				<input type="text" id="name" name="name" value="Leather Bracers" required>
				<br>
				<label for="description"><em>What would you like to say about the description of this armor?</em></label>
				<input type="text" id="description" name="description" value="Sturdy bracers from the Witcher Academy" required>
				<br>
				<label for="defense"><em>How much defense does this armor have?</em></label>
				<input type="range" id="defense" name="defense" min="1" max="5">
				<br>
				<label for="tier"><em>What tier is this armor?</em></label>
				<input type="range" id="tier" name="tier" min="1" max="3">
				<br>
				<input type="submit" class="btn btn-primary" value="Add Armor">
			</form>
		</c:when>
		<c:otherwise>
			Not enough experience to craft gear. Go kill monsters for experience!
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>