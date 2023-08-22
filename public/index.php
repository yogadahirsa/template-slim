<?php
use DI\Container;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;
use Slim\Routing\RouteCollectorProxy;
use Slim\Routing\RouteContext;
use App\middleware\AuthMiddleware;
use App\middleware\InputMiddleware;
use App\middleware\NilaiMiddleware;
use App\middleware\RekapMiddleware;
use App\middleware\KomitmenMiddleware;
use App\controller\UserController as UserController;
use App\controller\MediaController as MediaController;
use App\controller\PenilaianController as PenilaianController;
use App\controller\PenjurianController as PenjurianController;

session_start();

ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['HTTP_HOST'] == 'localhost') {
    $GLOBALS['environment'] = 'local';
    $GLOBALS['basePath'] = '/media';
}
else if ($_SERVER['HTTP_HOST'] == 'sdgs-awards.bappenas.go.id') {
    $GLOBALS['environment'] = 'vps';
    $GLOBALS['basePath'] = '/modul-media';
}
else {
    echo 'Unknown Host!';
    echo $_SERVER['HTTP_HOST'];
    die();
}

require __DIR__ . '/../vendor/autoload.php';

$container = new Container();
AppFactory::setContainer($container);

$container->set('view', function () {
    $view = Twig::create(__DIR__ . '/../src/view/', [
        'cache' => false,
        'debug' => true,
    ]);
    $view->getEnvironment()->addGlobal('env', $GLOBALS['environment']);
    $view->getEnvironment()->addGlobal('path', $GLOBALS['basePath']);
    $view->getEnvironment()->addGlobal('session', $_SESSION);

    $function = new \Twig\TwigFunction('json_decode', function ($a) {
        return json_decode($a);
    });
    $view->getEnvironment()->addFunction($function);
    
    $view->addExtension(new \Twig\Extension\DebugExtension());
    return $view;
});
$container->set('db', function () {
    if ($GLOBALS['environment'] == 'local') {
        $setting = require __DIR__ . '/../app/setting.php';
    }
    else if ($GLOBALS['environment'] == 'vps') {
        $setting = require __DIR__ . '/../app/setting_vps.php';
    }
    
    $capsule = new \Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($setting['settings']['db'],'db');

    $capsule->setAsGlobal();
    $capsule->bootEloquent();

    return $capsule;
});

$container->set('myUser', function () {
    return new UserController();
});
$container->set('myMedia', function () {
    return new MediaController();
});
$container->set('myPenilaian', function () {
    return new PenilaianController();
});
$container->set('myPenjurian', function () {
    return new PenjurianController();
});
$container->set('var', function () {
    $setting = require __DIR__ . '/../app/var.php';
    return $setting;
});
$container->set('upload_directory', function () {
    return __DIR__ . '/../public/upload/';
});

$app = AppFactory::create();
$app->setBasePath($GLOBALS['basePath']);
$app->add(TwigMiddleware::createFromContainer($app));

$errorMiddleware = $app->addErrorMiddleware(true, false, false);

$customErrorHandler = function (Psr\Http\Message\ServerRequestInterface $request,\Throwable $exception,bool $displayErrorDetails,bool $logErrors,bool $logErrorDetails) use ($app) {
    $response = $app->getResponseFactory()->createResponse();

    $response->getBody()->write("<h1>404 Not Found</h1>");
    return $response;
};

$errorMiddleware->setErrorHandler(Slim\Exception\HttpNotFoundException::class, $customErrorHandler);

// ROUTER
// -------------------------------------------------------------------------------------------------------------------------------

$app->group('', function (RouteCollectorProxy $group) {
    $group->get('/', function (Request $request, Response $response, $args) {
        // $response->getBody()->write("Hello world!");
        // return $response;
        return $response->withStatus(302)->withHeader('Location', 'dashboard');
    });

    $group->get('/dashboard', function (Request $request, Response $response, $args) {
        $v = $this->get('view')->render($response, 'dashboard.html', [
            'title' => 'Dashboard',
        ]);
        return $v;
    })->setName('dashboard');
})->add(new AuthMiddleware());

// -------------------------------------------------------------------------------------------------------------------------------

