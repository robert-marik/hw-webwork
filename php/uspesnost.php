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

<h2><?php echo $kurz; ?>, Úspěšnost odpovědí.</h2>

<p>
<input type="text" class="form-control mb-3 tablesearch-input" data-tablesearch-table="#data-table"  placeholder="Search">

<p>
<table id="data-table" class="table tablesort paleBlueRows tablesearch-table">
<thead>
<tr>
<th>ID</th>
<th>Jméno</th>
<th>Příjmení</th>
<th class=r>Počet odpovědí</th>
<th class=r>Body</th>
<th class=r>Odpovědí na bod</th>
<th class=r>Počet dnů</th>
</tr>
</thead>



<?php

require ('konfigurace.php');

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "select x.user_id as user_id, pocet, ROUND(soucet,1) as soucet, ROUND(pocet/soucet,1) as podil, z.first_name as jmeno , z.last_name as prijmeni  , zz.pocet_dnu as pocet_dnu
from (select user_id, count(*) as pocet
  from `".$kurz."_past_answer`
  where user_id like 'x%'
  group by user_id
  order by pocet desc) as x
left join
(SELECT user_id, sum(status) as soucet FROM `".$kurz."_problem_user` 
where user_id like 'x%'
group by user_id) as y
on x.user_id = y.user_id
LEFT JOIN `".$kurz."_user` AS z 
ON z.user_id = x.user_id 
left join
  (select user_id, count( distinct DATE (FROM_UNIXTIME(timestamp-2*60*60)) ) as pocet_dnu 
  from `".$kurz."_past_answer`
  where user_id like 'x%'
  group by user_id ) as zz
on zz.user_id = x.user_id
order by soucet desc";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
  echo "<tr><td class=l> " . $row["user_id"]. "</td>
       <td class=l>" . $row["prijmeni"] . "</td>
       <td class=l>" . $row["jmeno"] . "</td>
       <td class=r>" . $row["pocet"] . "</td>
       <td class=r>" . $row["soucet"] . "</td>
       <td class=r>" . $row["podil"] . "</td>
       <td class=r>" . $row["pocet_dnu"] . "</td>
       </tr>";
  }
} else {
  echo "0 results";
}




?>



<?php

$conn->close(); 

?>

    </body> 
</html>

