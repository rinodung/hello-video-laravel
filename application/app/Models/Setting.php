<?php 

class Setting extends Eloquent {
	protected $guarded = array();

	public static $rules = array();

	protected $fillable = array('website_name', 'website_description', 'logo', 'favicon', 'system_email', 'demo_mode', 'enable_https', 'facebook_page_id', 'google_page_id', 'twitter_page_id', 'youtube_page_id', 'google_tracking_id', 'google_oauth_key', 'google_secret_key', 'google_api_key', 'videos_per_page', 'posts_per_page');
}