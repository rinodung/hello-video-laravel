<?php

class AdminPluginsController extends Controller {

	public function index()
	{
		$data = array(
			'admin_user' => Auth::user()
			);
		return View::make('admin.plugins.index', $data);
	}

}