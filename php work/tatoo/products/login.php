<?php
require_once 'config.php';
session_start();

if (isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit;
}

$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
    $stmt->execute([$_POST['username'], $_POST['password']]);
    $user = $stmt->fetch();

    if ($user) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        setcookie('last_user', $user['username'], time() + 3600, '/');
        header("Location: index.php");
        exit;
    } else {
        $error = "Неверный логин или пароль!";
    }
}
?>
<!DOCTYPE html>
<html lang="ru">
<head><meta charset="UTF-8"><title>Вход</title></head>
<body>
    <h2>Вход в систему</h2>
    <?php if ($error) echo "<p style='color:red;'>$error</p>"; ?>
    <form method="post">
        Логин: <input type="text" name="username" required><br><br>
        Пароль: <input type="password" name="password" required><br><br>
        <button type="submit">Войти</button>
    </form>
</body>
</html>