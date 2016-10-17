<?php

class user{
    private $connection;
    
    function __construct() {
        $this->connection=false;
    }
    
    function connect() {
        if(!$this->connection){
            $this->connection   = new mysqli("127.0.0.1", "root", "root", "mydb");
        }
    }
    
    function get($id=0){
        $this->connect();
        $query  = $this->connection->prepare("select id,name,picture,address from user where id=?");
        $query->bind_param('i', $id);
        $query->execute();
        $query->bind_result($id,$name,$picture,$address);
        $query->fetch();
        if(empty($name)){
            return array();
        }
        return array(
                    'id'        => $id,
                    'name'      => $name,
                    'picture'   => $picture,
                    'address'   => $address
                );
    }
    
    function delete($id=0){
        $this->connect();
        $query  = $this->connection->prepare("delete from user where id=?");
        $query->bind_param('i', $id);
        $query->execute();
        return $query->affected_rows;
    }
    
    function change($id,$name,$picture=null,$address=null){
        $this->connect();
        $query  = $this->connection->prepare("update user set name=?,picture=?,address=? where id=?");
        $query->bind_param('sssi', $name,$picture,$address,$id);
        $query->execute();
        return $query->affected_rows;
    }
    
    function setPicture($id,$picture){
        $this->connect();
        $query  = $this->connection->prepare("update user set picture=? where id=?");
        $query->bind_param('si', $picture, $id);
        $query->execute();
        return $query->affected_rows;
    }
}

