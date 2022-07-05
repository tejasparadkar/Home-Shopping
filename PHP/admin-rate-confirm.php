<?php 
	$pid = $_GET['pid'];
	$treview = $_GET['treview'];

	$myfile = fopen("userReview.txt", "w") or die("Unable to open file!");
	$txt = $treview;
	fwrite($myfile, $txt."\n");
	fclose($myfile);

	$python = 'C:\Users\Dell\AppData\Local\Programs\Python\Python39\python.exe';
	$pyscript = 'C:\wamp64\www\project\admin\rate.py';

	exec("C:\Users\Dell\AppData\Local\Programs\Python\Python39\python.exe C:\wamp64\www\project\admin\rate.py userReview.txt", $output);
	print_r($output);
	//echo $output[0];
	//$output_array = json_decode($output);
	foreach($output as $row){
		$rating = $row;
	
	$rate = $rating[1];
	echo $rating;
	
	$sql = "update products set rating='$rating' where pid='$pid'";
	$conn = mysqli_connect("localhost","root","");
	mysqli_select_db($conn,"ita");
	if($conn->query($sql)){
		echo ("<SCRIPT LANGUAGE='JavaScript'>
				window.alert('Product rating updated!!')
				window.location.href='admin-rate-product.php'
				</SCRIPT>");
	}
}
?>