<?php
    $db = new mysqli('localhost', 'root', '', 'company');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        h1{
            color: rebeccapurple;
            font-style: italic;
        }
        h2{
            color: red;
        }

        h3{
            color: green;
        }
    </style>
</head>
<body>
    <h1>Login Form</h1>
    <form action="" method="post">
        <input type="text" name="username" placeholder="Enter Username"><br><br>
        <input type="password" name="password" placeholder="Enter Password"><br><br>
        <input type="submit" name="submit" value="SUBMIT"><br>
    </form>

    <?php

        if(isset($_POST['submit'])){
            $username = $_POST['username'];
            $password = $_POST['password'];

            $sql = "SELECT * FROM user WHERE username='$username' AND password='$password'";
            $result = $db->query($sql);
            if($result->num_rows>0){
                echo "<h3>You are Registered<h3>";
            }else{
                echo "<h2>You are Not Registered<h2>";
            }
            // $result->free();
            $db->close();

        }
    ?>
</body>
</html>
