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
  h2 {
    color: #c5b358;
  }
  p {
    color: #ccc;
  }
  .container {
    max-width: 800px;
  }
  img {
    max-width: 100%;
    height: auto;
  }
</style>
</head>
<body>

<div class="container text-center mt-5">
    <h2>Welcome to our game!</h2>
    <img src="https://ibb.co/xMwFH7C" alt="Witcher Image" class="img-fluid rounded">
    <p class="mt-4">In the distant realm of Ardyl, a land where myths walk amongst men and magic is woven into the very fabric of reality, the echoes of a thousand battles linger, and dark creatures lurk in the shadows of a world torn by chaos and strife. You are a Witcher, a wanderer, and a master of the sword and sorcery, trained from birth to hunt the fearsome beasts that prey on the innocent.</p>
    <p>Your name is whispered in the hushed tones of reverence and fear, for your kind is as rare as it is misunderstood—mutants, gifted with extraordinary abilities, created to face the terrors that ordinary mortals dare not confront. You tread a lonely path, for few can understand the sacrifices you have made, the things you have endured, and the burdens you carry.</p>
    <p>As dawn breaks over the jagged peaks of the Ironback Mountains, a missive finds its way into your hands. It speaks of a village, Edgewater, on the brink of despair, besieged by a darkness that no man can name. The townsfolk are desperate, their numbers dwindling with each passing night, and their pleas for a savior have gone unanswered... until now.</p>
    <p>The road to Edgewater is fraught with peril, a journey through forgotten forests and across forlorn fields where the veil between worlds grows thin. But the call of a Witcher's duty is not easily ignored. With your blade at your side and the ancient arts of your order at your command, you set out for the village, knowing that whatever awaits you in the heart of the darkness will be no match for your steel and resolve.</p>
    <p>For you are a Witcher, the last light in the encroaching night, a beacon of hope in a world that has lost its way. The time has come to write your legend in the blood of the beasts that threaten the realm, to walk the path of the Witcher, where every choice is a burden and every battle a chance at redemption.</p>
    <p>To prepare your journey lets create some weapons and armor...</p>
<br>

<form action="manageInventory.do" method="GET">
<input type="hidden" name="playerId" value="${player.id}">
<input type="submit" value="Blacksmithing">
</form><br>
</div>

<!-- Optional JavaScript and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
