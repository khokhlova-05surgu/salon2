<?php
require "dbconnect.php";
if (strlen($_POST['Title']) >= 6){
    try {
        $sql = 'INSERT INTO SERVICE(ID,Title,Price, image) VALUES(:ID,:Title,:Price,:image)';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':ID', $_POST['ID']);
        $stmt->bindValue(':Title', $_POST['Title']);
        $stmt->bindValue(':Price', $_POST['Price']);
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
header('Location: http://todolist/index.php?page=t');
exit( );
