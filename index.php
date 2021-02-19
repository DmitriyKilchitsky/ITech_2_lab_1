<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="./assets/index.css">
  <title>Document</title>
</head>

<body>
  <div id="content_wrapper">
    <form action="./client_traffic_stat.php" method="post" class="first query">
      <div>
        <h3>Cтатистика работы в сети выбранного клиента</h3>
        <select name="id_client">
          <?php
          require 'conn.php';
          $dbh = conn();

          $clients_data_query = $dbh->query("SELECT `id_client`, `name` FROM `client`");
          $clients_data = $clients_data_query->fetchAll(PDO::FETCH_ASSOC);

          foreach ($clients_data as $data) {
            $id_client = $data['id_client'];
            $name = $data['name'];
            echo "<option value=\"$id_client\">$name</option>";
          }
          ?>
        </select>
        <br>
        <input type="submit" value="Получить">
      </div>
    </form>
    
    <form action="./period_traffic_stat.php" method="post" class="second query">
      <div>
        <h3>Cтатистика работы в сети за указанный промежуток времени</h3>
        <?php
        $period_query = $dbh->query("SELECT DATE(MIN(`start`)) AS `min`, DATE(MAX(`stop`)) AS `max` FROM `seance`");
        $period = $period_query->fetch(PDO::FETCH_ASSOC);

        $min_date = $period['min'];
        $max_date = $period['max'];
        ?>
        <div>
          <span>C</span>
          <input type="date" name="from_date" min="<?php echo $min_date ?>" max="<?php echo $max_date ?>">
          <input type="time" name="from_time">
        </div>
        <div>
          <span>По</span>
          <input type="date" name="to_date" min="<?php echo $min_date ?>" max="<?php echo $max_date ?>">
          <input type="time" name="to_time">
        </div>
        <input type="submit" value="Получить">
      </div>
    </form>

    <form action="./negative_balance.php" method="post" class="third query">
      <div>
        <h3>Вывести список клиентов с отрицательным балансом счета</h3>
        <input type="submit" value="Вывести">
      </div>
    </form>
  </div>
</body>

</html>