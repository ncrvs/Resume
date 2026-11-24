<?php
require_once '../../config.php';
require_once '../../auth.php';

$id = $_GET['id'] ?? null;
if (!$id) die("Нет ID");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE masters SET full_name=?, specialization=?, phone=? WHERE id=?");
    $stmt->execute([$_POST['full_name'], $_POST['specialization'], $_POST['phone'], $id]);
    header("Location: index.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM masters WHERE id=?");
$stmt->execute([$id]);
$item = $stmt->fetch();
if (!$item) die("Мастер не найден");
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Редактировать</title></head>
<body>
    <h1>Редактирование мастера</h1>
    <form method="post">
        Имя: <input type="text" name="full_name" value="<?= htmlspecialchars($item['full_name']) ?>" required><br><br>
        Специализация: <input type="text" name="specialization" value="<?= htmlspecialchars($item['specialization']) ?>"><br><br>
        Телефон: <input type="text" name="phone" value="<?= htmlspecialchars($item['phone']) ?>"><br><br>
        <button type="submit">Обновить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>