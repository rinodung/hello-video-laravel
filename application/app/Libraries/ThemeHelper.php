<?php

class ThemeHelper{

	public static function getThemeSettings() {

		// Get the Active Theme and the Theme Settings
		$active_theme = Setting::first()->theme;
		$theme_settings = ThemeSetting::where('theme_slug', '=', $active_theme)->get();

		// Create an empty array to fill with theme settings
		$key_values = array();

		// loop through each key value and put into array accordingly
		foreach($theme_settings as $setting){
			$key_values[$setting->key] = $setting->value;
		}

		return (object) $key_values;
	}

	public static function getThemeSetting($setting, $default){
		if(isset($setting) && !empty($setting)){
			return $setting;
		} else {
			return $default;
		}
	}

	public static function get_themes() {
		$themes = array();
		$theme_folder = 'content/themes';
		$themes_dir = @ opendir( $theme_folder);
		$theme_files = array();
		
		if ( $themes_dir ) {
			
			while (($folder = readdir( $themes_dir ) ) !== false ) {
				if( @is_readable("$theme_folder/$folder/home.php") && is_readable("$theme_folder/$folder/info.json") ){
					$theme_info = file_get_contents("$theme_folder/$folder/info.json");
					$theme_info = json_decode($theme_info, true);
					$theme_info['slug'] = $folder;
					array_push($themes, (object) $theme_info);
				}
			}
			closedir( $themes_dir );
		}
		return (object) $themes;
	}

	public static function get_theme($slug){
		$theme_folder = 'content/themes';
		if( @is_readable("$theme_folder/$slug/home.php") && is_readable("$theme_folder/$slug/info.json") ){
			$theme_info = file_get_contents("$theme_folder/$slug/info.json");
			$theme_info = json_decode($theme_info, true);
			$theme_info['slug'] = $slug;
		}
		return $theme_info;
	}

}