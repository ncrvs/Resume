<?php
require_once '../../config.php';
require_once '../../auth.php';
$items = $pdo->query("SELECT * FROM masters")->fetchAll();
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Мастера</title></head>
<body>
    <h1>Мастера</h1>
    <a href="create.php">+ Добавить мастера</a> | <a href="/">На главную</a>
    <table border="1" cellpadding="8" style="margin-top: 15px;">
        <tr><th>ID</th><th>Имя</th><th>Специализация</th><th>Телефон</th><th>Действия</th></tr>
        <?php foreach ($items as $item): ?>
        <tr>
            <td><?= $item['id'] ?></td>
            <td><?= htmlspecialchars($item['full_name']) ?></td>
            <td><?= htmlspecialchars($item['specialization']) ?></td>
            <td><?= htmlspecialchars($item['phone']) ?></td>
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