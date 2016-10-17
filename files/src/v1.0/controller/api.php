<?php
require __DIR__.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'model'.DIRECTORY_SEPARATOR.'user.php';

class api{
    
    private static function sendHeaders(){
//        header("Access-Control-Allow-Orgin: *");
//        header("Access-Control-Allow-Methods: *");
        http_response_code(200);
    }
    
    public static function __callStatic($name, $arguments) {
        if(empty($name)||!method_exists(__CLASS__,$name)){
            http_response_code(404);
        }else{
            self::sendHeaders();
            self::$name($arguments);
        }
    }

    public static function get($args){
        $user   = new user();
        if(empty($args)||empty($args[0])){
            http_response_code(404);
        }else{
            self::sendHeaders();
            header('Content-Type: application/json');
            echo json_encode($user->get($args[0]));
        }
    }
    
    public static function delete($args){
        $user   = new user();
        if(empty($args)||empty($args[0])){
            http_response_code(404);
        }else{
            if($user->delete($args[0])>0){
                self::sendHeaders();
            }else{
               http_response_code(404); 
            }
        }
    }

    public static function change($args){
        $user   = new user();
        $nargs  = count($args);
        switch ($nargs){
            case 0:
            case 1:
               http_response_code(404);
            break;
            case 2:
                if($user->change($args[0],$args[1])>0){
                    self::sendHeaders();
                }else{
                    header("HTTP/1.1 400 Bad Request");
                }
            break;
            case 3:
                if($user->change($args[0],$args[1],$args[2])>0){
                    self::sendHeaders();
                }else{
                    header("HTTP/1.1 400 Bad Request");
                }
            break;
            case 4:
                if($user->change($args[0],$args[1],$args[2],$args[3])>0){
                    self::sendHeaders();
                }else{
                    header("HTTP/1.1 400 Bad Request");
                }
            break;
            default :
               http_response_code(404);
            break;                
        }
    }
    
    public static function setPicture($args){
        $user   = new user();
        $nargs  = count($args);
        switch ($nargs){
            case 0:
            case 1:
               http_response_code(404);
            break;
            case 2:
                $url = "https://api.olx.com/v1.0/users/images";
                $ch = curl_init($url);
                curl_setopt($ch, CURLOPT_HEADER, false);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_POST, true);
                $data = array(
                    'file' => new CURLFile($_FILES["file"]["tmp_name"],$_FILES["file"]["type"])
                );
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                $contents = json_decode(curl_exec($ch));
                curl_close($ch);
                if($user->setPicture($args[0], 'https://images01.olx-st.com/'.$contents->url)>0){
                    self::sendHeaders();
                }else{
                    http_response_code(404);
                }
                break;
        }
    }
}

