<?php
require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__, '.env');
$dotenv->load();

$redis = new Redis();

$redis->connect($_ENV['REDIS_HOST'], $_ENV['REDIS_PORT']);

echo 'connected';