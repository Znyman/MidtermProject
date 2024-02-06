<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Monster</title>
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

    .progress {
        height: 25px;
        background-color: #1e2125;
    }
    .progress-bar {
        background-color: #c5b358; /* Witcher gold */
    }
    .progress-bar-striped {
        background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
    }
</style>
</head>
<body>
<jsp:include page="nav.jsp" />

<div class="container">
    <c:choose>
        <c:when test="${not empty monster}">
            <h2>${monster.name}</h2>
            <br>
            ${monster.description}
            <br>
            <label for="healthBar">Health:</label>
            <div class="progress">
                <div id="healthBar" class="progress-bar progress-bar-striped" role="progressbar" style="width: ${monster.health / 20.0 * 100}%" aria-valuenow="${monster.health}" aria-valuemin="0" aria-valuemax="20">${monster.health}</div>
            </div>
            <br>

            <label for="damageBar">Strength:</label>
            <div class="progress">
                <div id="damageBar" class="progress-bar progress-bar-striped" role="progressbar" style="width: ${monster.damage / 5.0 * 100}%" aria-valuenow="${monster.damage}" aria-valuemin="0" aria-valuemax="20">${monster.damage}</div>
            </div>
            <br>

            <label for="expBar">Bounty:</label>
            <div class="progress">
                <div id="expBar" class="progress-bar progress-bar-striped" role="progressbar" style="width: ${monster.experienceReward / 5.0 * 100}%" aria-valuenow="${monster.experienceReward}" aria-valuemin="0" aria-valuemax="20">${monster.experienceReward}</div>
            </div>
            <!-- Add more details as needed -->
        </c:when>
        <c:otherwise>
            <h2>Monster not found.</h2>
        </c:otherwise>
    </c:choose>

    <div>
        <c:if test="${not empty monster.imageUrl}">
            <img src="${monster.imageUrl}" alt="Monster Image">
        </c:if>
    </div>
</div>


<div class="container">
    <c:choose>
        <c:when test="${not empty monster && not empty player}">
            <h2>Battle Arena</h2>
            <div class="row">
                <div class="col-md-6">
                    <h3>Player: ${player.name}</h3>
                    <p>Health: 
                        <div class="progress status-bar">
                            <div class="progress-bar" role="progressbar" style="width: ${player.currentHealth / 20.0 * 100}%;" aria-valuenow="${player.currentHealth}" aria-valuemin="0" aria-valuemax="20">${player.currentHealth}</div>
                        </div>
                    </p>
                  
                </div>
                <div class="col-md-6">
                    <h3>Monster: ${monster.name}</h3>
                    <p>Health: 
                       <div class="progress status-bar">
    <div class="progress-bar" role="progressbar" style="width: ${monster.health / 20.0 * 100}%;" aria-valuenow="${monster.health}" aria-valuemin="0" aria-valuemax="20">
        ${monster.health}
    </div>
</div>
                    </p>
                    <p>Strength: ${monster.damage}</p>
                </div>
            </div>
        <form action="witcherAttack.do" method="post">
    <div class="form-group">
        <label for="weaponSelect">Choose your weapon:</label>
        <select id="weaponSelect" name="weaponId" class="form-control">
            <c:forEach items="${weapons}" var="weapon">
                <option value="${weapon.id}">${weapon.name} | Weapon Damage: ${weapon.damage}</option>
            </c:forEach>
        </select>
    </div>
  
    <input type="hidden" name="monsterId" value="${monster.id}" />
    <input type="submit" value="Attack Monster" class="btn btn-danger" />
</form><br>
        </c:when>
        <c:otherwise>
            <p>It's going to be a long hike back...</p>
        <br>
      	<form action="playGame.do" method="GET">
            <input type="submit" class="btn btn-success" value="Return to Town">
        </form>
        </c:otherwise>
    </c:choose>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>