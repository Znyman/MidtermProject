<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Defeat Monster</title>
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
            margin-bottom: 10px; /* Add margin between progress bars */
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
    <jsp:include page="../nav.jsp" />
    <div class="container">
        <h2>Congratulations!</h2>
        <br>
        <h3>You have defeated the monster!</h3>
        <!-- Display any additional information or rewards for defeating the monster -->
        <p>Upgrade Points Received: ${monster.experienceReward}</p>
        <p>Upgrade Points Available: ${player.experienceLevel}</p>
        <!-- Player stats as progress bars -->
        <c:choose>
            <c:when test="${not empty player}">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Player: ${player.name}</h3>
                        <p>Health: 
                            <div class="progress status-bar">
                                <div class="progress-bar" role="progressbar" style="width: ${player.currentHealth / 20.0 * 100}%;" aria-valuenow="${player.currentHealth}" aria-valuemin="0" aria-valuemax="20">${player.currentHealth}</div>
                            </div>
                        </p>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <form action="playGame.do" method="GET">
        <input type="submit" class="btn btn-success" value="Return To Town">
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
