<?PHP
$conn = new mysqli('localhost','root','root','movie_app');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error); 
}
$id = $_POST['id'];
                                                 

$sql = "DELETE FROM member
        WHERE id = $id ";
if($conn->query($sql) === TRUE){
    echo "deleted"; // DO NOT change
}
else{
    echo "Error : " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
