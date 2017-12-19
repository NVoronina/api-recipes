<?php
final class models_DB {
    private static $_instance;
    public $_connect;


    private function __construct(){
        $this->_connect = pg_connect("host=".HOST." port=".PORT." dbname=".DB." user=".USER." password=".PASS);
    }
    static function connect(){
        if (!(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    static function getValue($query) {
        $obj = self::connect();
        $obj = $obj->_connect;
        if(isset($obj)){
            $info = pg_query($obj, $query);
            if(pg_num_rows($info)) {
                $data = pg_fetch_array($info);
                return $data[0];
            } else {
                return null;
            }
        } else {
            return false;
        }
    }
    static function getRow($query){
        $obj = self::connect();
        $obj = $obj->_connect;
        if(isset($obj)) {
            $data = pg_query($obj, $query);
            if (pg_num_rows($data)) {
                return pg_fetch_assoc($data);
            } else {
                return null;
            }
        } else {
            return false;
        }
    }
    static function setValue($query){
        $obj = self::connect();
        $obj = $obj->_connect;
        if(isset($obj)){
            $data = pg_query($obj, $query);
            return pg_last_oid($data);
        } else {
            return false;
        }
    }
    static function removeValue($query){
        $obj = self::connect();
        $obj = $obj->_connect;
        if(isset($obj)){
            pg_query($obj, $query);
            return true;

        } else {
            return false;
        }
    }
    static function getArray($query){
        $obj = self::connect();
        $obj = $obj->_connect;
        if(isset($obj)){
            $wtf = pg_query($obj, $query);
            $dataArray = pg_fetch_all($wtf);
            return $dataArray;

        } else {
            return false;
        }
    }
    static function updateValue($query){
        $obj = self::connect();
        $obj = $obj->_connect;
        if(isset($obj)){
            pg_query($obj, $query);
            return true;

        } else {
            return false;
        }
    }
    static function escape($str){
        $obj = self::connect();
        $obj = $obj->_connect;
        return $obj ? pg_escape_string($obj, $str) : false;
    }
    static function getHash($size) {
        $str = "abcdefghijklmnopqrstuvwxyz0123456789";
        $hash = "";
        for ($i = 0; $i < $size; $i++) {
            $hash.= $str[rand(0, 35)];
        }
        return $hash;
    }
    private function __clone(){}
    private function __sleep(){}
    private function __wakeup(){}
}
//$con = models_DB::connect();
// echo '<pre>';
//$con = $con->_connect;
// print_r($con);