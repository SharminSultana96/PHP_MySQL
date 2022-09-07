<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Sign In</h2>
    <form action="check_user.php" method="post">
        Email<br>
        <input type="email" name="email" placeholder="Enter Email"><br><br>

        Password<br>
        <input type="password" name="pass" placeholder="Enter Password"><br><br>
        <input type="submit" name="submit" value="SIGN IN"><br><br>
    </form>
    <?php
    if(isset($_GET['m'])){
    $msg = $_GET['m'];
    echo "<h3>Email or Password may be wrong</h3>";
    // echo "<div class='alert alert-danger'>$msg</div>";
}
    ?>
</body>
</html>