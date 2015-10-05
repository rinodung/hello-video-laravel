<?php

use \Redirect as Redirect;

class AdminThemeSettingsController extends Controller {

	public function theme_settings(){
		$settings = Setting::first();
		$user = Auth::user();
		$data = array(
			'settings' => $settings,
			'admin_user'	=> $user,
			);
		return View::make('admin.settings.theme_settings', $data);
	}

	public function theme_settings_form(){
		$settings = Setting::first();
		$user = Auth::user();
		
		$data = array(
			'settings' => $settings,
			'admin_user'	=> $user,
			'theme_settings' => ThemeHelper::getThemeSettings(),
			);
		return View::make('Theme::includes.settings', $data);
	}

	public function update_theme_settings(){
		// Get the Active Theme
		$active_theme = Setting::first()->theme;

		$input = Input::all();
		foreach($input as $key => $value){
			$this->createOrUpdateThemeSetting($active_theme, $key, $value);
		}

		return Redirect::to('/admin/theme_settings');
	}

	private function createOrUpdateThemeSetting($theme_slug, $key, $value){
       	
       	$setting = array(
        		'theme_slug' => $theme_slug,
        		'key' => $key,
        		'value' => $value
        	);

       	$theme_setting = ThemeSetting::where('theme_slug', '=', $theme_slug)->where('key', '=', $key)->first();

        if (isset($theme_setting->id))
        {
            $theme_setting->update($setting);
            $theme_setting->save();
        }
        else
        {
            ThemeSetting::create($setting);
        }

    }

 }