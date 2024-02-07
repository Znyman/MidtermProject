<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${location.name}</title>
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
        width: 100%;
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
    
</style>
</head>
<body>
    <jsp:include page="../nav.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-half">
                <h2>${location.description}</h2>
                <c:choose>
                    <c:when test="${not empty player.weapons}">
                        <form action="showMonster.do" method="GET">
                            <button type="submit" class="btn btn-danger">Fight the monster at this location</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <strong>You crazy fool! You need a weapon to fight monsters!</strong>
                    </c:otherwise>
                </c:choose>
                <form action="meditate.do" method="POST">
                    <input type="submit" class="btn btn-success" value="Meditate">
                </form>
            </div>
       <div class="col-half">
    <h2>Current Location: ${location.name}</h2>
    <img src="${location.imageUrl}" alt="Location Image" class="location-image">
    <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#locationButtons" aria-expanded="false" aria-controls="locationButtons">
        View Locations
    </button>
    <div class="collapse" id="locationButtons">
		<form action="changeLocation.do">
			<input type="hidden" name="locationId" value="16">
			<input type="submit" class="btn btn-secondary" value="Go To Dhuwod">
		</form>
        <form action="changeLocation.do">
            <input type="hidden" name="locationId" value="12">
            <button type="submit" class="btn btn-secondary">Go To Glenmore</button>
        </form>
        <form action="changeLocation.do">
            <input type="hidden" name="locationId" value="14">
            <button type="submit" class="btn btn-secondary">Loc Ichaer</button>
        </form>
    </div>
</div>

			<div class="bottom-container">
				<div class="player-info">
					<!-- Player image URL -->
					<c:if test="${not empty player.imageUrl}">
						<img src="${player.imageUrl}" class="player-image smaller-image">
					</c:if>
					<c:if test="${empty player.imageUrl}">
						<img src="default-image-url.jpg"
							class="player-image smaller-image">
					</c:if>

					<form action="manageInventory.do" method="GET">
						<input type="submit" value="Manage Inventory"
							class="btn btn-primary">
					</form>
					<br> <br>
				</div>
			</div>

			<!-- Optional JavaScript and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>