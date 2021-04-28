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

<script>
MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']]
  },
  svg: {
    fontCache: 'global'
  }
};
</script>
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
</script>

 <!-- jquery -->	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- autotables -->
  <script src="auto-tables.js"></script>
  <style>
    body { background-color: #fafafa; padding:4em;}
    .container { margin: 150px auto; }
    thead th { cursor: pointer; }
    td {max-width:30%;}
  </style>

<style>
.polozka {display:table-row; padding:5px; border-color:lightgray; border-style:solid; border-width:2px;}
.img, .pocet, .popis, .nazev {display: table-cell; margin:5px;} 
.jmeno {font-weight:bold;}
.pocet {font-size:400%; text-align:center;}


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

.raw {text-align:left; max-width:400px; }
.raw pre {overflow:scroll;}

</style>
</head>
<html>

<h2><?php echo $kurz; ?>, Otázky s volně formulovanou odpovědí.</h2>

<p>
<input type="text" class="form-control mb-3 tablesearch-input" data-tablesearch-table="#data-table"  placeholder="Search">

<p>
<table id="data-table" class="table tablesort paleBlueRows tablesearch-table"><thead><tr><th>Zadání</th><th>User</th><th>Raw</th><th>Format</th><th>Odpoved</th></tr></thead>


<?php

require ('konfigurace.php');

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT x.user_id, z.first_name, z.last_name, x.set_id, timestamp, answer_string, comment_string 
FROM ( 
  SELECT user_id, set_id, max(timestamp) as maxtime FROM `".$kurz."_past_answer`  WHERE `problem_id` LIKE '15%' AND `user_id` LIKE 'x%' GROUP BY user_id, set_id ) as x  
INNER JOIN `".$kurz."_past_answer` AS y ON y.timestamp = x.maxtime  
LEFT JOIN `".$kurz."_user` AS z ON z.user_id = x.user_id 
ORDER BY set_id, x.user_id";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $answer = str_replace("\r\n\r\n","<BR><br>",$row["answer_string"]);
    echo "<tr><td class=l> " . $row["set_id"]. "</td><td class=r>". $row["user_id"]. "</a></td><td class=raw><pre>" . $row["answer_string"]."</pre></td><td class=l>".$answer."</td><td class=l>".$row["comment_string"]. "</td><td class=l>".$row["mean"]. "</td></tr>";
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