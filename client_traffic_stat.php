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

  $client_name_query = $dbh->prepare("SELECT `name` FROM `client` WHERE `client`.`id_client` = ?");
  $client_name_query->execute(array($_POST['id_client']));
  $client_name = $client_name_query->fetch(PDO::FETCH_ASSOC)['name'];

  $stat_query = $dbh->prepare("SELECT SUM(`in_traffic`), SUM(`out_traffic`) FROM `seance` WHERE `seance`.`fid_client` = ?");
  $stat_query->execute(array($_POST['id_client']));
  $working_stat = $stat_query->fetchAll(PDO::FETCH_NUM)[0];

  $in_traffic = $working_stat[0];
  $out_traffic = $working_stat[1];
  ?>
  
  <div id="content_wrapper">
    <?php
    echo "<h3>Cтатистика работы в сети клиента $client_name:</h3>";
    echo "<p>Общее количество входящего трафика &#8212 $in_traffic KB</p>";
    echo "<p>Общее количество исходящего трафика &#8212 $out_traffic KB</p>";
    ?>
  </div>
</body>

</html>