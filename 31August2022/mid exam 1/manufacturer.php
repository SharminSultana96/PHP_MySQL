<?php
$db = new mysqli('localhost', 'root', '', 'wdpf51_exam');
?>

<?php
//DELETE Option

    if(isset($_POST['submit'])){
        $id = $_POST['manu_id'];
        $sql = "DELETE FROM manufacturer WHERE id = '$id'";
        $db->query($sql);

        if($db->affected_rows>0){
            echo "DELETED";
        }
    }

?>

<?php
//Entry Option

    if(isset($_POST['manufacturer_submit'])){
       extract($_POST);
        $sql ="CALL add_manufacturer('$manu_name', '$manu_add', '$manu_phn')" ;
        $db->query($sql);

        if($db->affected_rows>0){
            echo "ADDED";
        }
    }

?>

<form action="" method="post">
    <select name="manu_id" id="">
        <option value="" disabled selected>Select One</option>

    <?php
        $sql = "SELECT * FROM manufacturer";
        $result = $db->query($sql);
        while($row = $result->fetch_assoc()){ ?>

        <option value="<?php echo $row['id'] ?>"><?php echo $row['name'] ?></option>
    <?php
        }
    ?>
    </select>
    <input type="submit" name="submit" value="DELETE">;
</form>


<h1>Manufacturer Entry</h1>
    <form action="" method="post">
        <input type="text" name="manu_name" placeholder="Enter Name"><br><br>
        <input type="text" name="manu_add" placeholder="Enter Address"><br><br>
        <input type="text" name="manu_phn" placeholder="Enter phone"><br><br>
        <input type="submit" name="manufacturer_submit" value="SAVE"><br>
    </form>

<br>

<a href="product.php">SHOW PRODUCT</a>