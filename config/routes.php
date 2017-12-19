<?php
return $routs = array(
    "controllers_user" => array(
        "#^" . SUBSERVER . "user/(login)/$#",
        "#^" . SUBSERVER . "user/(create)/$#",
        "#^" . SUBSERVER . "user/(logout)/([0-9]+)$#",
    ),
    "controllers_recipes" => array(
        "#^" . SUBSERVER . "recipes/$#",
        "#^" . SUBSERVER . "recipes/(update)/([0-9]+)$#",
        "#^" . SUBSERVER . "recipes/(all)/$#",
        "#^" . SUBSERVER . "recipes/(one)/([0-9]+)$#",
        "#^" . SUBSERVER . "recipes/(remove)/([0-9]+)$#",
    ),
    "controllers_images" => array(
        "#^" . SUBSERVER . "images/(form)/$#",
        "#^" . SUBSERVER . "images/(create)/([0-9]+)$#",
    ),
);

?>