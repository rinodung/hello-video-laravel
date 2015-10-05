<?php

class Page extends Eloquent {
	protected $guarded = array();


	public static $rules = array();

	protected $table = 'pages';

	protected $fillable = array('user_id', 'title', 'slug', 'image', 'body', 'active', 'created_at');

}