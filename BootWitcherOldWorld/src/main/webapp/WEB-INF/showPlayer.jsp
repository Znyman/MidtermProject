<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Player Details</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.alphacoders.com/128/1282154.jpg'); 
            background-size: cover; 
            background-attachment: fixed; 
            color: #fff; 
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px; /* Increase padding */
            box-sizing: border-box; /* Ensure padding is included in the width */
            text-align: center; 
            height: 100vh; /* Set container height to fill the viewport */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h2 {
            font-size: 36px; 
            color: #c5b358; /* Witcher gold */
            font-family: 'Papyrus', 'Mason Serif', serif; 
            margin-bottom: 20px; /* Add margin bottom */
        }

        .player-image {
            max-width: 300px;
            height: auto;
            border-radius: 5px;
            margin-top: 20px;
            margin-bottom: 20px; /* Add margin bottom */
        }

        .player-details {
            text-align: left;
        }

        .progress-container {
            margin-bottom: 20px;
        }

        .progress-label {
            font-weight: bold;
            color: #c5b358; /* Witcher gold */
        }

        .health-bar .progress-bar {
            background-color: #4CAF50; /* Green */
        }

        .experience-bar .progress-bar {
            background-color: #c5b358; /* Witcher gold */
        }

        .experience-bar.high .progress-bar {
            background-color: #ffeb3b; /* Yellow */
        }

        .experience-bar.medium .progress-bar {
            background-color: #ff9800; /* Orange */
        }

        .experience-bar.low .progress-bar {
            background-color: #f44336; /* Red */
        }

        .update-player-button, .manage-inventory-button {
            background-color: #004445; /* Dark green background */
            border: none;
            color: #fff;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .update-player-button:hover, .manage-inventory-button:hover {
            background-color: #f4b942; /* Witcher medallion gold for hover */
        }
    </style>

</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="container">
        <h2>Player Details</h2>

        <div class="player-details">
            <c:choose>
                <c:when test="${not empty player}">
                    <h2>${player.name}</h2>

                    <c:if test="${not empty player.imageUrl}">
                        <img src="${player.imageUrl}" class="player-image">
                    </c:if>
                    <c:if test="${empty player.imageUrl}">
                        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" class="player-image">
                    </c:if>

                    <div class="progress-container health-bar">
                        <p class="progress-label">Health:</p>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: ${player.currentHealth / player.maxHealth * 100}%;" aria-valuenow="${player.currentHealth}" aria-valuemin="0" aria-valuemax="${player.maxHealth}">${player.currentHealth}/${player.maxHealth}</div>
                        </div>
                    </div>

                    <div class="progress-container experience-bar">
                        <p class="progress-label">Experience:</p>
                        <div class="progress">
                            <div class="progress-bar ${player.experienceLevel > 75 ? 'high' : (player.experienceLevel > 50 ? 'medium' : 'low')}" role="progressbar" style="width: ${player.experienceLevel}%;" aria-valuenow="${player.experienceLevel}" aria-valuemin="0" aria-valuemax="100">${player.experienceLevel}%</div>
                        </div>
                    </div>

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
                            <input type="hidden" name="currentHealth" value="${player.currentHealth}">
                            <input type="hidden" name="maxHealth" value="${player.maxHealth}">
                            <input type="hidden" name="experienceLevel" value="${player.experienceLevel}">
                            <input type="submit" class="update-player-button" value="Update Player" />
                        </form>
                        <form action="manageInventory.do" method="GET">
                            <input type="submit" class="manage-inventory-button" value="Manage Inventory" />
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <h2>Player not found.</h2>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- JavaScript to toggle account creation form visibility -->
    <script>
        function toggleAccountCreation() {
            var form = document.querySelector('.account-creation-form');
            if (form.style.display === 'none' || form.style.display === '') {
                form.style.display = 'block';
            } else {
                form.style.display = 'none';
            }
        }

        function animateLogin() {
            var submitButton = document.querySelector('input[type="submit"]');
            submitButton.style.animation = 'loginAnimation 1s';
            setTimeout(function() {
                submitButton.style.animation = '';
                // Redirect to account page after animation
                window.location.href = 'accountPage.jsp';
            }, 1000); // Adjust the delay as needed
        }
    </script>

</body>
</html>