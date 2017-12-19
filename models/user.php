<?php

class models_user {

//authorisation
	static function signIn($login, $pass) {

		$sql = "SELECT id_user AS id
				FROM users
				WHERE login = '". models_DB::escape($login) . "'
				AND pass = '". md5($pass) ."';";
		$id = models_DB::getValue($sql);
		if($id) {
            setcookie("id", $id, time() + 3000, "/");
            $session = new models_session($id);
            $session->close($id);
            $session->open($id);
            return $id ? new self($id) : false;
        }else{
		    return false;
        }

	}
// create new user
	static function signUp($name, $surname, $password, $login) {
        $sql = "INSERT INTO users(name, surname, pass, login) VALUES
                ('". models_DB::escape($name) ."',
                 '". models_DB::escape($surname) ."',
                 '". models_DB::escape($password) ."',
                 '". models_DB::escape($login) ."');
               ";
        $check = models_DB::getRow("SELECT login FROM users WHERE login = '". $login ."';");
        if($check == false) {
            $id = models_DB::setValue($sql);
            return $id ? new self($id) : false;
        } else {
            return false;
        }
    }
// remove user
    static function remove($id) {
	    $sql = "DELETE FROM users WHERE id_user = ". $id .";";
        $delete = models_DB::removeValue($sql);
        if ($delete === true){
            $session = new models_session($id);
            $session->close($id);
            return true;
        } else {
            return false;
        }
    }
//exit user
    static function logout($id) {
        $session = new models_session($id);
        if($session->close($id)) {
            unset($id);
            return true;
        }
        else{
            return false;
        }
    }
// get one user
    static function getUser($id) {
        $sql = "SELECT id_user, users.name, surname, login FROM users
                 WHERE id_user = ". $id .";";
        $user = models_DB::getRow($sql);
        return $user;
    }
    static function updateUser($info) {
        $sql = "UPDATE users SET
                name = '". models_DB::escape($info['name']) ."', 
                surname = '". models_DB::escape($info['surname']) ."' 
                WHERE id_user = ". models_DB::escape($info['id_user']) .";";
        $user = models_DB::updateValue($sql);
        return $user;
    }
    static function getList() {
        $sql = "SELECT id_user, users.name, surname, login FROM users ;";
        $listUser = models_DB::getArray($sql);
        return $listUser;
    }

}
