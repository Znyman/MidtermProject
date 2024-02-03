<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Inventory</title>
</head>
<body>
<center>
<img src="https://static.wikia.nocookie.net/witcher/images/e/e9/Satchel_and_hook.png/revision/latest?cb=20080413164941">
</center><br>
	<c:choose>
		<c:when test="${weapons !=null}">
			<c:forEach var="weapon" items="${weapons}">
				<a href="getWeapon.do?id=${weapon.id}">${weapon.name}</a>
				<br>
			</c:forEach>
		</c:when>
		<c:when test="${armors !=null}">
			<c:forEach var="armor" items="${armors}">
				<a href="getArmor.do?id=${armor.id}">${armor.name}</a>
				<br>
			</c:forEach>
		</c:when>

		<c:otherwise>
			<p>No weapons or armor found.</p>
		</c:otherwise>
	</c:choose><br>
You have ${player.experienceLevel} experience which means you can craft ${player.experienceLevel} pieces of gear before heading out on your next journey!
	<br>

	<form action="createArmor.do" method="POST">
		<input type="submit" value="Create Armor">
	</form>
	<br>
	<form action="createWeapon.do" method="POST">
		<input type="submit" value="Create Weapon">
	</form>

</body>
</html>