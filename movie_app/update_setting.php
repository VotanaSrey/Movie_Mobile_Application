<?PHP
$conn = new mysqli('localhost','root','root','movie_app');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
}
    
$id = $_POST['id'];
$name = $_POST['name'];
$phone = $_POST['phone'];
$level = $_POST['level'];
$img = $_POST['img'];
$email_address = $_POST['email_address'];

    
$sql = "UPDATE setting
        SET name = '$name', phone = '$phone', level = '$level', img = '$img',email_address = '$email_address'
        WHERE id = $id ";
    
    
if($conn->query($sql) === TRUE){
    echo "updated"; // DO NOT change
}
else{
    echo "Error : " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
