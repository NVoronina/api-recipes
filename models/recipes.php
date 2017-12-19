<?php

class models_recipes {
    static function getOneRecipe($id){
        $sql = 'SELECT *
				FROM recipes
				WHERE recipe_id = ' . $id . ';';
        $info = models_DB::getRow($sql);
        return $info;
    }
    static function getListRecipes(){
        $sql = 'SELECT *
				FROM recipes;';
        $info = models_DB::getArray($sql);
        return $info;
    }
    static function createRecipe($data, $idUser){
        $sql = "INSERT INTO recipes(name,descriptions,id_user,date_create)
                VALUES(
                  '". models_DB::escape($data['name'])."',
                  '". models_DB::escape($data['descriptions'])."',
                  '". models_DB::escape($idUser)."',
                  now()
                );";
        $info = models_DB::setValue($sql);
        return $info;
    }
    static function deleteRecipe($idUser, $id){
        $sql = 'DELETE FROM recipes
				WHERE id_user = ' . $idUser . '
				AND recipe_id = ' . $id . ';';
        $info = models_DB::removeValue($sql);
        return $info;
    }
    static function updateRecipe($idUser, $data, $id){
        $sql = "UPDATE recipes SET ";
        foreach($data as $key=>$val){
            $sql .= $key ." = '". models_DB::escape($val)."',";
        }
        $sql = trim($sql, ',') . "WHERE id_user = $idUser AND recipe_id = $id;";
        $info = models_DB::updateValue($sql);
        return $info;
    }

}
