<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Inventory</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
        background-color: #0e0e10;
        color: #d4d4d2;
        font-family: 'Times New Roman', Times, serif;
    }
    h2, p, a {
        color: #c5b358; /* Witcher gold */
    }
    img {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
        margin-top: 20px;
    }
    .container {
        max-width: 800px;
        margin: auto;
        padding-top: 20px;
        text-align: center; 
    }
    .btn-primary, .btn-secondary {
        margin-top: 10px;
        background-color: #004445; /* Dark green background */
        border: none;
    }
    .btn-primary:hover, .btn-secondary:hover {
        background-color: #f4b942; /* Witcher medallion gold for hover */
    }
    a {
        color: #d4d4d2;
        text-decoration: none;
    }
    a:hover {
        color: #f4b942;
    }
</style>
</head>
<body>
<jsp:include page="nav.jsp" />
<div class="container">
    <img src="https://cdna.artstation.com/p/assets/images/images/021/653/600/large/vitaliy-vatsko-2.jpg?1572463828" alt="Inventory Image">
    <h2>Manage Inventory</h2>
   <!-- Check for weapons -->
    <c:choose>
        <c:when test="${not empty weapons}">
            <c:forEach var="weapon" items="${weapons}">
                Equipped Weapon: <a href="getWeapon.do?id=${weapon.id}">${weapon.name}</a><br>
         Description: ${weapon.description} <br><br>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No weapons found.</p>
        </c:otherwise>
    </c:choose>
    
    <!-- Check for armors -->
    <c:choose>
        <c:when test="${not empty armors}">
            <c:forEach var="armor" items="${armors}">
                Equipped Armor: <a href="getArmor.do?id=${armor.id}">${armor.name}</a><br>
          Description: ${armor.description} <br><br>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>No armor found.</p>
        </c:otherwise>
    </c:choose><br>
    <p>You have ${player.experienceLevel} upgrade points which means you can craft ${player.experienceLevel} pieces of gear before heading out on your next journey!</p>
    <c:if test="${player.experienceLevel > 0}">
    <form action="newArmor.do" method="GET">
        <input type="submit" class="btn btn-primary" value="Create Armor">
    </form>
    <form action="newWeapon.do" method="GET">
        <input type="submit" class="btn btn-secondary" value="Create Weapon">
    </form>
</c:if>

<c:if test="${player.experienceLevel <= 0}">
    <p>Battle more monsters to gain upgrade points!</p><br>
 			<form action="playGame.do" method="GET">
            <input type="submit" class="btn btn-success" value="Play Game">
        </form>

</c:if>
    
</div>
<!-- Optional JavaScript; choose one of the two! -->
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
