<?php

namespace App\controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Illuminate\Database\Query\Builder;

class UserController {
 
    public function __construct()
    {
        // $this->view = $view;
    }

    public function attempt($db, $uname, $pwd) {
        $auth = $db->table('user')
            ->where('username', $uname)
            ->where('password', md5($pwd))
            ->first();
        if ($auth) {
            return $auth;
        }
        return [];
    }

}