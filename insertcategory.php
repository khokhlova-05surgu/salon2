<?php
require "dbconnect.php";
if (strlen($_POST['FIO']) >= 3){
    try {
        $sql = 'INSERT INTO Cosmet(FIO, image) VALUES(:FIO,:image)';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':FIO', $_POST['FIO']);
        $stmt->bindValue(':image', $_POST['image']);
        $stmt->execute();
        $_SESSION['msg'] = "Услуга успешно добавлено";
        // return generated id
        // $id = $pdo->lastInsertId('id');

    } catch (PDOexception $error) {
        $_SESSION['msg'] = "Ошибка добавления услуги: " . $error->getMessage();
    }

}
else $_SESSION['msg'] = "Ошибка добавления услуги: имя услуги должно содержать не менее 6х символов";

// перенаправление на главную страницу приложения
header('Location: http://todolist/index.php?page=c');
exit( );
