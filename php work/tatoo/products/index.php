<?php require_once 'auth.php'; ?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Панель управления</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        .menu { display: flex; flex-wrap: wrap; gap: 20px; }
        .card { border: 1px solid #ccc; padding: 20px; width: 200px; text-align: center; border-radius: 8px; }
        .card a { text-decoration: none; color: #333; font-weight: bold; font-size: 18px; }
    </style>
</head>
<body>
    <p>Привет, <b><?= htmlspecialchars($_SESSION['username']) ?></b>! <a href="/logout.php" style="color:red; margin-left: 20px;">Выйти</a></p>
    <h1>Панель управления</h1>
    
    <div class="menu">
        <div class="card"><a href="modules/clients/index.php"> Клиенты</a></div>
        <div class="card"><a href="modules/masters/index.php"> Мастера</a></div>
        <div class="card"><a href="modules/services/index.php"> Услуги</a></div>
        <div class="card"><a href="modules/appointments/index.php"> Записи</a></div>
    </div>
</body>
</html>