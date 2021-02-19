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
  
  $start = "$_POST[from_date] $_POST[from_time]";
  $stop = "$_POST[to_date] $_POST[to_time]";

  $stat_query = $dbh->prepare("SELECT SUM(`in_traffic`), SUM(`out_traffic`) FROM `seance` WHERE `seance`.`start` > ? AND `seance`.`stop` < ?");
  $stat_query->execute(array($start, $stop));

  $working_stat = $stat_query->fetchAll(PDO::FETCH_NUM);
  $in_traffic = $working_stat[0][0];
  $out_traffic = $working_stat[0][1];
  ?>
  
  <div id="content_wrapper">
    <?php
    echo "<h3>Cтатистика работы в сети c $start по $stop:</h3>";
    echo "<p>Общее количество входящего трафика &#8212 $in_traffic KB</p>";
    echo "<p>Общее количество исходящего трафика &#8212 $out_traffic KB</p>";
    ?>
  </div>
</body>

</html>