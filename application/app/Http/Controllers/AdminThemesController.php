<?php

use \Redirect as Redirect;

class AdminThemesController extends Controller {

	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */

	public function index()
	{
		$data = array(
			'admin_user' => Auth::user(),
			'themes' => ThemeHelper::get_themes(),
			'active_theme' => Setting::first()->theme
			);

		return View::make('admin.themes.index', $data);
	}

	public function activate($slug)
	{
		$settings = Setting::first();
		$settings->theme = $slug;
		$settings->save();
		return Redirect::to('admin/themes')->with(array('note' => 'Successfully Activated ' . ucfirst($slug) . ' Theme', 'note_type' => 'success'));
	}

}