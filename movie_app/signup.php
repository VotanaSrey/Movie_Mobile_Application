<?PHP
$conn = new mysqli('localhost','root','root','movie_app');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
}

$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['passw'];

$sql = "INSERT INTO signup (name , email, password) VALUES ('$name', '$email' , '$password')";

if($conn->query($sql) === TRUE){
    echo "inserted";
}
else{
    echo "Error : " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
