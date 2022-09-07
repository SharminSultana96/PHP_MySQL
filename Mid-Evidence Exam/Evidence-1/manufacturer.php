<?php
    $db = new mysqli('localhost', 'root', '', 'company');
?>

 <?php

// Entry Section (procedure)
if(isset($_POST['manu_submit'])){
    extract($_POST);
    // CALL add_manufacturer(@p0, @p1, @p2);
    $sql = "CALL add_manufacturer('$manu_name', '$manu_add', '$manu_phn')";
    $db->query($sql);
    if($db->affected_rows>0){
        echo "ADDED";
    }
}
?>

<h1>Manufacturer Entry</h1>
<form action="" method="post">
    <input type="text" name="manu_name" placeholder="Enter Manufacturer Name"><br><br>
    <input type="text" name="manu_add" placeholder="Enter Manufacturer Address"><br><br>
    <input type="text" name="manu_phn" placeholder="Enter Manufacturer Phone"><br><br>
    <input type="submit" name="manu_submit" value="SAVE Manufacturer"><br><br>

</form>
<br>

<?php
// DELETE SECTION (Trigger)
   if(isset($_POSt['submit'])){
    $id = $_POST['manu_id'];
    $sql = "DELETE FROM manufacturer WHERE id='$id'";
    $db->query($sql);
    if($db->affected_rows>0){
        echo "DELETED";
    }
   } 
?>

<form action="" method="post">
    <select name="manu_id">
        <option value="" disabled selected>Select One</option>
    
    <?php
    $sql = "SELECT * FROM manufacturer";
    $result = $db->query($sql);
    while($row = $result->fetch_assoc()){?>
        <option value="<?php echo $row['id']?>"><?php echo $row['name']?></option>
    <?php
    }
    ?>
    </select>
    <input type="submit" name="submit" value="DELETE">
</form>

<br>
<a href="product.php">SHOW PRODUCT</a>