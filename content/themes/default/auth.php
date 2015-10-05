<?php include('includes/header.php'); ?>

	<?php if($type == 'login'): ?>

		<h2 class="form-signin-heading">Please Login</h2>
		<form method="post" action="<?= ($settings->enable_https) ? secure_url('login') : URL::to('login') ?>" class="form-signin">
		    <input type="text" class="form-control" placeholder="Email address or Username" tabindex="0" id="email" name="email" value="<?php if($settings->demo_mode == 1): ?>demo<?php endif; ?>">
		    <input type="password" class="form-control" placeholder="Password" id="password" name="password" value="<?php if($settings->demo_mode == 1): ?>demo<?php endif; ?>">
		    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		    <br />
		    <input type="hidden" id="redirect" name="redirect" value="<?= Input::get('redirect') ?>" />
		    <a href="<?= ($settings->enable_https) ? secure_url('password/reset') : URL::to('password/reset') ?>">Forgot Password?</a>
		    <?php if($settings->demo_mode == 1): ?>
				<div class="alert alert-info demo-info" role="alert">
					<p class="title">Demo Login</p>
					<p><strong>username:</strong> <span>demo</span></p>
					<p><strong>password:</strong> <span>demo</span></p>
				</div>
			<?php endif; ?>
			<input type="hidden" name="_token" value="<?= csrf_token() ?>" />
		</form>

	<?php elseif($type == 'signup'): ?>

		<?php include('partials/signup.php'); ?>

	<!-- SHOW FORGOT PASSWORD FORM -->
	<?php elseif($type == 'forgot_password'): ?>

		<?php include('partials/form-forgot-password.php'); ?>

	<!-- SHOW RESET PASSWORD FORM -->
	<?php elseif($type == 'reset_password'): ?>

		<?php include('partials/form-reset-password.php'); ?>

	<?php endif; ?>

<?php include('includes/footer.php'); ?>