$app->group('', function (RouteCollectorProxy $group) {
    $group->get('/input', function (Request $request, Response $response, $args) {
        $v = $this->get('view')->render($response, 'input.html', [
            'title' => 'Input'
        ]);
        return $v;
    })->setName('input');

    $group->post('/tambah_media', function (Request $request, Response $response, $args) {
        $db = $this->get('db')::connection('db');
        $param = $request->getParsedBody();

        $ins = $this->get('myMedia')->add($db, $param['nama_resmi'], $_SESSION['media_id']);
        if ($ins) {
            $result['status'] = 1;
        }
        else {
            $result['status'] = 0;
        }
        $response->getBody()->write(json_encode($result));
        return $response->withHeader('Content-Type', 'application/json');
    })->setName('tambah_media');

    $group->post('/edit_media', function (Request $request, Response $response, $args) {
        $db = $this->get('db')::connection('db');
        $param = $request->getParsedBody();

        $ins = $this->get('myMedia')->edit($db, $param);
        if ($ins) {
            $result['status'] = 1;
        }
        else {
            $result['status'] = 0;
        }
        $response->getBody()->write(json_encode($result));
        return $response->withHeader('Content-Type', 'application/json');
    })->setName('edit_media');

    $group->get('/delete_media_by_id/{id}', function (Request $request, Response $response, $args) {
        $db = $this->get('db')::connection('db');

        $del = $this->get('myMedia')->delete($db, $args['id']);
        if ($del) {
            $result['status'] = 1;
        }
        else {
            $result['status'] = 0;
        }
        $response->getBody()->write(json_encode($result));
        return $response->withHeader('Content-Type', 'application/json');
    })->setName('delete_media_by_id');

    $group->get('/form_kinerja/{id}', function (Request $request, Response $response, $args) {
        $var = $this->get('var');
        $v = $this->get('view')->render($response, 'form-kinerja.html', [
            'title' => 'Form',
            'opsi_p1_a' => $var['p1_a'],
            'opsi_p1_b' => $var['p1_b'],
            'opsi_p2_a' => $var['p2_a'],
            'opsi_p2_b' => $var['p2_b'],
            'opsi_p2_c' => $var['p2_c'],
            'id' => $args['id'],
        ]);
        return $v;
    })->setName('form_kinerja');

    $group->post('/post_form_kinerja', function (Request $request, Response $response, $args) {
        $db = $this->get('db')::connection('db');
        $param = $request->getParsedBody();

        $directory = $this->get('upload_directory');
        $uploadedFiles = $request->getUploadedFiles();

        $obj = new stdClass();

        if ($param['p1_a'] > 1) {
            $lampiran = 'lamp_p1_a';
            $uploadedFile = $uploadedFiles[$lampiran];

            if (isset($uploadedFile)) {
                $result[$lampiran] = $this->get('myMedia')->uploadFile($uploadedFile, $directory, $lampiran, $param['mid']);
                $obj->{$lampiran} = $result[$lampiran];
            }
            else if (isset($param['is_uploaded_lamp_p1_a'])) {
                $obj->{$lampiran} = $param['is_uploaded_lamp_p1_a'];
            }
        }

        if ($param['p1_b'] > 1) {
            $lampiran = 'lamp_p1_b';
            $uploadedFile = $uploadedFiles[$lampiran];
            
            if (isset($uploadedFile)) {
                $result[$lampiran] = $this->get('myMedia')->uploadFile($uploadedFile, $directory, $lampiran, $param['mid']);
                $obj->{$lampiran} = $result[$lampiran];
            }
            else if (isset($param['is_uploaded_lamp_p1_b'])) {
                $obj->{$lampiran} = $param['is_uploaded_lamp_p1_b'];
            }
        }

        if ($param['p2_c'] > 1) {
            $lampiran = 'lamp_p2_c';
            $uploadedFile = $uploadedFiles[$lampiran];
            
            if (isset($uploadedFile)) {
                $result[$lampiran] = $this->get('myMedia')->uploadFile($uploadedFile, $directory, $lampiran, $param['mid']);
                $obj->{$lampiran} = $result[$lampiran];
            }
            else if (isset($param['is_uploaded_lamp_p2_c'])) {
                $obj->{$lampiran} = $param['is_uploaded_lamp_p2_c'];
            }
        }

        $obj->p1_a = $param['p1_a'];
        $obj->p1_b = $param['p1_b'];
        $obj->p2_a = $param['p2_a'];
        $obj->p2_b = $param['p2_b'];
        $obj->p2_c = $param['p2_c'];
        $obj->link_artikel1 = $param['link_artikel1'];
        $obj->link_artikel2 = $param['link_artikel2'];
        $obj->link_artikel3 = $param['link_artikel3'];

        $cek = $this->get('myMedia')->getPenilaiaByPendaftarId($db, $param['mid']);
        if ($cek) {
            $re = $this->get('myMedia')->updateKinerja($db, $param['mid'], $_SESSION['media_id'], json_encode($obj));
        }
        else {
            $re = $this->get('myMedia')->insertKinerja($db, $param['mid'], $_SESSION['media_id'], json_encode($obj));
        }
        
        $result['status'] = 1;
        
        $response->getBody()->write(json_encode($result));
        return $response->withHeader('Content-Type', 'application/json');
    })->setName('post_form_kinerja');
})->add(new InputMiddleware());

