<!DOCTYPE html>
<html>
<head>
	<title>Installer</title>
   	 <link rel="stylesheet" href="/application/assets/css/style.css" />
	<style type="text/css">
		body{
			background:#292932;
		}

		.install_success_message{
		  display:none;
		  width:100%;
		  text-align:center;
		}

		.install_message{
		  display:none;
		  text-align:center;
		}
		#system_requirements{
			font-weight:bold;
			text-align:center;
			padding:20px;
			background: #22222c;
		}
		.success{
			color:#98CB00;
		}
		.failed{
			color:#DB3400;
		}
		h4{
			text-align:center;
		}
		a{
				width:300px;
				margin:0px auto;
				background:#98cb00;
				padding:20px 0px;
				border-radius:30px;
				display:block;
				color:#fff;
				text-decoration:none;
				font-size:18px;
				display:block;
				text-align:center;
				border-bottom:2px solid #78ab00;
			}
			a:hover{
				color:#fff;
			}
	</style>
</head>
<body>

<img src="/application/assets/img/logo.png" height="32" style="margin:20px auto; height:32px; width:auto; display:block" />
<h4>Hello Video Installation</h4>
<div id="system_requirements">
<?php


require __DIR__.'/application/bootstrap/autoload.php';

run_checks();
import_db();

function new_line(){
	echo '<br />';
}

function run_checks(){

	if(version_compare(PHP_VERSION , "5.4", ">=")){
		echo '<span class="success">PHP 5.4 or greater installed (<i class="fa fa-check-square-o"></i> PASS)</span>';
	} else {
		echo '<span class="failed">Minumum version of PHP 5.4 is required (<i class="fa fa-times"></i> FAIL)</span>';
	}
	new_line();

	if(!ini_get('safe_mode')){
		echo '<span class="success">Safe mode is not enabled (<i class="fa fa-check-square-o"></i> PASS)</span>';
	} else {
		echo '<span class="failed">Safe mode is enabled (<i class="fa fa-times"></i> FAIL)</span>';
	}
	new_line();

	if(defined('PDO::ATTR_DRIVER_NAME')){
		echo '<span class="success">PDO Driver is enabled (<i class="fa fa-check-square-o"></i> PASS)</span>';
	} else {
		echo '<span class="failed">PDO Driver is not enabled (<i class="fa fa-times"></i> FAIL)</span>';
	}
	new_line();

	if(extension_loaded('mcrypt')){
		echo '<span class="success">Mcrypt library is available (<i class="fa fa-check-square-o"></i> PASS)</span>';
	} else {
		echo '<span class="failed">Mcrypt library is not available (<i class="fa fa-times"></i> FAIL)</span>';
	}
	new_line();

	if(extension_loaded('gd')){
		echo '<span class="success">GD library is available (<i class="fa fa-check-square-o"></i> PASS)</span>';
	} else {
		echo '<span class="failed">GD library is not available (<i class="fa fa-times"></i> FAIL)</span>';
	}
	new_line();

	if(function_exists('curl_init')){
		echo '<span class="success">Curl library is available (<i class="fa fa-check-square-o"></i> PASS)</span>';
	} else {
		echo '<span class="failed">Curl library is not available (<i class="fa fa-times"></i> FAIL)</span>';
	}
	new_line();
}

function import_db(){
	// Name of the file
	$filename = 'application/database/dump.sql';

	Dotenv::load(__DIR__);

	// MySQL host
	$mysql_host = getenv('DB_HOST');
	// MySQL username
	$mysql_username = getenv('DB_USERNAME');
	// MySQL password
	$mysql_password = getenv('DB_PASSWORD');
	// Database name
	$mysql_database = getenv('DB_DATABASE');

	// Connect to MySQL server
	$connection = mysqli_connect($mysql_host, $mysql_username, $mysql_password) or die('Error connecting to MySQL server: ' . mysql_error());
	// Select database
	if(!mysqli_select_db($connection, $mysql_database)){
		die('Error selecting MySQL database: ' . mysql_error());
	}

	// Temporary variable, used to store current query
	$templine = '';
	// Read in entire file
	$lines = file($filename);
	// Loop through each line
	foreach ($lines as $line)
	{
	// Skip it if it's a comment
	if (substr($line, 0, 2) == '--' || $line == '')
	    continue;

	// Add this line to the current segment
	$templine .= $line;
	// If it has a semicolon at the end, it's the end of the query
	if (substr(trim($line), -1, 1) == ';')
	{
	    // Perform the query
	    mysqli_query($connection, $templine) or print('Error performing query \'<strong>' . $templine . '\': ' . mysqli_error() . '<br /><br />');
	    // Reset temp variable to empty
	    $templine = '';
	}
	}
	echo '<span class="success">Successfully Imported Database (<i class="fa fa-check-square-o"></i> PASS)</span>';
	
	new_line();
}

?>
</div>

<h4>Success!!! Make sure to delete the install.php file</h4>

<a href="/">Visit Your New Site</a>

</body>
</html>