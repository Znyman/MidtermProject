<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weapon Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
        background-color: #0e0e10;
        color: #d4d4d2;
        font-family: 'Times New Roman', Times, serif;
        margin: 0;
        padding: 0;
    }
    h2, p, a {
        color: #c5b358; /* Witcher gold */
    }
    
    h2{
        font-family: 'Papyrus', 'Mason Serif', serif; 
    
    }
    img {
        width: 100%;
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
        border-radius: 5px; /* Add border radius */
    }
    .btn-primary:hover, .btn-secondary:hover {
        background-color: #f4b942; /* Witcher medallion gold for hover */
    }
    .btn-danger { /* Red button */
        background-color: #d9534f;
    }
    a {
        color: #d4d4d2;
        text-decoration: none;
    }
    a:hover {
        color: #f4b942;
    }
    .row {
        display: flex;
        justify-content: center;
    }
    .col-half {
        width: 50%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .bottom-container {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Two columns with equal width */
        grid-gap: 10px; /* Add gap between items */
        margin-top: 10px;
    }

    .bottom-container .col-half {
        width: 50%;
    }
    .smaller-image {
        width: 80%; /* Adjust the width as needed */
    }
    
    /* Initially small text inputs */
    input[type="text"].form-control {
        height: 30px; /* Initial height */
        width: auto; /* Initial width */
        transition: height 0.3s ease-in-out, width 0.3s ease-in-out; /* Smooth transition */
        display: block; /* Ensure it's block-level for centering */
        margin: 0 auto; /* Center horizontally */
    }
    
    /* Expanded text inputs */
    input[type="text"].form-control.expanded {
        height: 100px; /* Expanded height */
        width: 100%; /* Expanded width */
    }
</style>


</head>
<body>
    <jsp:include page="../nav.jsp" />
    <div class="container">
        <div>
            <c:if test="${not empty updateMessage}">
                <h1>${updateMessage}</h1>
            </c:if>
        </div>
        <div>
            <c:choose>
                <c:when test="${not empty weapon}">
                    <h2>${weapon.name}</h2>
                    <p>Description: ${weapon.description}</p>
                    <p>Damage: ${weapon.damage}</p>
                    <p>Weapon Tier: ${weapon.tier}</p>
    
                    <div>
                        <h2>Update this weapon in the database</h2>
                        <form action="updateWeapon.do" method="POST" id="updateWeaponForm">
                            <input type="hidden" name="id" value="${weapon.id}">
                            <label for="name"><em>What would you like to rename this weapon to?</em></label>
                            <input type="text" id="name" name="name" value="Viper's Sting" class="form-control">
                            <label for="description"><em>What would you like to say about the description of this weapon?</em></label>
                            <input type="text" id="description" name="description" value="Punctures through most armor and flesh" class="form-control">
                            <label for="damage"><em>How much damage does this weapon do now?</em></label>
                            <input type="range" id="damage" name="damage" min="1" max="3" class="form-control">
                            <label for="tier"><em>What tier is this weapon now?</em></label>
                            <input type="range" id="tier" name="tier" min="1" max="2" class="form-control">
                            <input type="submit" value="Update Weapon" class="btn btn-primary">
                        </form>
                        <strong>Delete items wisely because that's your only way to win fights against monsters!</strong>
                        <form action="deleteWeapon.do" method="POST">
                            <input type="hidden" name="id" value="${weapon.id}" />
                            <input type="submit" value="Delete Weapon" class="btn btn-danger">
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <h2>Weapon not found.</h2>
                </c:otherwise>
            </c:choose>
            <form action="manageInventory.do" method="GET">
                <input type="hidden" name="playerId" value="${player.id}">
                <input type="submit" value="Manage Inventory" class="btn btn-primary">
            </form>
			<br> <br>
		</div>
    </div>
    <script>
        // Get all text inputs with class "form-control"
        const textInputs = document.querySelectorAll('input[type="text"].form-control');
        
        // Add event listeners to each text input
        textInputs.forEach(input => {
            // Add focus event listener
            input.addEventListener('focus', function() {
                this.classList.add('expanded'); // Add "expanded" class on focus
            });
            
            // Add blur event listener
            input.addEventListener('blur', function() {
                if (this.value.trim() === '') {
                    this.classList.remove('expanded'); // Remove "expanded" class if input is empty on blur
                }
            });
        });
        </script>

</body>
</html>