// -------------------------------------------------------------------------------------------------------------------------------

$app->group('', function (RouteCollectorProxy $group) {
    $group->get('/nilai', function (Request $request, Response $response, $args) {
        $v = $this->get('view')->render($response, 'nilai.html', [
            'title' => 'Nilai'
        ]);
        return $v;
    })->setName('nilai');

    $group->get('/penilaian_tahap1', function (Request $request, Response $response, $args) {
        $v = $this->get('view')->render($response, 'penilaian-tahap1/list.html', [
            'title' => 'Penilaian'
        ]);
        return $v;
    })->setName('penilaian_tahap1');

    $group->get('/form_penilaian/{id}', function (Request $request, Response $response, $args) {
        $db = $this->get('db')::connection('db');
        $detail = $this->get('myMedia')->getPenilaiaByPendaftarIdPenilaiId($db, $args['id'], $_SESSION['media_id']);

        $var = $this->get('var');

        $title_p1_a = "<ol>";
        foreach($var['p1_a'] as $el) {
            $title_p1_a .= "<li>{$el['nama']}</li>";
        }
        $title_p1_a .= "</ol>";

        $title_p1_b = "<ol>";
        foreach($var['p1_b'] as $el) {
            $title_p1_b .= "<li>{$el['nama']}</li>";
        }
        $title_p1_b .= "</ol>";

        $title_p2_a = "<ol>";
        foreach($var['p2_a'] as $el) {
            $title_p2_a .= "<li>{$el['nama']}</li>";
        }
        $title_p2_a .= "</ol>";

        $title_p2_b = "<ol>";
        foreach($var['p2_b'] as $el) {
            $title_p2_b .= "<li>{$el['nama']}</li>";
        }
        $title_p2_b .= "</ol>";

        $title_p2_c = "<ol>";
        foreach($var['p2_c'] as $el) {
            $title_p2_c .= "<li>{$el['nama']}</li>";
        }
        $title_p2_c .= "</ol>";

        $uri = RouteContext::fromRequest($request)->getRouteParser()->urlFor('penilaian_tahap1');
        if (isset($detail->penilaian_kinerja)) {
            $pk = json_decode($detail->penilaian_kinerja);
        }
        else {
            $pk = [];
        }
        if (isset($detail->penjurian)) {
            $pj = json_decode($detail->penjurian);
        }
        else {
            $pj = [];
        }

        $v = $this->get('view')->render($response, 'penilaian-tahap1/form.html', [
            'title' => 'Form',
            'back' => $uri,
            'dir' => $GLOBALS['basePath'],
            'detail' => $detail,
            'penilaian_kinerja' => $pk,
            'penjurian' => $pj,
            'opsi_p1_a' => $var['p1_a'],
            'opsi_p1_b' => $var['p1_b'],
            'opsi_p2_a' => $var['p2_a'],
            'opsi_p2_b' => $var['p2_b'],
            'opsi_p2_c' => $var['p2_c'],
            'title_p1_a' => $title_p1_a,
            'title_p1_b' => $title_p1_b,
            'title_p2_a' => $title_p2_a,
            'title_p2_b' => $title_p2_b,
            'title_p2_c' => $title_p2_c,
            'id' => $args['id'],
        ]);
        return $v;
    })->setName('form_penilaian');

    $group->post('/post_penilaian', function (Request $request, Response $response, $args) {
        $db = $this->get('db')::connection('db');
        $param = $request->getParsedBody();

        $obj = new stdClass();
        $obj->p1_a = $param['p1_a'];
        $obj->p1_b = $param['p1_b'];
        $obj->p2_a = $param['p2_a'];
        $obj->p2_b = $param['p2_b'];
        $obj->p2_c = $param['p2_c'];

        $cek = $this->get('myPenjurian')->getByMidPid($db, $param['mid'], $_SESSION['media_id'], 1);

        if (isset($cek->id)) {
            // echo 'masuk'; die();
            $re = $this->get('myPenjurian')->updateTahap1($db, $param['mid'], $_SESSION['media_id'], json_encode($obj));
        }
        else {
            // echo 'masuk2'; die();
            $re = $this->get('myPenjurian')->insTahap1($db, $param['mid'], $_SESSION['media_id'], json_encode($obj));
        }
        
        if ($re) {
            $result['status'] = 'ok';
        }
        else {
            $result['status'] = 'err';
        }

        $response->getBody()->write(json_encode($result));
        return $response->withHeader('Content-Type', 'application/json');
    })->setName('post_penilaian');
})->add(new NilaiMiddleware());

