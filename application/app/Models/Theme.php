<?php

class Theme extends Eloquent {
	protected $guarded = array();

	public static $rules = array();

	public $timestamps = false;

	protected $fillable = array('name', 'description', 'version', 'slug', 'active');
}