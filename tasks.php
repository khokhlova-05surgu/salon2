<div class="container">
<?php
$result = $conn->query("SELECT SERVICE.ID AS id, SERVICE.Title AS dname,SERVICE.Price as price, SERVICE.image FROM SERVICE");

while ($row = $result->fetch()) {
//style="max-width: 18rem;"
    echo '
        
        <div class="card border-dark mb-3" >
            <div class="card-body text-dark">
                <div class="row g-0">
                    <div class="col-md-1">  
                        <img src="' . $row['image'] . '" alt="Task picture" height="60px">
                    </div>
                    <div class="col-md-7">
                    <a class="nav-link" href="/index.php?page=t" >
                        <h5 class="card-title">' . $row['dname'] . '</h5>
                    </a>
                    </div>
                    <div class="col-md-7">
                        <a class="nav-link" href="/index.php?page=t" >
                            <h5 class="card-title">' . $row['price'] . '</h5>
                        </a>
                    </div>
                    <div class="col-md-1">
                        <a href="deletetask.php?id=' . $row['id'] . '"class="btn btn-danger">Удалить</a>
                    </div>
                </div>
            </div>
            
        </div>
 </div>';
}
?>