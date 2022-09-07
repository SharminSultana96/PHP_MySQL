<?php

//$salary = 5000;
$salary = '$5000';

/* Change database details according to your database */
$dbConnection = mysqli_connect('localhost', 'root', '', 'wdpf51_transaction');

mysqli_autocommit($dbConnection, false);

$flag = true;

$query1 = "INSERT INTO `employee` (`id`, `first_name`, `last_name`, `job_title`, `salary`) VALUES (10, 'Sharmin', 'Sultana', 'Softwaree Engineer', '$salary')";
$query2 = "INSERT INTO `telephone` (`id`, `employee_id`, `type`, `no`) VALUES (14, 10, 'mobile', '270-598712')";

$result = mysqli_query($dbConnection, $query1);

if (!$result) {
	$flag = false;
    echo "Error details: " . mysqli_error($dbConnection) . ".";
}

$result = mysqli_query($dbConnection, $query2);

if (!$result) {
	$flag = false;
    echo "Error details: " . mysqli_error($dbConnection) . ".";
}

if ($flag) {
    mysqli_commit($dbConnection);
    echo "All queries were executed successfully";
} else {
	mysqli_rollback($dbConnection);
    echo "All queries were rolled back";
} 

mysqli_close($dbConnection);

?>