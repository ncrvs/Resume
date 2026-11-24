<?php
require_once '../../config.php';
require_once '../../auth.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO masters (full_name, specialization, phone) VALUES (?, ?, ?)");
    $stmt->execute([$_POST['full_name'], $_POST['specialization'], $_POST['phone']]);
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Добавить мастера</title></head>
<body>
    <h1>Новый мастер</h1>
    <form method="post">
        Имя: <input type="text" name="full_name" required><br><br>
        Специализация: <input type="text" name="specialization"><br><br>
        Телефон: <input type="text" name="phone"><br><br>
        <button type="submit">Сохранить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>