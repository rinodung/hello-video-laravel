<?php namespace HelloVideo\Providers;

use Illuminate\Routing\Router;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Route;
use \Auth as Auth;
use \View as View;
use \Redirect as Redirect;
use Illuminate\Cookie\CookieJar as CookieJar;

class RouteServiceProvider extends ServiceProvider {

	/**
	 * This namespace is applied to the controller routes in your routes file.
	 *
	 * In addition, it is set as the URL generator's root namespace.
	 *
	 * @var string
	 */
	protected $namespace = null;

	/**
	 * Define your route model bindings, pattern filters, etc.
	 *
	 * @param  \Illuminate\Routing\Router  $router
	 * @return void
	 */
	public function boot(Router $router)
	{
		parent::boot($router);

		//
		$settings = \Setting::first();
		$root_dir = __DIR__ . '/../../../';
	    
	        if(\Cookie::get('theme')){
	            $theme = \Crypt::decrypt(\Cookie::get('theme'));
	        } else {
	            if($settings->theme): 
	                $theme = $settings->theme;
	            endif;
	        }


	        //echo $theme; die();

		// Add the theme view namespace
		
		

		\Config::set('mail.from', ['address' => $settings->system_email, 'name' => $settings->website_name]);

		@include( $root_dir . 'content/themes/' . $theme . '/functions.php');
		View::addNamespace('Theme', $root_dir . 'content/themes/' . $theme);

		Route::filter('auth', function()
		{
			if (Auth::guest()) return Redirect::guest('login');
		});


		Route::filter('auth.basic', function()
		{
			return Auth::basic();
		});

		Route::filter('if_logged_in_must_be_subscribed', function()
		{
			if (!Auth::guest()){
				if(!Auth::user()->subscribed() && Auth::user()->role == 'subscriber'){
					$username = Auth::user()->username;
			    	return Redirect::to('user/' . $username . '/renew_subscription')->with(array('note' => 'Uh oh, looks like you don\'t have an active subscription, please renew to gain access to all content', 'note_type' => 'error'));
				}		
			}
		});

		Route::filter('admin', function()
		{
			if (!Auth::guest() && (Auth::user()->role == 'admin' || Auth::user()->role == 'demo')){

			} else {
				return Redirect::to('/login');
			}
		});

		Route::filter('demo', function()
		{
			if (!Auth::guest() && Auth::user()->role == 'demo'){
				return Redirect::back()->with(array('note' => 'Sorry, unfortunately this functionality is not available in demo accounts', 'note_type' => 'error'));
			}
		});

		Route::filter('guest', function()
		{
			if (Auth::check()) return Redirect::to('/');
		});

	}

	/**
	 * Define the routes for the application.
	 *
	 * @param  \Illuminate\Routing\Router  $router
	 * @return void
	 */
	public function map(Router $router)
	{
		$router->group(['namespace' => $this->namespace], function($router)
		{
			require app_path('Http/routes.php');
		});
	}

}
