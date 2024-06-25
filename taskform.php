<h2>Добавление услуги</h2>
<form method="post" action="inserttask.php" enctype="multipart/form-data">

    <p><label>
            Имя услуги: <input type="text" name="Title">
        </label>
    <div class="mb-3">
        <input type="text" class="form-control" name="image">
        <div class="form-text">Введите URL изображения</div>
    </div>
    <p><label>
            Цена услуги: <input type="number" name="Price">
        </label>
    <p><label>
            Пользователь: <select name="id_user">

                <?php
                $result = $conn->query("SELECT * FROM user");
                while ($row = $result->fetch()) {
                    echo '<option value='.$row['id_user'].'>'.$row['lastname'].'</option>';

                }
                ?>
            </select>
        </label>
    <p><input type="submit" value="Создать">

</form>