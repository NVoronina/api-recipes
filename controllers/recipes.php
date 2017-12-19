<?php
/**
 * Created by PhpStorm.
 * User: Natalia
 * Date: 18.12.2017
 * Time: 17:43
 */
class controllers_recipes extends controllers_main {

    public function index($method, $id){
        switch (REQUEST) {
            case 'POST':
                $this->newRecipes();
                break;
            case 'PUT':
                if($method == 'update') {
                    $this->updateRecipes($id);
                } else {
                    $this->errorNoUrl();
                }
                break;
            case 'DELETE':
                if($method == 'remove') {
                    $this->deleteRecipe($id);
                } else {
                    $this->errorNoUrl();
                }
                break;
            case 'GET':
                if($method == 'all') {
                    $this->getRecipes();
                } elseif($method == 'one') {
                    $this->oneRecipe($id);
                } else {
                    $this->errorNoUrl();
                }
                break;
            default:
                $this->errorMethodNotAllowed();
        }

    }
    private function newRecipes(){
        if($this->id){
            models_recipes::createRecipe($_POST, $this->id);
            $response['success'] = "Created";
            $response['code'] = 201;
        }
        else{
            $response['error'] = "User not authorized";
            $response['code'] = 401;
        }
        echo json_encode($response);
        http_response_code($response['code']);

    }
    private function updateRecipes($id){
        if($this->id){
            if($id) {
                $data = $this->generatePut();
                if($data){
                    models_recipes::updateRecipe($this->id, $data, $id);
                    $response['success'] = "Updated";
                    $response['code'] = 202;
                }
                else {
                    $response['error'] = "Fail/ No data";
                    $response['code'] = 406;
                }
            }
            else {
                $response['error'] = "Not enough data for update";
                $response['code'] = 412;
            }
        }
        else{
            $response['error'] = "User not authorized";
            $response['code'] = 401;
        }
        echo json_encode($response);
        http_response_code($response['code']);
    }
    private function deleteRecipe($id){
        if($this->id){
            if($id) {
                models_recipes::deleteRecipe($this->id, $id);
                $response['success'] = "Deleted";
                $response['code'] = 200;

            }
            else {
                $response['error'] = "Not enough data for delete";
                $response['code'] = 412;
            }
        }
        else {
            $response['error'] = "User not authorized";
            $response['code'] = 401;
        }
        echo json_encode($response);
        http_response_code($response['code']);
    }
    private function getRecipes(){
        $response = models_recipes::getListRecipes();
        echo json_encode($response);
    }
    private function oneRecipe($id){
        $response = models_recipes::getOneRecipe($id);
        echo json_encode($response);
    }
}