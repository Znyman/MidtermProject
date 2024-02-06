<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Armor</title>
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
    <jsp:include page="nav.jsp" />

    <div class="container">
        <h2>Create Armor</h2>

        <div>
            <c:choose>
                <c:when test="${player.experienceLevel > 0}">
                    <h3>Add armor to your inventory</h3>
                    <form action="newArmor.do" method="POST" id="newArmorForm">

                        <label for="name"><em>What would you like to name this armor?</em></label>
                        <input type="text" id="name" name="name" value="Leather Bracers" required>
                        <br>
                        <label for="description"><em>What would you like to say about the description of this armor?</em></label>
                        <input type="text" id="description" name="description" value="Sturdy bracers from the Witcher Academy" required>
                        <br>
                        <label for="defense"><em>How much defense does this armor have?</em></label>
                        <input type="range" id="defense" name="defense" min="1" max="2">
                        <br>
                        <label for="tier"><em>What tier is this armor?</em></label>
                        <input type="range" id="tier" name="tier" min="1" max="2">
                        <br>
                        <input type="submit" value="Add Armor">
                    </form>
                    <img src="https://media.tenor.com/SHar4XI2XRQAAAAM/gwent-gwentcard.gif" alt="Forging Armor">
                </c:when>
                <c:otherwise>
                    <p>Not enough experience to craft gear. Go kill monsters for experience!</p>
                </c:otherwise>
            </c:choose>
            <form action="manageInventory.do" method="GET">
                            <input type="submit" class="manage-inventory-button" value="Manage Inventory" />
                        </form>
        </div>
    </div>
</body>
</html>