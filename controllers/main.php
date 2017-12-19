<?php

/**
 * Created by PhpStorm.
 * User: Natalia
 * Date: 07.03.2017
 * Time: 16:34

 */

class controllers_main {
    protected $session;
    protected $id;
    protected $main;
    public function __construct(){
        if (isset($_COOKIE["id"])) {
            $id = $_COOKIE["id"];
            $this->session = new models_session($id);
            $this->session = $this->session->check($id);
            if ($this->session === true) {
                $this->id = $id;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    protected function errorMethodNotAllowed(){
       return http_response_code(405);
    }
    protected function errorNoUrl(){
        return http_response_code(404);
    }
    protected function generatePut(){
        $_PUT = array();
        if($_SERVER['REQUEST_METHOD'] == 'PUT') {
            $putdata = file_get_contents('php://input');
            $exploded = explode('&', $putdata);

            foreach($exploded as $pair) {
                $item = explode('=', $pair);
                if(count($item) == 2) {
                    $_PUT[urldecode($item[0])] = urldecode($item[1]);
                }
            }
        }
        return $_PUT;
    }
}