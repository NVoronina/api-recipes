<?php
/**
 * Created by PhpStorm.
 * User: Natalia
 * Date: 12.03.2017
 * Time: 14:05
 */
//настройки БД
define("HOST", "localhost");
define("USER", "postgres");
define("PASS", "123456");
define("PORT", 5432);
define("DB", "test");

//определения путей
//корневая папка
define("DIR", pathinfo($_SERVER["SCRIPT_FILENAME"], PATHINFO_DIRNAME));
//используемый протокол
define("SCHEME", is_null($_SERVER["REQUEST_SCHEME"]) ? "http" : $_SERVER["REQUEST_SCHEME"] . "://");
//имя сервера (домена)
define("SERVER", $_SERVER["SERVER_NAME"] . "/");
//информация о поддомене
define("SUBSERVER", str_replace("/index.php", "", $_SERVER["SCRIPT_NAME"]) . "/");
//базовая часть адреса
define("BASE", str_replace("//", "/", SERVER . SUBSERVER));
//путь к корню ресурса
define("MAIN", SCHEME . BASE);
define("PUBLIC_IMAGES", DIR . "/public/images/");
define("MODEL", DIR . "/models");
define("CONTROLLER", DIR . "/controllers");
define("VIEW", DIR . "/views/");

define('IS_AJAX', isset($_SERVER['HTTP_X_REQUESTED_WITH']));
define("REQUEST", $_SERVER['REQUEST_METHOD']);

//установка русской локали и московского времени
setlocale(LC_ALL, "rus_rus");
date_default_timezone_set("Europe/Moscow");


?>