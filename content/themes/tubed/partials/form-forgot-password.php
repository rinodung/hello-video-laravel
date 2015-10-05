<h3 class="col-md-10 col-md-offset-2 right-content-10 header">Reset Password</h3>

<div class="col-md-10 col-md-offset-2 right-content-10">

    <?php if (Session::has('notification')): ?>
        <span class="notification"><?= Session::get('notification') ?></span>
    <?php endif; ?>
     

    <form method="POST" action="<?= ($settings->enable_https) ? secure_url('password/reset') : URL::to('password/reset') ?>" accept-charset="UTF-8" class="form-signin">
        <?php if (Session::has('error')): ?>
          <span class="error"><?= trans(Session::get('reason')) ?></span>
        <?php elseif (Session::has('success')): ?>
          <span class="success"><?= Lang::get('lang.email_sent') ?></span>
        <?php endif; ?>
        <p>Enter your email address and we'll send you a password reset link</p><br />
        <input name="email" type="text" class="form-control" placeholder="Email Address">
        <input name="_token" type="hidden" value="<?php echo csrf_token(); ?>">
        <button class="btn btn-lg btn-primary btn-block password-reset-btn" type="submit">Send Password Reset</button>
     
    </form>

</div>