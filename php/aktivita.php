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

<html>
    <head>

         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <style> body{padding:2em;}</style>

 <!-- jquery -->	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- autotables -->
  <script src="auto-tables.js"></script>
  <style>
    body { background-color: #fafafa; padding:4em;}
    .container { margin: 150px auto; }
    thead th { cursor: pointer; }
    .l {text-align:left; padding-left:2em; padding-right:2em;}

    .r {text-align:right; padding-left:2em; padding-right:2em;}

    .form-control{width:20em;}
    table {width:auto !important;}
  </style>


    </head>
    <body>

<h2><?php echo $kurz; ?>, aktivita.</h2>


<h3>Dnes</h3>

<?php

require ('konfigurace.php');

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "select count(*) as pocet from `".$kurz."_past_answer`
where DATE (FROM_UNIXTIME(timestamp)) >= CURRENT_DATE() and user_id like 'x%'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "Počet celkem: " . $row["pocet"];
  }
} else {
  echo "0 results";
}

$sql = "select user_id as user, count(user_id) as pocet from `".$kurz."_past_answer`
where DATE (FROM_UNIXTIME(timestamp)) >= CURRENT_DATE()
and user_id like 'x%'
group by user_id
order by pocet desc
";

$result = $conn->query($sql);

echo "<table><tr><th>User</th><th class=r>Počet odpovědí</th></tr>";
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "<tr><td>" . $row["user"]."</td><td class=r>".$row["pocet"]."</td></tr>";
  }
} else {
  echo "0 results";
}
echo "</table>";

?>

<h3>Posledních 7 dní</h3>

<?php

$sql = "select count(*) as pocet from `".$kurz."_past_answer`
where DATE (FROM_UNIXTIME(timestamp)) >= CURRENT_DATE() + INTERVAL -7 DAY and user_id like 'x%'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "Počet celkem: " . $row["pocet"];
  }
} else {
  echo "0 results";
}


$sql = "select user_id as user, count(user_id) as pocet from `".$kurz."_past_answer`
where DATE (FROM_UNIXTIME(timestamp)) >= CURRENT_DATE() + INTERVAL -7 DAY
and user_id like 'x%'
group by user_id
order by pocet desc
";

$result = $conn->query($sql);

echo "<table><tr><th>User</th><th class=r>Počet odpovědí</th></tr>";
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "<tr><td>" . $row["user"]."</td><td class=r>".$row["pocet"]."</td></tr>";
  }
} else {
  echo "0 results";
}
echo "</table>";



?>



<?php

$conn->close(); 

?>

    </body> 
</html>

