<?php
require_once '../../config.php';
require_once '../../auth.php';

$sql = "SELECT a.*, c.full_name as client_name, m.full_name as master_name, s.name as service_name 
        FROM appointments a
        JOIN clients c ON a.client_id = c.id
        JOIN masters m ON a.master_id = m.id
        JOIN services s ON a.service_id = s.id
        ORDER BY a.appointment_date DESC";
$items = $pdo->query($sql)->fetchAll();
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Записи</title></head>
<body>
    <h1>Журнал записей</h1>
    <a href="create.php">+ Создать запись</a> | <a href="/">На главную</a>
    <table border="1" cellpadding="8" style="margin-top: 15px;">
        <tr><th>ID</th><th>Клиент</th><th>Мастер</th><th>Услуга</th><th>Дата</th><th>Время</th><th>Статус</th><th>Действия</th></tr>
        <?php foreach ($items as $item): ?>
        <tr>
            <td><?= $item['id'] ?></td>
            <td><?= htmlspecialchars($item['client_name']) ?></td>
            <td><?= htmlspecialchars($item['master_name']) ?></td>
            <td><?= htmlspecialchars($item['service_name']) ?></td>
            <td><?= $item['appointment_date'] ?></td>
            <td><?= $item['appointment_time'] ?></td>
            <td><?= htmlspecialchars($item['status']) ?></td>
            <td>
                <a href="edit.php?id=<?= $item['id'] ?>">Ред.</a> | 
                <form action="delete.php" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<?= $item['id'] ?>">
                    <button type="submit" onclick="return confirm('Удалить?')">Удалить</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>