<?php
require_once '../../config.php';
require_once '../../auth.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO services (name, price, duration_minutes) VALUES (?, ?, ?)");
    $stmt->execute([$_POST['name'], $_POST['price'], $_POST['duration_minutes']]);
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Добавить услугу</title></head>
<body>
    <h1>Новая услуга</h1>
    <form method="post">
        Название: <input type="text" name="name" required><br><br>
        Цена: <input type="number" step="0.01" name="price" required><br><br>
        Длительность (мин): <input type="number" name="duration_minutes" required><br><br>
        <button type="submit">Сохранить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>