// -------------------------------------------------------------------------------------------------------------------------------

$app->group('', function (RouteCollectorProxy $group) {
    $group->get('/rekap', function (Request $request, Response $response, $args) {
        $v = $this->get('view')->render($response, 'rekap/list.html', [
            'title' => 'Rekapitulasi'
        ]);
        return $v;
    })->setName('rekap');
})->add(new RekapMiddleware());

// -------------------------------------------------------------------------------------------------------------------------------

$app->get('/slide', function (Request $request, Response $response, $args) {
    $v = $this->get('view')->render($response, 'slide.html', [
        'title' => 'Slide'
    ]);
    return $v;
})->setName('slide');

$app->get('/login', function (Request $request, Response $response, $args) {
    $v = $this->get('view')->render($response, 'login.html', [
        'title' => 'Login'
    ]);
    return $v;
})->setName('login');

$app->get('/logout', function (Request $request, Response $response) {
    session_unset();
    return $response->withStatus(302)->withHeader('Location', 'login');
})->setName('logout');

$app->post('/post-login', function (Request $request, Response $response, $args) {
    $db = $this->get('db')::connection('db');
    $param = $request->getParsedBody();

    $att = $this->get('myUser')->attempt($db, $param['usr'], $param['pwd']);
    
    if (isset($att->id)) {
        $arr = json_decode($att->id_roles);
        $var = $this->get('var');
        $_SESSION['media_id'] = $att->id;
        $_SESSION['media_nama_lengkap'] = $att->nama_lengkap;
        $_SESSION['media_roles'] = $arr;
        $_SESSION['periode'] = $var['periode'];

        return $response->withStatus(302)->withHeader('Location', 'dashboard');
    }
    else {
        return $response->withStatus(302)->withHeader('Location', 'login');
    }

})->setName('post-login');

$app->get('/notauthorized', function (Request $request, Response $response, $args) {
    $v = $this->get('view')->render($response, 'notauthorized.html', [
        'title' => 'Not Authorized',
    ]);
    return $v;
})->setName('notauthorized');

// API
// -------------------------------------------------------------------------------------------------------------------------------

$app->get('/get_list_media', function (Request $request, Response $response) {
    $db = $this->get('db')::connection('db');
    $result = $this->get('myMedia')->getList($db);

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_list_media');

$app->get('/get_list_media_join', function (Request $request, Response $response) {
    $db = $this->get('db')::connection('db');
    $result = $this->get('myMedia')->getListJoin($db, $_SESSION['media_id']);

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_list_media_join');

$app->get('/get_list_media_bulk', function (Request $request, Response $response) {
    $db = $this->get('db')::connection('db');
    $result['data'] = $this->get('myMedia')->getListBulk($db);
    $result['var'] = json_encode($this->get('var'));

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_list_media_bulk');

$app->get('/get_media_by_id/{id}', function (Request $request, Response $response, $args) {
    $db = $this->get('db')::connection('db');
    $result = $this->get('myMedia')->getById($db, $args['id']);

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_media_by_id');

$app->get('/get_url/{uri}', function (Request $request, Response $response, $args) {
    $uri = RouteContext::fromRequest($request)->getRouteParser()->urlFor($args['uri']);
    $result['uri'] = $uri;
    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_url');

$app->get('/get_penilaian_by_pid/{id}', function (Request $request, Response $response, $args) {
    $db = $this->get('db')::connection('db');
    $result['uri'] = $_SERVER['PHP_SELF'];
    $result['data'] = $this->get('myMedia')->getPenilaiaByPendaftarId($db, $args['id']);

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_penilaian_by_pid');

$app->get('/get_penjurian_by_mid/{mid}', function (Request $request, Response $response, $args) {
    $db = $this->get('db')::connection('db');
    $result['data'] = $this->get('myPenjurian')->getByMid($db, $args['mid']);

    $response->getBody()->write(json_encode($result));
    return $response->withHeader('Content-Type', 'application/json');
})->setName('get_penjurian_by_mid');

$app->run();