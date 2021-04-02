<?PHP
$conn = new mysqli('localhost','root','root','movie_app');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
}

$name = $_POST['name'];
$body = $_POST['body'];
$img = $_POST['img'];

$sql = "INSERT INTO member (name , body, img) VALUES ('$name', '$body' , '$img')";
if($conn->query($sql) === TRUE){
    echo "inserted";
}
else{
    echo "Error : " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
