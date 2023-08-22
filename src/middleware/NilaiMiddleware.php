<?php

namespace App\middleware;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;
use Slim\Routing\RouteContext;

class NilaiMiddleware
{
    /**
     * Example middleware invokable class
     *
     * @param  ServerRequest  $request PSR-7 request
     * @param  RequestHandler $handler PSR-15 request handler
     *
     * @return Response
     */
    public function __invoke(Request $request, RequestHandler $handler): Response
    {
        $response = $handler->handle($request);
        
        if (isset($_SESSION['media_id']) && (in_array("12", $_SESSION['media_roles']) || in_array("21", $_SESSION['media_roles']))) {
            return $response;
        }
        else {
            $uri = RouteContext::fromRequest($request)->getRouteParser()->urlFor('notauthorized');
            return $response->withStatus(302)->withHeader('Location', $uri);
        }
    }
}