<?php

class Tag extends Eloquent {
	protected $guarded = array();

	public static $rules = array();

	public function videos(){
		return $this->belongsToMany('Video');
	}
}