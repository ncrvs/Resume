<?php
require_once '../../config.php';
require_once '../../auth.php';

$id = $_GET['id'] ?? null;
if (!$id) die("Нет ID");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE clients SET full_name=?, phone=?, email=? WHERE id=?");
    $stmt->execute([$_POST['full_name'], $_POST['phone'], $_POST['email'], $id]);
    header("Location: index.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM clients WHERE id=?");
$stmt->execute([$id]);
$client = $stmt->fetch();
if (!$client) die("Клиент не найден");
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Редактировать</title></head>
<body>
    <h1>Редактирование клиента</h1>
    <form method="post">
        <input type="hidden" name="id" value="<?= $client['id'] ?>">
        Имя: <input type="text" name="full_name" value="<?= htmlspecialchars($client['full_name']) ?>" required><br><br>
        Телефон: <input type="text" name="phone" value="<?= htmlspecialchars($client['phone']) ?>"><br><br>
        Email: <input type="email" name="email" value="<?= htmlspecialchars($client['email']) ?>"><br><br>
        <button type="submit">Обновить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>