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
	<jsp:include page="nav.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-sm">Storyline Information</div>
			<div class="col-sm">
				<c:if test="${not empty player.imageUrl}">
					<img src="${player.imageUrl}">
				</c:if>
				<c:if test="${empty player.imageUrl}">
					<img src="https://i.ibb.co/RCtjyDv/DALL-E-2024-02-03-14-11-09-Create-an-image-of-a-Witcher-style-character-standing-on-a-hill-at-dawn-l.png">
				</c:if>
				<br>
				<form action="manageInventory.do" method="GET">
					<input type="submit" value="Manage Inventory" />
				</form>
			</div>
			<div class="col-sm">
				Current Location: ${location.name}
				<br>
				<img src="${location.imageUrl}">
				<br>
				<form action="changeLocation.do">
					<input type="hidden" name="locationId" value="2">
					<input type="submit" value="Go To Hengfors">
				</form>
				<br>
				<form action="changeLocation.do">
					<input type="hidden" name="locationId" value="3">
					<input type="submit" value="Go To Novigrad">
				</form>
				<br>
				<form action="changeLocation.do">
					<input type="hidden" name="locationId" value="4">
					<input type="submit" value="Go To Cidaris">
				</form>
				<br>
				<form action="changeLocation.do">
					<input type="hidden" name="locationId" value="5">
					<input type="submit" value="Go To Cintra">
				</form>
			</div>
		</div>
	</div>




<!-- Optional JavaScript and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>