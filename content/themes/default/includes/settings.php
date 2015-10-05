<?php if(Auth::user()->role == 'admin' || Auth::user()->role == 'demo'): ?>

<style type="text/css">
.code_editor{
	min-height:300px;
}
</style>

	<div class="admin-section-title">
		<h3><i class="entypo-monitor"></i> Theme Settings for Default Theme</h3> 
	</div>
	<div class="clear"></div>

	<form action="/admin/theme_settings" method="post">
		
		<div class="panel panel-primary" data-collapsed="0"> 
			<div class="panel-heading"> <div class="panel-title"> Theme Settings</div> <div class="panel-options"> <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a> </div></div> 
			<div class="panel-body"> 
				<p>Add the text to be added to the theme homepage header text Above the Homepage subscribe button</p>
				<input type="text" id="homepage_headline" class="form-control" name="home_headline" value="<?php if(isset($theme_settings->home_headline)){ echo $theme_settings->home_headline; } ?>" />
				<br />

				<p>Homepage Subheadline Text</p>
				<input type="text" id="homepage_subheadline" class="form-control" name="homepage_subheadline" value="<?php if(isset($theme_settings->homepage_subheadline)){ echo $theme_settings->homepage_subheadline; } ?>" />

				<br />
				<p>Subscribe button text on the homepage</p>
				<input type="text" id="home_button_text" class="form-control" name="home_button_text" value="<?php if(isset($theme_settings->home_button_text)){ echo $theme_settings->home_button_text; } ?>" />
				
				<br />
				<p>Subscribe button text on the homepage when user is already subscribed</p>
				<input type="text" id="home_button_text_logged_in" class="form-control" name="home_button_text_logged_in" value="<?php if(isset($theme_settings->home_button_text_logged_in)){ echo $theme_settings->home_button_text_logged_in; } ?>" />

				<br />
				<p>Footer Site Description (This is the description of your site that will show up on the footer to the left)</p>
				<textarea id="footer_description" class="form-control" name="footer_description"><?php if(isset($theme_settings->footer_description)){ echo $theme_settings->footer_description; } ?> </textarea>

				<br />
				<p>Signup Message (Above the signup form)</p>
				<input type="text" id="signup_message" class="form-control" name="signup_message" value="<?php if(isset($theme_settings->signup_message)){ echo $theme_settings->signup_message; } ?>" />

				<br />
				<p>Disqus comments shortname (signup at <a href="http://www.disqus.com" target="_blank">disqus.com</a> to get a shortname)</p>
				<input type="text" id="disqus_shortname" class="form-control" name="disqus_shortname" value="<?php if(isset($theme_settings->disqus_shortname)){ echo $theme_settings->disqus_shortname; } ?>" />

				<br />
				<p>Main Theme Color (includes default buttons, links, headers, etc)</p>
				<div class="input-group color-picker">
					<input type="text" class="form-control" id="color" name="color" data-format="hex" value="<?php if(isset($theme_settings->color)){ echo $theme_settings->color; } ?>" />
					
					<div class="input-group-addon">
						<i class="color-preview"></i>
					</div>
				</div>

				<br />
				<p>Custom CSS for this Theme</p>
				<textarea name="custom_css"><?php if(isset($theme_settings->custom_css)){ echo $theme_settings->custom_css; } ?></textarea>
				<pre class="code_editor" id="custom_css" style="min-height:300px;"><?php if(isset($theme_settings->custom_css)){ echo $theme_settings->custom_css; } ?></pre>

				<br />
				<p>Custom Javascript for this Theme</p>
				<textarea name="custom_js"><?php if(isset($theme_settings->custom_js)){ echo $theme_settings->custom_js; } ?></textarea>
				<pre class="code_editor" id="custom_js"><?php if(isset($theme_settings->custom_js)){ echo $theme_settings->custom_js; } ?></pre>

				<input type="hidden" name="_token" value="<?= csrf_token() ?>" />
				<br />
				<input type="submit" value="Update Theme Settings" class="btn btn-success pull-right" />
			</div>
		</div>


	</form>

	<script src="<?= ($settings->enable_https) ? secure_url('/') : URL::to('/') ?><?= THEME_URL ?>/assets/js/ace/ace.js" type="text/javascript" charset="utf-8"></script>
	<script>
	    var editor = ace.edit("custom_css");
	    editor.setTheme("ace/theme/textmate");
		editor.getSession().setMode("ace/mode/css");

		var textarea = $('textarea[name="custom_css"]').hide();
		editor.getSession().setValue(textarea.val());
		editor.getSession().on('change', function(){
		  textarea.val(editor.getSession().getValue());
		});

		var editor2 = ace.edit("custom_js");
	    editor2.setTheme("ace/theme/textmate");
		editor2.getSession().setMode("ace/mode/javascript");

		var textarea2 = $('textarea[name="custom_js"]').hide();
		editor2.getSession().setValue(textarea2.val());
		editor2.getSession().on('change', function(){
		  textarea2.val(editor2.getSession().getValue());
		});

	</script>

<?php endif; ?>