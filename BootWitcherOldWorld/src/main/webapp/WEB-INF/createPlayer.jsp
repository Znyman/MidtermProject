<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Player</title>
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

        label {
            color: #c5b358; /* Witcher gold */
            font-weight: bold;
        }

        input[type="text"], input[type="submit"], input[type="file"] {
            margin-top: 10px;
            padding: 8px;
            border-radius: 5px;
            border: none;
        }

        input[type="submit"] {
            background-color: #004445; /* Dark green background */
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #f4b942; /* Witcher medallion gold for hover */
        }

        .input-group {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 10px;
        }

        .input-group label,
        .input-group input {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="container">
        <h2>Create Player</h2>

        <c:choose>
            <c:when test="${loginUser != null}">
                <form action="createPlayer.do" method="POST" enctype="multipart/form-data">
                    <label for="name">Character Name:</label>
                    <input type="text" id="name" name="name" required>
                    <br>
                    <label for="description">Character Description/Back Story:</label>
                    <input type="text" id="description" name="description" required>
                    <br>
                    <div class="input-group">
                        <label for="imageUrl">Character Image URL:</label>
                        <input type="text" id="imageUrl" name="imageUrl">
                    </div>
                    <div class="input-group">
                        <label for="imageFile">Or Upload Character Image:</label>
                        <input type="file" id="imageFile" name="imageFile">
                    </div>
                    <br>
                    <input type="hidden" name="role" value="player">
                    <input type="hidden" name="currentHealth" value="20">
                    <input type="hidden" name="maxHealth" value="20">
                    <input type="hidden" name="experienceLevel" value="3">
                    <input type="submit" value="Create Player">
                </form>
            </c:when>
            <c:otherwise>
                <p>Not Logged In</p>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- JavaScript to handle file selection -->
    <script>
        document.getElementById('imageFile').addEventListener('change', function() {
            var fileInput = this;
            var filenameDisplay = document.getElementById('imageUrl');
            if (fileInput.files.length > 0) {
                filenameDisplay.value = fileInput.files[0].name;
            } else {
                filenameDisplay.value = '';
            }
        });
    </script>
</body>
</html>