<h1>Students Page</h1>
<?php
    $db = New mysqli('localhost', 'root', '', 'wdpf51_exam2');
?>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Module Name</th>
        <th>Total Marks</th>
        <th>Student ID</th>
    </tr>
    <?php
        $sql = "SELECT * FROM students_results_view";
        $result = $db->query($sql);
        while($row = $result->fetch_assoc()){ ?>

    <tr>
        <td><?php echo $row['r_id'] ?></td>
        <td><?php echo $row['module_name'] ?></td>
        <td><?php echo $row['total_marks'] ?></td>
        <td><?php echo $row['st_id'] ?></td>
        
        </tr>
    <?php
        }
    ?>
</table>





