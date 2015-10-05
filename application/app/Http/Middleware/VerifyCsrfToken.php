<?php namespace HelloVideo\Http\Middleware;

use Closure;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as BaseVerifier;

class VerifyCsrfToken extends BaseVerifier {

	//add an array of Routes to skip CSRF check
	private $openRoutes = ['stripe/webhook'];

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
		foreach($this->openRoutes as $route) {

      if ($request->is($route)) {
        return $next($request);
      }
    }
    
		return parent::handle($request, $next);
	}

}
