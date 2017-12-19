<?php

// open session class
/**
 * Created by PhpStorm.
 * User: Натали
 * Date: 22.02.2017
 * Time: 11:26
 */
class models_session {
    private $_session;
    private $_token;
    private $_idUser;
    private $_id;

    function __construct($idUser){
        $sql = 'SELECT id_user,session, token, id_session
				FROM sessions
				WHERE id_user = ' . $idUser . ';';
        $info = models_DB::getRow($sql);
        if ($info){
            $this->_id = $info['id_session'];
            $this->_idUser = $idUser;
            $this->_token = $info['token'];
            $this->_session = $info['session'];

        }
    }
    // open new session
    function open($idUser){
        $cookie = $_COOKIE["PHPSESSID"];
        $token = models_DB::getHash(32) ;
        $sql = "INSERT INTO sessions(token,id_user,session) VALUES
                ('". $token ."',
                ". $idUser .",
                '". $cookie ."');
                ";
        $_SESSION["token"] = $token;
        $info = models_DB::setValue($sql);
        return $info;
    }
    // close session
    function close($idUser){
        $sql = "DELETE FROM sessions WHERE id_user = ". $idUser .";";
        $delete = models_DB::removeValue($sql);
        if ($delete === true){
            return true;
        } else {
            return false;
        }
    }
    // check the time and everything from session
    function check($idUser){
        $cookie = $_COOKIE["PHPSESSID"];
        $token = $_SESSION["token"];
        $sql = "SELECT * FROM sessions 
                WHERE id_user = ". $idUser .";";
        $info = models_DB::getRow($sql);
        if ($info["token"] == $token && $info["session"] == $cookie) {
            return true;
        } else {
            return false;
        }

    }
}
