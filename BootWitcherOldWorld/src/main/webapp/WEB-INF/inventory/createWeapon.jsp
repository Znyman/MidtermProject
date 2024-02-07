<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Weapon</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #0e0e10;
        color: #fff;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: auto;
        padding-top: 20px;
        text-align: center; 
    }

    h2 {
        font-size: 36px; 
        color: #c5b358; /* Witcher gold */
        font-family: 'Papyrus', 'Mason Serif', serif; 
        margin-bottom: 20px; /* Add margin bottom */
    }

    h3 {
        font-size: 24px;
        color: #c5b358; /* Witcher gold */
        margin-top: 20px; /* Adjust top margin */
        margin-bottom: 10px; /* Adjust bottom margin */
    }

    label {
        color: #c5b358; /* Witcher gold */
        font-weight: bold;
    }

    input[type="text"], input[type="range"], input[type="submit"] {
        margin-top: 10px;
        padding: 8px;
        border-radius: 5px;
        border: none;
    }

    input[type="range"] {
        width: 100%;
    }

    input[type="submit"] {
        background-color: #004445; /* Dark green background */
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 20px; /* Add top margin */
    }

    input[type="submit"]:hover {
        background-color: #f4b942; /* Witcher medallion gold for hover */
    }

    img {
        max-width: 100%;
        height: auto;
        margin-top: 20px; /* Add margin */
    }
</style>
</head>
<body>
    <jsp:include page="../nav.jsp" />

    <div class="container">
        <h2>Create Weapon</h2>

        <div>
            <c:choose>
                <c:when test="${player.experienceLevel > 0 && player.experienceLevel <= 3}">
                    <h3>Add a weapon to your inventory</h3>
                    <form action="newWeapon.do" method="POST" id="newWeaponForm">

                        <label for="name"><em>What is the name of this weapon?</em></label>
                        <input type="text" id="name" name="name" value="Viper's Sting" required>
                        <br>
                        <label for="description"><em>What would you like to say about the description of this weapon?</em></label>
                        <input type="text" id="description" name="description" value="Punctures through most armor and flesh" required>
                        <br>
                        <label for="damage"><em>How much damage does this weapon have?</em></label>
                        <input type="range" id="damage" name="damage" min="1" max="3">
                        <br>
                        <label for="tier"><em>What tier is this weapon?</em></label>
                        <input type="range" id="tier" name="tier" min="1" max="2">
                        <br>
                        <input type="submit" value="Add Weapon">
                    </form>
                    <img src="https://media1.tenor.com/m/MZ8FW4yMgBsAAAAd/ferreiro.gif" alt="Forging Weapon">
                </c:when>
                <c:otherwise>
                    <p>Craft more powerful weapons with higher experience or go kill monsters for more experience!</p>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${player.experienceLevel > 3}">
                    <h3>Add a weapon to your inventory</h3>
                    <form action="newWeapon.do" method="POST" id="newWeaponForm">

                        <label for="name"><em>What is the name of this weapon?</em></label>
                        <input type="text" id="name" name="name" value="Viper's Sting" required>
                        <br>
                        <label for="description"><em>What would you like to say about the description of this weapon?</em></label>
                        <input type="text" id="description" name="description" value="Punctures through most armor and flesh" required>
                        <br>
                        <label for="damage"><em>How much damage does this weapon have?</em></label>
                        <input type="range" id="damage" name="damage" min="4" max="6">
                        <br>
                        <label for="tier"><em>What tier is this weapon?</em></label>
                        <input type="range" id="tier" name="tier" min="3" max="4">
                        <br>
                        <input type="submit" value="Add Weapon">
                    </form>
                    <img src="https://media1.tenor.com/m/MZ8FW4yMgBsAAAAd/ferreiro.gif" alt="Forging Weapon">
                </c:when>
                <c:otherwise>
                    <p>If you save up 4 or more experience from killing monsters, you can craft more powerful weapons!</p>
                </c:otherwise>
            </c:choose>
			<form action="manageInventory.do" method="GET">
				<input type="submit" class="manage-inventory-button"
					value="Manage Inventory" />
			</form>
			<br> <br>
		</div>
    </div>
</body>
</html>