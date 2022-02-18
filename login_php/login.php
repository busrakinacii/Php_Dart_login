
<?php

if($_POST) {

include 'conn.php';

$username = $_POST['username'];
$password = $_POST['password'];

$consult = $connect->query("SELECT * FROM user WHERE username = '".$username."' and password = '".$password."'");

$result = array();

while ($extractdata = $consult->fetch_assoc()){
 $result[] = $extractdata;

	}
	echo json_encode($result);

}else{
	echo "Hiçbir Veri Post Edilmedi.";
}

?>
