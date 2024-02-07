<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Game Introduction</title>
<!-- Bootstrap CSS -->
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
<jsp:include page="../nav.jsp" />
<div class="container text-center mt-5">
    <h2>Welcome to our game!</h2>
    <img src="https://i.ibb.co/RCtjyDv/DALL-E-2024-02-03-14-11-09-Create-an-image-of-a-Witcher-style-character-standing-on-a-hill-at-dawn-l.png" alt="Witcher Image" class="img-fluid rounded">
    <p class="mt-4">In the distant realm of Ardyl, a land where myths tread alongside mortals and magic infuses the air we breathe, the legacy of bygone battles whispers through the ages. Dark entities prowl the hidden crevices of the world, born from an epoch rife with turmoil and conflict. You are a Witcher, an itinerant guardian, a maestro of swordplay and sorcery, molded from infancy to confront the sinister beasts that haunt the innocent.</p>
<p>Whispers of your name carry a dual shroud of awe and trepidation, for Witchers are as scarce as they are misjudged—evolved, with formidable faculties to stand against the horrors that ordinary souls dare not challenge. The road you walk is solitary, laden with the sacrifices you've shouldered and the silent afflictions you endure.</p>
<p>As the first light of dawn pierces the veil over the Ironback Mountains, a missive fraught with urgency finds its way to you. It speaks of Kaer Seren, a stronghold once vibrant with the fellowship of your kin, now standing desolate, its halls echoing with the need for deliverance. The specter of a forgotten evil stirs within its walls, and only a Witcher's blade can quell its growing malice.</p>
<p>The journey to Kaer Seren is just the commencement of your saga. From there, the winds of fate may carry you to the bustling trade lanes of Hengfors, through the arcane alleys of Novigrad, along the gallant shores of Cidaris, and to the storied gates of Cintra. Each location harbors its own veiled perils and monstrous adversaries, awaiting your valorous confrontation.</p>
<p>For you are a Witcher, a herald of the dwindling dusk, a solitary sentinel in a world teetering on the edge of darkness. The hour has come to etch your legend in the annals of time and traverse the path of the Witcher, where every choice is laden with consequence, and every battle is a testament to your enduring saga.</p> 
    <p>To prepare your journey lets create some weapons and armor...</p>
<br>

<form action="manageInventory.do" method="GET">
<input type="hidden" name="playerId" value="${player.id}">
<input type="submit" class="btn btn-secondary" value="Blacksmithing">
</form><br>
</div>

<!-- Optional JavaScript and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
