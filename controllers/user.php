<?php
class controllers_user extends controllers_main {

    public function index($method, $id){
        switch (REQUEST) {
            case 'POST':
                if($method == 'create') {
                    $this->reg();
                }
                elseif($method == 'login') {
                    $this->login();
                }
                else{
                    $this->errorNoUrl();
                }
                break;
            case 'GET':
                if($method == 'logout') {
                    $this->logoutUser($id);
                }
                else{
                    $this->errorNoUrl();
                }
                break;
            default:
                $this->errorMethodNotAllowed();
        }
    }
    private function logoutUser($id){
        if(models_user::logout($id)) {
            $res["success"] = 1;
        } else {
            $res["error"] = "Error logout";
        }
        echo json_encode($res);
    }
    private function login(){
        if (isset($_POST['login']) && isset($_POST["pass"])) {
            $auth = models_user::signIn($_POST["login"], $_POST["pass"]);
            if ($auth){
                $res["success"] = 1;
            } else {
                $res["text"] = "Логин или пароль введены неверно";
                $res["error"] = 0;
            }
        } else {
            $res["text"] = "Введите логин и пароль";
            $res["error"] = 0;
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);

    }
    private function reg()
    {
        if (isset($_POST['name']) && isset($_POST['surname']) && isset($_POST['login']) && isset($_POST['pass']) && isset($_POST['pass2'])) {
            if ($_POST['pass'] === $_POST['pass2']) {
                $password = md5($_POST['pass']);
                $obj = models_user::signUp($_POST['name'], $_POST['surname'], $password, $_POST["login"]);
                if ($obj == false) {
                    $res["text"] = 'Такой пользователь уже есть';
                    $res["type"] = 0;
                } else {
                    $res["text"] = 'Пользователь успешно зарегистрирован';
                    $res["success"] = 1;
                }

            } else {
                $res["text"] = "Пароли не совпадают";
                $res["error"] = 0;
            }
        } else {
            $res["text"] = "Данных не хватает";
            $res["error"] = 0;
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);

    }
}
