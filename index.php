<?php
require "dbconnect.php";
if($conn->connect_error){
    die("Ошибка: невозможно подключиться:". $conn->connect_error);
}
echo 'Подключились к базе.<br>';

$result = $conn->query("SELECT *  FROM Cosmet") ;
echo "<h2>Список косметологов</h2>";
echo 'ID'.' '.'FIO'."<br>";
while ($row = $result->fetch()) {
    echo $row['ID'].' '.$row['FIO']."<br>";

}