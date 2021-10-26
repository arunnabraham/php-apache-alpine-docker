<?php

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__, '.env');
$dotenv->load();

$dbhost = $_ENV['MYSQL_HOST'];
$dbuser = $_ENV['MYSQL_USERNAME'];
$dbpass = $_ENV['MYSQL_PASSWORD'];
$dbname = $_ENV['MYSQL_DB'];
$dbport = $_ENV['MYSQL_PORT'];
$mysqli = new mysqli($dbhost, $dbuser, $dbpass, $dbname, $dbport);

if ($mysqli->connect_errno) {
    printf("Connect failed: %s<br />", $mysqli→connect_error);
    exit();
}
printf('Connected successfully.<br />');
$mysqli->close();
