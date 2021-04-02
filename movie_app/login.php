<?PHP
$conn = new mysqli('localhost','root','root','movie_app');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
}

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "INSERT INTO login ( email, password) VALUES ( '$email' , '$password')";

if($conn->query($sql) === TRUE){
    echo "inserted";
}
else{
    echo "Error : " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
