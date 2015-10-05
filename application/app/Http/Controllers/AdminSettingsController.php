<?php

use \Redirect as Redirect;

class AdminSettingsController extends Controller {

	public function index()
	{

		$data = array(
			'admin_user' => Auth::user(),
			'settings' => Setting::first(),
			);
		return View::make('admin.settings.index', $data);
	}

	public function save_settings(){

		$input = Input::all();
		$settings = Setting::first();

		$demo_mode = Input::get('demo_mode');
		$enable_https = Input::get('enable_https');

		if(empty($demo_mode)){
			$input['demo_mode'] = 0;
		}

		if(empty($enable_https)){
			$input['enable_https'] = 0;
		}

		if(Input::hasFile('logo')){
        	$input['logo'] = ImageHandler::uploadImage(Input::file('logo'), 'settings');
        } else { $input['logo'] = $settings->logo; }

        if(Input::hasFile('favicon')){
        	$input['favicon'] = ImageHandler::uploadImage(Input::file('favicon'), 'settings');
        } else { $input['favicon'] = $settings->favicon; }


        $settings->update($input);

        return Redirect::to('admin/settings')->with(array('note' => 'Successfully Updated Site Settings!', 'note_type' => 'success') );

	}

}