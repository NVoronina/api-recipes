<?php
class Route {
    private $route;
    public function __construct() {
        $this->route = include "config/routes.php";
    }
    private static function pageNotFound(){
        include_once VIEW . "errors/404.html";
    }
    public function start($url) {
        foreach($this->route as $class => $list){
            foreach ($list as $pattern) {
                if (preg_match($pattern, $url, $info)){
                    $method = isset($info[1]) && $info[1] !== "" ? htmlspecialchars($info[1]) : "index";
                    $id = isset ($info[2]) ? (int)$info[2] : 0;
                    break 2;
                }
            }
        }

        $path = str_replace("_", "/", $class) . ".php";
        if ($class != "error" AND file_exists($path)) {
            include_once $path;
            // если есть информация для метода
            if(isset($method)){
                if(isset($id)) {
                    $new = new $class();
                    $new->index($method, $id);
                } else {
                    $new = new $class();
                    $new->index($method);

                }
            }else {
                $this::pageNotFound();
            }
        } else {
            self::pageNotFound();
        }

    }
}
?>