<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ekimmara</title>
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
<body>

    <h2>Ekimmara Details</h2>


    <div>
        <c:if test="${not empty updateMessage}">
            <h1>${updateMessage}</h1>
            <br>
        </c:if>
    </div>

    <div>
        <c:choose>
            <c:when test="${not empty monster}">
                <h2>${monster.name}</h2>
                <br>
                <p>Health: ${monster.health}</p>
                <br>
                <p>Strength: ${monster.damage}</p>
                <br>
                <p>Bounty: ${monster.experienceReward}</p>
                <!-- Add more details as needed -->
            </c:when>
            <c:otherwise>
                <h2>Monster not found.</h2>
            </c:otherwise>
        </c:choose>
    </div>

    <div>
        <c:if test="${not empty monster.imageUrl}">
            <img src="${monster.imageUrl}" alt="Monster Image" style="max-width: 100%; height: auto;">
        </c:if>
    </div>


<!-- Optional JavaScript and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>