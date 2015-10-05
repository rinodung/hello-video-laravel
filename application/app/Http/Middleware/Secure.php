<?php namespace HelloVideo\Http\Middleware;

use Closure;
use Illuminate\Contracts\Routing\Middleware;
use Illuminate\Contracts\Foundation\Application;
use \Setting as Setting;

/**
 * Secure
 * Redirects any non-secure requests to their secure counterparts.
 * 
 * @param request The request object.
 * @param $next The next closure.
 * @return redirects to the secure counterpart of the requested uri.
*/
class Secure implements Middleware
{
	protected $app;
	
	public function __construct(Application $app)
	{
		$this->app = $app;
	}
	
	public function handle($request, Closure $next)
	{
		$settings = Setting::first();

		if (!$request->secure() && $settings->enable_https) {
			if($request->header('x-forwarded-proto') <> 'https'){
        		return redirect()->secure($request->getRequestUri());
	    	}
		}
	
		return $next($request);
	}
	
}