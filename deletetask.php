<?php
require "dbconnect.php";
try {
    echo ("SELECT * FROM SERVICE");
    $result = $conn->query("SELECT * FROM SERVICE");
    $row = $result->fetch();
    $result = $conn->query("SELECT * FROM SERVICE");
    if ($result->rowCount() == 0) throw new PDOException('Услуга не найдена', 1111 );
    $sql = 'DELETE FROM SERVICE WHERE ID=:id';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':id', $_GET['id']);
    $stmt->execute();
    $_SESSION['msg'] = "Услуга успешно удалена";
    // return generated id
    // $id = $pdo->lastInsertId('id');
} catch (PDOexception $error) {
    $_SESSION['msg'] = "Ошибка удаления услуги: " . $error->getMessage();
}
// перенаправление на главную страницу приложения
header('Location: http://todolist/index.php?page=t');
exit( );