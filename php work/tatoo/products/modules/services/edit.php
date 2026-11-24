<?php
require_once '../../config.php';
require_once '../../auth.php';

$id = $_GET['id'] ?? null;
if (!$id) die("Нет ID");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE services SET name=?, price=?, duration_minutes=? WHERE id=?");
    $stmt->execute([$_POST['name'], $_POST['price'], $_POST['duration_minutes'], $id]);
    header("Location: index.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM services WHERE id=?");
$stmt->execute([$id]);
$item = $stmt->fetch();
if (!$item) die("Услуга не найдена");
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Редактировать</title></head>
<body>
    <h1>Редактирование услуги</h1>
    <form method="post">
        Название: <input type="text" name="name" value="<?= htmlspecialchars($item['name']) ?>" required><br><br>
        Цена: <input type="number" step="0.01" name="price" value="<?= $item['price'] ?>" required><br><br>
        Длительность: <input type="number" name="duration_minutes" value="<?= $item['duration_minutes'] ?>" required><br><br>
        <button type="submit">Обновить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>