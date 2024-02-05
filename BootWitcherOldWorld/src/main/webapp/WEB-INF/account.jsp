<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Account Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #0e0e10;
            color: #d4d4d2;
            font-family: 'Times New Roman', Times, serif;
        }
        h2, p {
            color: #c5b358;
        }
        img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding-top: 20px;
        }
        .form-control, .btn {
            margin-top: 10px;
        }
        /* Nav styling */
        .navbar-custom {
            background-color: #004445; /* Dark green background */
        }
        .navbar-custom .navbar-brand, 
        .navbar-custom .navbar-nav .nav-link {
            color: #d4d4d2; /* Light gray text */
        }
        .navbar-custom .navbar-nav .nav-link:hover {
            color: #f4b942; /* Witcher medallion gold for hover */
        }
    </style>
</head>
<body>
    <!-- Assuming nav.jsp contains the Bootstrap navbar structure -->
    <jsp:include page="nav.jsp" />
    <div class="container text-center">
        <img src="https://oc3dmedia.s3.eu-west-2.amazonaws.com/2022/12/the-witchers-3-best-graphics-mod-may-be-added-to-the-games-next-gen-version_6398bbd636f38.jpeg" alt="Witcher Image">
        <h2>User Account Details:</h2>
        <c:choose>
            <c:when test="${loginUser!=null}">
                <p>User id: <c:out value="${loginUser.username}"/></p>
                <p>Email: <c:out value="${loginUser.email}"/></p>
                <p>Role: <c:out value="${loginUser.role}"/></p>
                <p>User Active: <c:out value="${loginUser.enabled}"/></p>
            </c:when>
            <c:otherwise>
                <p>Not Logged In</p>
            </c:otherwise>
        </c:choose>
        
                <c:choose>
            <c:when test="${player!=null}">
        <form action="showPlayer.do" method="GET">
            <input type="submit" class="btn btn-secondary" value="Show Player">
        </form><br>
           
        <form action="playGame.do" method="GET">
            <input type="submit" class="btn btn-success" value="Play Game">
        </form>
            </c:when>
            <c:otherwise>
        <form action="createPlayer.do" method="GET">
            <input type="submit" class="btn btn-primary" value="Create Player">
        </form>
               
            </c:otherwise>
        </c:choose>
        
        
    </div>
    <!-- Optional JavaScript and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

