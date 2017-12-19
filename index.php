<?php
session_start();
include_once "config/config.php";
include_once "config/route.php";
include_once "config/err.php";
function myAutoload($class){
    $class = str_replace("_", "/", $class . ".php");
    if (file_exists($class)) {
        include_once $class;
    }
}
spl_autoload_register("myAutoload", true, true);
$route = new Route();
$route = $route->start($_SERVER["REQUEST_URI"]);
