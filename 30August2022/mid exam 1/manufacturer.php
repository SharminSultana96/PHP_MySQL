<?php
$db = new mysqli('localhost', 'root', '', 'company');
?>

<?php
    if(isset($_POST['submit'])){
        $id = $_POST['manu_id'];
        $sql = "DELETE FROM manufacturer WHERE id = '$id'";
        $db->query($sql);

        if($db->affected_rows>0){
            echo "Deleted";
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