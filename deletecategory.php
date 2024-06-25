<?php
require "dbconnect.php";
try {
    echo ("SELECT * FROM Cosmet");
    $result = $conn->query("SELECT * FROM Cosmet");
    $row = $result->fetch();
    $result = $conn->query("SELECT * FROM Cosmet");
    if ($result->rowCount() == 0) throw new PDOException('Косметолог не найден', 1111 );
    $sql = 'DELETE FROM Cosmet WHERE ID=:id';
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':id', $_GET['id']);
    $stmt->execute();
    $_SESSION['msg'] = "Косметолог успешно удален";
    // return generated id
    // $id = $pdo->lastInsertId('id');
} catch (PDOexception $error) {
    if ($error->getCode() == '23000') {
        $_SESSION['msg'] = "Ошибка удаления категории: данная категория используется в другой таблице и не может быть удалёна";
    } else {
        $_SESSION['msg'] = "Ошибка удаления категории: " . $error->getMessage();
    }
}
// перенаправление на главную страницу приложения
header('Location: http://todolist/index.php?page=c');
exit( );