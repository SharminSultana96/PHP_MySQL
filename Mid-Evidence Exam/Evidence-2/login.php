<?php
    $db = new mysqli('localhost', 'root', '', 'wdpf51_exam2');
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        h2{
            color: green;
        }
        h3{
            color: red;
        }
    </style>
</head>
<body>
    <h1>Login Form</h1>

    <?php
        if(isset($_POST['submit'])){
            $email = $_POST['email'];
            $password = $_POST['password'];

            $sql = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
            $result = $db->query($sql);
            if($result->num_rows>0){
                echo "<h2>Valid User</h2>";
            }else{
                echo "<h3>Invalid User</h3>";
            }

            $db->close();
        }

?>

    <form action="" method="post">
        <input type="email" name="email" placeholder="Enter Email"><br><br>
        <input type="password" name="password" placeholder="Enter Password"><br><br>
        <input type="submit" name="submit" value="LOGIN"><br><br>
    </form>
</body>
</html>