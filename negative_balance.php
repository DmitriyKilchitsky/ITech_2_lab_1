<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="./assets/index.css">
  <title>Document</title>
</head>

<body>
  <?php
  require 'conn.php';
  $dbh = conn();

  $clients_data_query = $dbh->query("SELECT `name` FROM `client` WHERE `client`.`balance` < 0");
  $clients_data = $clients_data_query->fetchAll(PDO::FETCH_ASSOC);
  ?>
  
  <div id="content_wrapper">
    <h3>Список клиентов с отрицательным балансом счета:</h3>
    <div>
      <?php
      foreach ($clients_data as $data) {
        echo "<p>&#8211 $data[name]</p>";
      }
      ?>
    </div>
  </div>
</body>

</html>