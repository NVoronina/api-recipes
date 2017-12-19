<?php

class models_images {

    static function createImage($data, $id){
        $sql = "INSERT INTO images(image,recipe_id)
                VALUES";
        foreach($data as $key => $value){
            $sql .= "(
                  '". models_DB::escape($data[$key])."',
                  ". models_DB::escape($id)."
                ),";
        }
        $sql = trim($sql, ',').';';
        $info = models_DB::setValue($sql);
        return $info;
    }

}
