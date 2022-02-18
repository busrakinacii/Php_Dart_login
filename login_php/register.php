<?php

if($_POST) {

include 'conn.php';

$username = $_POST['username'];
$usersurname = $_POST['usersurname'];
$email = $_POST['email'];
$password = $_POST['password'];
$section = $_POST['section'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$birthday = $_POST['birthday'];

$consult = $connect->query("SELECT * FROM register WHERE username = '".$username."',usersurname = '".$usersurname."',
email = '".$email."', password = '".$password."',section = '".$section."',address = '".$address."',phone = '".$phone."',birthday = '".$birthday."'");

$result = array();

while ($extractdata = $consult->fetch_assoc()){
 $result[] = $extractdata;

	}
	echo json_encode($result);

}else{
	echo "Hiçbir Veri Post Edilmedi.";
}

?>

