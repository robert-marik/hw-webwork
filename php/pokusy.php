<?php
    session_start();
    if(!isset($_SESSION['loginum'])) {
        header('LOCATION:index.php'); die();
    }
?>

<?php
$kurz_pref = $_GET['data'];
$kurz=$kurz_pref;
?>

<head>
<meta charset="utf-8" />
<meta name="robots" content="noindex,nofollow">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.2/materia/bootstrap.min.css">

<style>
.polozka {display:table-row; padding:5px; border-color:lightgray; border-style:solid; border-width:2px;}
.img, .pocet, .popis, .nazev {display: table-cell; margin:5px;} 
.jmeno {font-weight:bold;}
.pocet {font-size:400%; text-align:center;}

body{max-width:1000px; margin:auto;}

table {width:100%;}

table.paleBlueRows {
  border: 1px solid #FFFFFF;
  text-align: center;
  border-collapse: collapse;
}
table.paleBlueRows td, table.paleBlueRows th {
  border: 1px solid #FFFFFF;
  padding: 3px 2px;
}
table.paleBlueRows tbody td {
}
table.paleBlueRows tr:nth-child(even) {
  background: #D0E4F5;
}
table.paleBlueRows thead {
  background: #0B6FA4;
  border-bottom: 5px solid #FFFFFF;
}
table.paleBlueRows thead th {
  font-weight: bold;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #FFFFFF;
}
table.paleBlueRows thead th:first-child {
  border-left: none;
}

table.paleBlueRows tfoot {
  font-weight: bold;
  color: #333333;
  background: #D0E4F5;
  border-top: 3px solid #444444;
}

.obrazek {background-color:white;}

p, ul, li {text-align:left;}

.l {text-align:left; padding-left:2em; padding-right:2em;}

.r {text-align:right; padding-left:2em; padding-right:2em;}

</style>

 <!-- jquery -->	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- autotables -->
  <script src="auto-tables.js"></script>
  <style>
    body { background-color: #fafafa; padding:4em;}
    .container { margin: 150px auto; }
    thead th { cursor: pointer; }
  </style>



</head>
<html>

<h1>Předmět <?php echo $kurz;?></h1>
Otázky seřazené podle toho, jak hodně studentům zamotaly hlavu. Výše jsou otázky, kde je poměr počtu pokusů o odpověď a počtu uživatelů, snažících se vyřešit, nejvyšší.

<table class="tablesort paleBlueRows table"><thead><tr><th>Zadání</th><th>Příklad</th><th>Počet odpovědí</th><th>Počet uživatelů</th><th>Průměr odpovědi na uživatele</th></tr></thead>


<?php

require ('konfigurace.php');

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT set_id, problem_id, count(*) as pocet_pokusu, count(distinct(user_id)) as pocet_uzivatelu, count(*)/count(distinct(user_id)) as pokusu_na_uzivatele FROM `".$kurz."_past_answer` WHERE `user_id` LIKE 'x%' GROUP BY set_id, problem_id ORDER BY pokusu_na_uzivatele DESC, set_id, problem_id;";
$sql = "SELECT set_id, problem_id, count(*) as pocet_pokusu, count(distinct(user_id)) as pocet_uzivatelu, count(*)/count(distinct(user_id)) as pokusu_na_uzivatele FROM `".$kurz."_past_answer` WHERE `user_id` LIKE 'x%' GROUP BY set_id, problem_id ORDER BY set_id, problem_id;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "<tr><td class=l> " . $row["set_id"]. "</td><td class=r><a href='/webwork2/".$kurz."/".$row["set_id"]."/".$row["problem_id"]."'>" . $row["problem_id"]. "</a></td><td class=r>" . $row["pocet_pokusu"]."</td><td class=r>".$row["pocet_uzivatelu"]."</td><td class=r>".$row["pokusu_na_uzivatele"]. "</td><td class=r>".$row["mean"]. "</td></tr>";
  }
} else {
  echo "0 results";
}

?>


</table>


<?php

$conn->close(); 

?>

</html>