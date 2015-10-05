<?php

use \Auth as Auth;
use \HelloVideo\User as User;
use \Redirect as Redirect;
use Illuminate\Contracts\Auth\PasswordBroker;

class ThemeAuthController extends BaseController {

	public function __construct()
	{
		$this->middleware('secure');
	}
	
	/*
	|--------------------------------------------------------------------------
	| Auth Controller
	|--------------------------------------------------------------------------
	*/

	public function login_form(){
		if(!Auth::guest()){
			return Redirect::to('/');
		}
		$data = array(
			'type' => 'login',
			'menu' => Menu::orderBy('order', 'ASC')->get(),
			'video_categories' => VideoCategory::all(),
			'post_categories' => PostCategory::all(),
			'theme_settings' => ThemeHelper::getThemeSettings(),
			'pages' => Page::all(),
			);
		return View::make('Theme::auth', $data);
	}

	public function signup_form(){

		if(!Auth::guest()){
			return Redirect::to('/');
		}
		$data = array(
			'type' => 'signup',
			'menu' => Menu::orderBy('order', 'ASC')->get(),
			'payment_settings' => PaymentSetting::first(),
			'video_categories' => VideoCategory::all(),
			'post_categories' => PostCategory::all(),
			'theme_settings' => ThemeHelper::getThemeSettings(),
			'pages' => Page::all(),
			);
		return View::make('Theme::auth', $data);
	}

	public function login(){

	    // get login POST data
	    $email_login = array(
	        'email' => Input::get('email'),
	        'password' => Input::get('password')
	    );

	    $username_login = array(
	        'username' => Input::get('email'),
	        'password' => Input::get('password')
	    );

	    if ( Auth::attempt($email_login) || Auth::attempt($username_login) ){

	    	//dd(Auth::user());

	    	if(Auth::user()->subscribed() || (Auth::user()->role == 'admin' || Auth::user()->role == 'demo')):

	    		$redirect = (Input::get('redirect', 'false')) ? Input::get('redirect') : '/';
	    		if(Auth::user()->role == 'demo' && Setting::first()->demo_mode != 1){
	    			Auth::logout();
	    			return Redirect::to($redirect)->with(array('note' => 'Sorry, Demo Mode has been disabled', 'note_type' => 'error'));
	    		} else {
	    			return Redirect::to($redirect)->with(array('note' => 'You have been successfully logged in.', 'note_type' => 'success'));
	    		}
	    	else:
	    		$username = Auth::user()->username;
	    		return Redirect::to('user/' . $username . '/renew_subscription')->with(array('note' => 'Uh oh, looks like you don\'t have an active subscription, please renew to gain access to all content', 'note_type' => 'error'));
	    	endif;
	    	
	    } else {

	    	$redirect = (Input::get('redirect', false)) ? '?redirect=' . Input::get('redirect') : '';
	        // auth failure! redirect to login with errors
	        return Redirect::to('login' . $redirect)->with(array('note' => 'Invalid login, please try again.', 'note_type' => 'error'));
	    }
	    
	}

	public function signup(){


		$payment_settings = PaymentSetting::first();

		if($payment_settings->live_mode){
			User::setStripeKey( $payment_settings->live_secret_key );
		} else {
			User::setStripeKey( $payment_settings->test_secret_key );
		}
		  
		$token = Input::get('stripeToken');

		$user_data = array('username' => Input::get('username'), 'email' => Input::get('email'), 'password' => Hash::make(Input::get('password')) ); 

		$input = Input::all();
		unset($input['stripeToken']);

		$validation = Validator::make( $input, User::$rules );

		if ($validation->fails()){
			//echo $validation->messages();
			//print_r($validation->errors()); die();
			return Redirect::to('/signup')->with(array('note' => 'Sorry, there was an error creating your account.', 'note_type' => 'error', 'messages'))->withErrors($validation)->withInput(\Request::only('username', 'email'));
		}

	    $user = new User($user_data);
	    $user->save();

	    try{
	    	$user->subscription('monthly')->create($token, ['email' => $user->email]);
	    	Auth::loginUsingId($user->id);
	    	return Redirect::to('/')->with(array('note' => 'Welcome! Your Account has been Successfully Created!', 'note_type' => 'success'));
	    } catch(Exception $e){
	    	Auth::logout();
	    	$user->delete();
	    	return Redirect::to('/signup')->with(array('note' => 'Sorry, there was an error with your card: ' . $e->getMessage(), 'note_type' => 'error'))->withInput(\Request::only('username', 'email'));
	    }

	}

	public function logout(){
		Auth::logout();
		return Redirect::back()->with(array('note' => 'You have been successfully logged out', 'note_type' => 'success'));
	}


	// ********** RESET PASSWORD ********** //
	public function password_reset()
	{
		$data = array(
			'type' => 'forgot_password',
			'menu' => Menu::orderBy('order', 'ASC')->get(),
			'payment_settings' => PaymentSetting::first(),
			'video_categories' => VideoCategory::all(),
			'post_categories' => PostCategory::all(),
			'theme_settings' => ThemeHelper::getThemeSettings(),
			'pages' => Page::all(),
			);
		return View::make('Theme::auth', $data);
	}

	// ********** RESET REQUEST ********** //
	public function password_request()
	{
		$credentials = array('email' => Input::get('email'));
		$response = Password::sendResetLink($credentials, function($message){
			$message->subject('Password Reset Info');
		});

		switch ($response)
		{
			case PasswordBroker::RESET_LINK_SENT:
				return Redirect::to('login')->with(array('note' => trans($response), 'note_type' => 'success'));

			case PasswordBroker::INVALID_USER:
				return redirect()->back()->with(array('note' => trans($response), 'note_type' => 'error'));
		}
	}

	// ********** RESET PASSWORD TOKEN ********** //
	public function password_reset_token($token)
	{
		$data = array(
			'type' => 'reset_password',
			'token' => $token,
			'menu' => Menu::orderBy('order', 'ASC')->get(),
			'payment_settings' => PaymentSetting::first(),
			'video_categories' => VideoCategory::all(),
			'post_categories' => PostCategory::all(),
			'theme_settings' => ThemeHelper::getThemeSettings(),
			'pages' => Page::all(),
			);
	  return View::make('Theme::auth', $data);
	}

	// ********** RESET PASSWORD POST ********** //
	public function password_reset_post(Request $request)
	{

		$credentials = $credentials = array('email' => Input::get('email'), 'password' => Input::get('password'), 'password_confirmation' => Input::get('password_confirmation'), 'token' => Input::get('token'));



		$response = Password::reset($credentials, function($user, $password)
		{
			$user->password = \Hash::make($password);

			$user->save();

		});

		switch ($response)
		{
			case PasswordBroker::PASSWORD_RESET:
				return Redirect::to('login')->with(array('note' => 'Your password has been successfully reset. Please login below', 'note_type' => 'success'));

			default:
				return redirect()->back()->with(array('note' => trans($response), 'note_type' => 'error'));
		}

	  
	}

}