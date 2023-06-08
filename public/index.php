<?php
use DI\Container;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;

ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['HTTP_HOST'] == 'localhost') {
    $GLOBALS['environment'] = 'local';
    $GLOBALS['basePath'] = '/template-slim';
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

    $function = new \Twig\TwigFunction('json_decode', function ($a) {
        return json_decode($a);
    });
    $view->getEnvironment()->addFunction($function);
    
    $view->addExtension(new \Twig\Extension\DebugExtension());
    return $view;
});

$app = AppFactory::create();
$app->setBasePath($GLOBALS['basePath']);

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("Hello world!");
    return $response;
});

$app->get('/slide', function (Request $request, Response $response, $args) {
    $v = $this->get('view')->render($response, 'slide.html', [
        'title' => 'Slide'
    ]);
    return $v;
})->setName('slide');

$app->run();
