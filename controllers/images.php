<?php
/**
 * Created by PhpStorm.
 * User: Natalia
 * Date: 18.12.2017
 * Time: 20:53
 */
class controllers_images extends controllers_main
{

    public function index($method, $id)
    {
        switch ($method) {
            case 'form':
                $this->main();
                break;
            case 'create':
                $this->addImage($id);
                break;
            default:
                $this->errorMethodNotAllowed();
        }

    }

    private function main()
    {
        // это форма для теста загрузке изображения
        echo '<form method="post" enctype="multipart/form-data" action="../create/10">
                <input type="file" id="file" name="file[]" multiple><br>
                <button>Submit</button>
               </form>';
    }

    private function addImage($id)
    {
        $types = array("image/png", "image/jpeg");
        $errors = [1,2,3,4];
        if (!in_array($_FILES["file"]["error"], $errors)) {
            if (!in_array($_FILES["file"]["type"], $types)) {
                $imagesArr = [];
                foreach($_FILES["file"]["name"] as $key => $name){
                    move_uploaded_file($_FILES["file"]["tmp_name"][$key], PUBLIC_IMAGES . $_FILES["file"]["name"][$key]);
                    $imagesArr[] = $_FILES["file"]["name"][$key];
                }
                models_images::createImage($imagesArr, $id);
                $response['success'] = "Files added";
                $response['code'] = 201;
            }
            else {
                $response['error'] = "Format file doesn't access";
                $response['code'] = 400;
            }
        }
        else{
            $response['error'] = "Error image upload";
            $response['code'] = 400;
        }
        echo json_encode($response);
        http_response_code($response['code']);
    }
}