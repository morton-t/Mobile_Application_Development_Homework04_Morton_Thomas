<?php

ini_set('display_errors',1);
error_reporting(E_ALL);

//echo phpinfo();


// Set up database connection

$db_host = 'mysql.cs.okstate.edu';
//$ssh_user = 'tlmorto';
$db_user = 'tlmorto';
$db_password = '~~~~~~~~~';
$port = '3306';
$db_name = 'tlmorto';
$charset = 'utf8mb4';
//$sshHost = 'csx0.cs.okstate.edu';

//$ssh = ssh2_connect($sshHost);

$conn = null;
// Create connection

//if (ssh2_auth_password($ssh, $ssh_user; $db_password)) {
//      $tunnel = ssh2_tunnel($ssh, $db_host, $port);

try {
      
//    $conn = new mysqli($db_host, $db_user, $db_password, $db_name);

      $dsn = "mysql:host=mysql.cs.okstate.edu;port=$port;dbname=$db_name";

      $conn = new PDO($dsn, $db_user, $db_password);
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $stmt = $conn->prepare("SELECT Name, Nickname FROM States ORDER BY Name");
      $stmt->execute();

      // Query database      
      $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

      // Print results
      foreach($results as $row) {
            echo $row['Name'] . "," . $row['Nickname'] . "\n";

      }
      $conn = null;

}
catch (PDOException $e) {
      echo "Failed: " . $e->getMessage();
}
//}
//else {
//     echo "Failed";
//}

return;
?>
