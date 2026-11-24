<?php
require_once '../../config.php';
require_once '../../auth.php';

$clients = $pdo->query("SELECT id, full_name FROM clients")->fetchAll();
$masters = $pdo->query("SELECT id, full_name FROM masters")->fetchAll();
$services = $pdo->query("SELECT id, name FROM services")->fetchAll();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO appointments (client_id, master_id, service_id, appointment_date, appointment_time, status) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([
        $_POST['client_id'], 
        $_POST['master_id'], 
        $_POST['service_id'], 
        $_POST['appointment_date'], 
        $_POST['appointment_time'], 
        $_POST['status']
    ]);
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Новая запись</title></head>
<body>
    <h1>Новая запись</h1>
    <form method="post">
        Клиент: 
        <select name="client_id" required>
            <?php foreach ($clients as $c): ?>
                <option value="<?= $c['id'] ?>"><?= htmlspecialchars($c['full_name']) ?></option>
            <?php endforeach; ?>
        </select><br><br>
        
        Мастер: 
        <select name="master_id" required>
            <?php foreach ($masters as $m): ?>
                <option value="<?= $m['id'] ?>"><?= htmlspecialchars($m['full_name']) ?></option>
            <?php endforeach; ?>
        </select><br><br>
        
        Услуга: 
        <select name="service_id" required>
            <?php foreach ($services as $s): ?>
                <option value="<?= $s['id'] ?>"><?= htmlspecialchars($s['name']) ?></option>
            <?php endforeach; ?>
        </select><br><br>

        Дата: <input type="date" name="appointment_date" required><br><br>
        Время: <input type="time" name="appointment_time" required><br><br>
        Статус: 
        <select name="status">
            <option value="запланировано">Запланировано</option>
            <option value="выполнено">Выполнено</option>
            <option value="отменено">Отменено</option>
        </select><br><br>
        
        <button type="submit">Сохранить</button>
    </form>
    <a href="index.php">Назад</a>
</body>
</html>