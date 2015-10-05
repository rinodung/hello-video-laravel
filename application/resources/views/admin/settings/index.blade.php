@extends('admin.master')

@section('css')
	<style type="text/css">
	.make-switch{
		z-index:2;
	}
	</style>
@stop

@section('content')


<div id="admin-container">
<!-- This is where -->
	
	<div class="admin-section-title">
		<h3><i class="entypo-globe"></i> Site Settings</h3> 
	</div>
	<div class="clear"></div>

	

	<form method="POST" action="{{ URL::to('admin/settings') }}" accept-charset="UTF-8" file="1" enctype="multipart/form-data">
		
		<div class="row">
			
			<div class="col-md-4">
				<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
					<div class="panel-title">Site Name</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
					<div class="panel-body" style="display: block;"> 
						<p>Enter Your Website Name Below:</p> 
						<input type="text" class="form-control" name="website_name" id="website_name" placeholder="Site Title" value="@if(!empty($settings->website_name)){{ $settings->website_name }}@endif" />
					</div> 
				</div>
			</div>

			<div class="col-md-8">
				<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
					<div class="panel-title">Site Description</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
					<div class="panel-body" style="display: block;"> 
						<p>Enter Your Website Description Below:</p> 
						<input type="text" class="form-control" name="website_description" id="website_description" placeholder="Site Description" value="@if(!empty($settings->website_description)){{ $settings->website_description }}@endif" />
					</div> 
				</div>
			</div>

		</div>

		<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
			<div class="panel-title">Logo</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body" style="display: block; background:#f1f1f1;"> 
				@if(!empty($settings->logo))
					<img src="{{ Config::get('site.uploads_dir') . 'settings/' . $settings->logo }}" style="max-height:100px" />
				@endif
				<p>Upload Your Site Logo:</p> 
				<input type="file" multiple="true" class="form-control" name="logo" id="logo" />
				
			</div> 
		</div>

		<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
			<div class="panel-title">Favicon</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body" style="display: block;"> 
				@if(!empty($settings->favicon))
					<img src="{{ Config::get('site.uploads_dir') . 'settings/' . $settings->favicon }}" style="max-height:20px" />
				@endif
				<p>Upload Your Site Favicon:</p> 
				<input type="file" multiple="true" class="form-control" name="favicon" id="favicon" />
				
			</div> 
		</div>

		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-primary" data-collapsed="0">
					<div class="panel-heading"> <div class="panel-title">Demo Mode</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
					<div class="panel-body"> 
						<p>Enable Demo Account:</p>

						<div class="form-group">
				        	<div class="make-switch" data-on="success" data-off="warning">
				                <input type="checkbox" @if(!isset($settings->demo_mode) || (isset($settings->demo_mode) && $settings->demo_mode))checked="checked" value="1"@else value="0"@endif name="demo_mode" id="demo_mode" />
				            </div>
						</div>
						
					</div>
				</div>

			</div>
			<div class="col-sm-6"> 
				<div class="panel panel-primary" data-collapsed="0">
					<div class="panel-heading"> <div class="panel-title">Enable https:// sitewide</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
					<div class="panel-body"> 
						<p>Make sure you have purchased an SSL before anabling https://</p>
						<div class="form-group">
				        	<div class="make-switch" data-on="success" data-off="warning">
				                <input type="checkbox" @if(!isset($settings->enable_https) || (isset($settings->enable_https) && $settings->enable_https))checked="checked" value="1"@else value="0"@endif name="enable_https" id="enable_https" />
				            </div>
						</div>
					</div>
				</div>
			</div>

		</div>


		<div class="row">
			<div class="col-sm-6">
				<div class="panel panel-primary" data-collapsed="0">
					<div class="panel-heading"> <div class="panel-title">Videos Per Page</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
					<div class="panel-body"> 
						<p>Default number of videos to show per page:</p> 
						<input type="text" class="form-control" name="videos_per_page" id="videos_per_page" placeholder="# of Videos Per Page" value="@if(!empty($settings->videos_per_page)){{ $settings->videos_per_page }}@endif" />
					</div>
				</div>

			</div>
			<div class="col-sm-6"> 
				<div class="panel panel-primary" data-collapsed="0">
					<div class="panel-heading"> <div class="panel-title">Posts Per Page</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
					<div class="panel-body"> 
						<p>Default number of posts to show per page:</p> 
						<input type="text" class="form-control" name="posts_per_page" id="posts_per_page" placeholder="# of Posts Per Page" value="@if(!empty($settings->posts_per_page)){{ $settings->posts_per_page }}@endif" />
					</div>
				</div>
			</div>

		</div>

		<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
			<div class="panel-title">System Email</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body" style="display: block;"> 
				<p>Email address to be used to send system emails:</p> 
				<input type="text" class="form-control" name="system_email" id="system_email" placeholder="Email Address" value="@if(!empty($settings->system_email)){{ $settings->system_email }}@endif" />
			</div> 
		</div>

		<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
			<div class="panel-title">Social Networks</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body" style="display: block;"> 
				
				<p>Facebook Page ID: ex. facebook.com/page_id (without facebook.com):</p> 
				<input type="text" class="form-control" name="facebook_page_id" id="facebook_page_id" placeholder="Facebook Page" value="@if(!empty($settings->facebook_page_id)){{ $settings->facebook_page_id }}@endif" />
				<br />
				<p>Google Plus User ID:</p>
				<input type="text" class="form-control" name="google_page_id" id="google_page_id" placeholder="Google Plus Page" value="@if(!empty($settings->google_page_id)){{ $settings->google_page_id }}@endif" />
				<br />
				<p>Twitter Username:</p>
				<input type="text" class="form-control" name="twitter_page_id" id="twitter_page_id" placeholder="Twitter Username" value="@if(!empty($settings->twitter_page_id)){{ $settings->twitter_page_id }}@endif" />
				<br />
				<p>YouTube Channel ex. youtube.com/channel_name:</p>
				<input type="text" class="form-control" name="youtube_page_id" id="youtube_page_id" placeholder="YouTube Channel" value="@if(!empty($settings->youtube_page_id)){{ $settings->youtube_page_id }}@endif" />
			
			</div> 
		</div>

		<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
			<div class="panel-title">Google Analytics Tracking ID</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body" style="display: block;"> 
				
				<p>Google Analytics Tracking ID (ex. UA-12345678-9)::</p> 
				<input type="text" class="form-control" name="google_tracking_id" id="google_tracking_id" placeholder="Google Analytics Tracking ID" value="@if(!empty($settings->google_tracking_id)){{ $settings->google_tracking_id }}@endif" />
				
			</div> 
		</div>

		<div class="panel panel-primary" data-collapsed="0"> <div class="panel-heading"> 
			<div class="panel-title">Google Analytics API Integration (This will integrate with your dashboard analytics)</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body" style="display: block;"> 
				
				<p>Google Oauth Client ID Key:</p> 
				<input type="text" class="form-control" name="google_oauth_key" id="google_oauth_key" placeholder="Google Client ID Key" value="@if(!empty($settings->google_oauth_key)){{ $settings->google_oauth_key }}@endif" />
				

			</div> 
		</div>

		<input type="hidden" name="_token" value="<?= csrf_token() ?>" />
		<input type="submit" value="Update Settings" class="btn btn-success pull-right" />

	</form>

	<div class="clear"></div>

</div><!-- admin-container -->

@section('javascript')
	<script src="{{ '/application/assets/admin/js/bootstrap-switch.min.js' }}"></script>
	<script type="text/javascript">

		$ = jQuery;

		$(document).ready(function(){

			$('input[type="checkbox"]').change(function() {
				if($(this).is(":checked")) {
			    	$(this).val(1);
			    } else {
			    	$(this).val(0);
			    }
			    console.log('test ' + $(this).is( ':checked' ));
			});

		});

	</script>

@stop

@stop