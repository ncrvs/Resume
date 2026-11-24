<?php
require_once '../../config.php';
require_once '../../auth.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id'])) {
    $stmt = $pdo->prepare("DELETE FROM masters WHERE id=?");
    $stmt->execute([$_POST['id']]);
}
header("Location: index.php");
exit;
?>