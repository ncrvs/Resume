<?php
require_once '../../config.php';
require_once '../../auth.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO clients (full_name, phone, email) VALUES (?, ?, ?)");
    $stmt->execute([$_POST['full_name'], $_POST['phone'], $_POST['email']]);
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Добавить клиента</title></head>
<body>
    <h1>Новый клиент</h1>
    <form method="post">
        Имя: <input type="text" name="full_name" required><br><br>
        Телефон: <input type="text" name="phone"><br><br>
        Email: <input type="email" name="email"><br><br>
        <button type="submit">Сохранить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>