<?php
require_once '../../config.php';
require_once '../../auth.php';
$clients = $pdo->query("SELECT * FROM clients")->fetchAll();
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Клиенты</title></head>
<body>
    <h1>Клиенты</h1>
    <a href="create.php">+ Добавить клиента</a> | <a href="/">На главную</a>
    <table border="1" cellpadding="8" style="margin-top: 15px;">
        <tr><th>ID</th><th>Имя</th><th>Телефон</th><th>Email</th><th>Действия</th></tr>
        <?php foreach ($clients as $c): ?>
        <tr>
            <td><?= $c['id'] ?></td>
            <td><?= htmlspecialchars($c['full_name']) ?></td>
            <td><?= htmlspecialchars($c['phone']) ?></td>
            <td><?= htmlspecialchars($c['email']) ?></td>
            <td>
                <a href="edit.php?id=<?= $c['id'] ?>">Ред.</a> | 
                <form action="delete.php" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<?= $c['id'] ?>">
                    <button type="submit" onclick="return confirm('Удалить?')">Удалить</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>