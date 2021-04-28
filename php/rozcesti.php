<?php
    session_start();
    if(!isset($_SESSION['loginum'])) {
        header('LOCATION:index.php'); die();
    }
?>
<html>
    <head>
        <title>Rozcestí</title>
    </head>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <style> body{padding:2em;}</style>
    <body>

<?php

require ('konfigurace.php');

// Create connection
$conn = new mysqli($servername, $username, $password,$dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT 
 table_name
FROM 
 information_schema.tables
WHERE 
 table_schema = DATABASE() and table_name like '%permission'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
     $answer = str_replace("_permission","",$row["table_name"]);
     if (($answer != "admin") && ($answer != "daemon"))
     {
     echo "<H1>$answer</H1><ul>
     	 <li><a href='uspesnost.php?data=$answer'>Úspěšnost podle ID uživatele</a>
     	 <li><a href='aktivita.php?data=$answer'>Aktivita v kurzu</a>
	 <li><a href='essay.php?data=$answer'>Příklad číslo 15 - esej</a>
	 <li><a href='pokusy.php?data=$answer'>Obtížnost otázek</a>
	 </ul>";
     }
     }
} else {
  echo "0 results";
}




?>

    </body> 
</html>