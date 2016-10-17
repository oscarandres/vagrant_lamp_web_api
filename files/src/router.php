<?php

class router{
    public static function init(){
        $route  = explode(DIRECTORY_SEPARATOR,$_SERVER['REQUEST_URI']);
        if(count($route)<4||empty($route[1])){
            header("HTTP/1.0 404 Not Found");
        }else{
            include __DIR__.DIRECTORY_SEPARATOR.$route[1].DIRECTORY_SEPARATOR.'controller'.DIRECTORY_SEPARATOR.'api.php';
            $args   = array_slice($route, 4);
//            header("Access-Control-Allow-Orgin: *");
//            header("Access-Control-Allow-Methods: *");
//            header("Content-Type: application/json");
            api::$route[3]($args);
        }
    }
}

