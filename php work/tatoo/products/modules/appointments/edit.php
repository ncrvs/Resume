<?php
require_once '../../config.php';
require_once '../../auth.php';

$id = $_GET['id'] ?? null;
if (!$id) die("Нет ID");

$clients = $pdo->query("SELECT id, full_name FROM clients")->fetchAll();
$masters = $pdo->query("SELECT id, full_name FROM masters")->fetchAll();
$services = $pdo->query("SELECT id, name FROM services")->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE appointments SET client_id=?, master_id=?, service_id=?, appointment_date=?, appointment_time=?, status=? WHERE id=?");
    $stmt->execute([
        $_POST['client_id'], $_POST['master_id'], $_POST['service_id'], 
        $_POST['appointment_date'], $_POST['appointment_time'], $_POST['status'], $id
    ]);
    header("Location: index.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM appointments WHERE id=?");
$stmt->execute([$id]);
$item = $stmt->fetch();
if (!$item) die("Запись не найдена");
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Редактировать запись</title></head>
<body>
    <h1>Редактирование записи</h1>
    <form method="post">
        Клиент: 
        <select name="client_id" required>
            <?php foreach ($clients as $c): ?>
                <option value="<?= $c['id'] ?>" <?= $c['id'] == $item['client_id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($c['full_name']) ?>
                </option>
            <?php endforeach; ?>
        </select><br><br>
        
        Мастер: 
        <select name="master_id" required>
            <?php foreach ($masters as $m): ?>
                <option value="<?= $m['id'] ?>" <?= $m['id'] == $item['master_id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($m['full_name']) ?>
                </option>
            <?php endforeach; ?>
        </select><br><br>
        
        Услуга: 
        <select name="service_id" required>
            <?php foreach ($services as $s): ?>
                <option value="<?= $s['id'] ?>" <?= $s['id'] == $item['service_id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($s['name']) ?>
                </option>
            <?php endforeach; ?>
        </select><br><br>

        Дата: <input type="date" name="appointment_date" value="<?= $item['appointment_date'] ?>" required><br><br>
        Время: <input type="time" name="appointment_time" value="<?= $item['appointment_time'] ?>" required><br><br>
        Статус: 
        <select name="status">
            <option value="запланировано" <?= $item['status'] == 'запланировано' ? 'selected' : '' ?>>Запланировано</option>
            <option value="выполнено" <?= $item['status'] == 'выполнено' ? 'selected' : '' ?>>Выполнено</option>
            <option value="отменено" <?= $item['status'] == 'отменено' ? 'selected' : '' ?>>Отменено</option>
        </select><br><br>
        
        <button type="submit">Обновить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>